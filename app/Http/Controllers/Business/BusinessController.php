<?php

namespace App\Http\Controllers\Business;

use App\Http\Controllers\Controller;
use App\Models\AppDatAgenda;
use App\Models\AppDatEntidade;
use App\Models\AppDatServicio;
use App\Models\AppNomBranchSector;
use App\Models\AppNomOrganismo;
use App\Modules\WSO2Client\WSO2Client;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use function Zend\Diactoros\normalizeServer;

class BusinessController extends Controller
{
// TODO-> Listado de entidades
    public function listarEntidades()
    {
        $entidades = AppDatEntidade::all();
        foreach ($entidades as $entidad) {
            //$entidad->organismo = AppNomOrganismo::find($entidad->id_organismo);
            $entidad->organismo = AppNomOrganismo::find($entidad->id_organismo);
            $entidad->nom_branch_sector = AppNomBranchSector::find($entidad->id_nom_branch_sector);
        }
        return response()->json($entidades);
    }

// TODO-> Listado de los servicios que presta dicha entidad
    public function listarServiciosEntidad($id_entidad)
    {
        return response()->json(AppDatServicio::where('id_entidad', '=', $id_entidad)->get());
    }

// TODO-> Listado de los servicios disponibles
    public function listarServiciosDisponibles()
    {

    }

// TODO-> Solicitar la reservacion
    public function solicitarReservacion(Request $request)
    {
        if (
            DB::table('app_dat_recursos_servicios')
                ->where('id', '=', $request->input('id_recurso_servicio'))
                ->exists()
            && DB::table('app_dat_plan_servicios')
                ->where('id', '=', $request->input('id_recurso_servicio'))
                ->exists()
            && !AppDatAgenda::where('id_dat_plan_servicio', '=', $request->input('id_dat_plan_servicio'))
                ->where('id_recurso_servicio', '=', $request->input('id_recurso_servicio'))
                ->exists()
        ) {
            $reservacion = new AppDatAgenda();
            $reservacion->id_recurso_servicio = $request->input('id_recurso_servicio');
            $reservacion->fecha_inicio_cita = $request->input('fecha_reservacion');
            $reservacion->id_dat_plan_servicio = $request->input('id_dat_plan_servicio');
            $reservacion->id_usuario_wso2 = WSO2Client::getUserInfo($request->header('hashed'))->email;


            $reservacion->save();
            return response()->json(['data' => $reservacion])->setStatusCode(201);
        }
        return response()->json()->setStatusCode(406);
    }

// TODO-> Ver el estado de las reservaciones
    public function listarEstadoReservaciones()
    {
        return response()->json(AppDatAgenda::all());
    }

// TODO-> Listar historial de las reservaciones realizadas
    public function listarReservacionesRealizadas(Request $request)
    {
        return response()->json(AppDatAgenda::where('id_usuario_wso2', '=', WSO2Client::getUserInfo($request->header('hashed'))));
    }

// TODO-> Actualizar reservacion
    public function actualizarReservacion()
    {
    }

// TODO -> Buscar servicios disponibles coincidentes con el patron de busqueda
    public function buscarServiciosDisponibles($search, $organismo = 1)
    {
        if(!isset($organismo)){
            $organismo = 1;
        }
        $servicios = DB::table('app_dat_plan_servicios as ps')
            ->leftJoin('app_dat_agenda as da', 'ps.id', '=', 'da.id_dat_plan_servicio')
            ->leftJoin('app_dat_turnos_servicios as ts', 'ps.id_turno_servicio', '=', 'ts.id')
            ->leftJoin('app_dat_locales_servicios as ls', 'ts.id_local_servicio', '=', 'ls.id')
            ->leftJoin('app_dat_servicios as ds', 'ls.id_servicio', '=', 'ds.id')
            ->leftJoin('app_nom_tipo_servicios as nts', 'nts.id', '=', 'ds.id_tipo_servicio')
            ->leftJoin('app_dat_entidades as de', 'de.id', '=', 'ds.id_entidad')
            ->leftJoin('app_dat_locales as dl', 'dl.id', '=', 'ls.id_local')
            ->whereNull('da.id')
            ->where('de.id_organismo', '=', $organismo)
            ->where('ps.fecha_reservacion', '>', Carbon::now())
            ->Where('ds.denominacion', 'like', '%' . $search . '%')
            ->orWhere('ds.descripcion', 'like', '%' . $search . '%')
            ->select([
                'ls.id as id',
                'ds.denominacion as nombre',
                'dl.denominacion as establecimiento',
                'nts.denominacion as tipo_servicio',
                'de.id_dpa as dpa',
            ])
            ->groupBy('ls.id')
            ->get();
        $servicios->each(function ($servicio) {
            $servicio->municipio = 'Santa Clara';
            $servicio->provincia = 'Villa Clara';
            unset($servicio->dpa);
        });
        return response()->json(
            $servicios
        );
    }

    public function listarDisponibilidadServicio($id_servicio)
    {
        return response()->json([
            'reservaciones_disponibles' =>
                DB::table('app_dat_plan_servicios as ps')
                    ->leftJoin('app_dat_agenda as da', 'ps.id', '=', 'da.id_dat_plan_servicio')
                    ->leftJoin('app_dat_turnos_servicios as ts', 'ps.id_turno_servicio', '=', 'ts.id')
                    ->leftJoin('app_dat_locales_servicios as ls', 'ts.id_local_servicio', '=', 'ls.id')
                    ->leftJoin('app_dat_servicios as ds', 'ls.id_servicio', '=', 'ds.id')
                    ->leftJoin('app_dat_entidades as de', 'de.id', '=', 'ds.id_entidad')
                    ->leftJoin('app_dat_locales as dl', 'dl.id', '=', 'ls.id_local')
                    ->where('ps.fecha_reservacion', '>', Carbon::now())
                    ->where('ds.id', '=', $id_servicio)
                    ->whereNull('da.id')
                    ->select([
                        'ps.id as id_dat_plan_servicio',
                        'ps.fecha_reservacion as fecha_reservacion',
                        'ls.id as id_local_servicio'
                    ])
                    ->get(),
            'recursos_disponibles' => DB::table('app_dat_locales_servicios')
                ->where('id_servicio', '=', $id_servicio)
                ->join('app_dat_turnos_servicios', 'app_dat_locales_servicios.id', '=', 'app_dat_turnos_servicios.id_local_servicio')
                ->join('app_dat_recursos_servicios', 'app_dat_recursos_servicios.id_turno_servicio', '=', 'app_dat_turnos_servicios.id')
                ->join('app_dat_recurso_general', 'app_dat_recurso_general.id', '=', 'app_dat_recursos_servicios.id_recurso')
                ->select(['app_dat_recurso_general.id as id_recurso', 'app_dat_recurso_general.tipo as tipo_recurso', 'app_dat_recursos_servicios.id as id_recurso_servicio'])
                ->get()
        ]);
    }

    public function listarServiciosPlanificados($id_servicio)
    {
        $r = DB::table('app_dat_agenda')->select('id_dat_plan_servicio')->get();
        $cadena = [];
        foreach ($r as $item) {
            array_push($cadena, $item->id_dat_plan_servicio);
        }
        $planificaciones = DB::table('app_dat_servicios')
            ->join('app_dat_locales_servicios', 'app_dat_servicios.id', '=', 'app_dat_locales_servicios.id_servicio')
            ->join('app_dat_turnos_servicios', 'app_dat_locales_servicios.id', '=', 'app_dat_turnos_servicios.id_local_servicio')
            ->join('app_dat_plan_servicios', 'app_dat_turnos_servicios.id', '=', 'app_dat_plan_servicios.id_turno_servicio')
            ->whereNotIn('app_dat_plan_servicios.id', $cadena)
            ->select('*')
            ->get();
        return response()->json($planificaciones->groupBy('denominacion'));
    }

    public function verDetallesServicio($id_local_servicio)
    {
        $capacidadesServicio = DB::select(
            DB::raw(
                "select resp.id_local_servicio,
                           sum(capacidades) as capacidad
                           from (
                                select
                                    ts.id_local_servicio,
                                case
                                    when dr.cantidad is not null
                                    then dr.cantidad
                                    else dt.cantidad
                                end
                                as capacidades
                         from app_dat_turnos_servicios as ts
                           left join app_dat_locales_servicios as ls on ts.id_local_servicio = ls.id
                           left join app_dat_servicios as ds on ls.id_servicio = ds.id
                           left join app_dat_entidades as de on de.id = ds.id_entidad
                           left join app_dat_locales as dl on dl.id = ls.id_local
                           left join app_dat_recursos_servicios as rs on rs.id_turno_servicio = ts.id
                           left join app_dat_recurso_general as rg on rg.id = rs.id_rec
                           left join app_dat_distribucion_recursos as dr on dr.id = rg.id
                           left join app_dat_distribucion_turnos as dt on dt.id_turno_servicio = ts.id
                         where ts.id_local_servicio = " . $id_local_servicio . ")
                         as resp -- ese elemento es el id_local_servicio que se pasa como parametro cuando el usuario selecciona un servicio de la lista resultante de la busqueda.
                           group by resp.id_local_servicio"
            )
        );
        //TODO  referencias y el promedio de evaluacion por referencias que lo ponemos despues porque esto ahora no es prioritario.
        $detallesServicio = DB::table('app_dat_turnos_servicios as ts')
            ->leftJoin('app_dat_locales_servicios as ls', 'ts.id_local_servicio', '=', 'ls.id')
            ->leftJoin('app_dat_servicios as ds', 'ls.id_servicio', '=', 'ds.id')
            ->leftJoin('app_nom_tipo_servicios as nts', 'nts.id', '=', 'ds.id_tipo_servicio')->leftJoin('app_dat_entidades as de', 'de.id', '=', 'ds.id_entidad')
            ->leftJoin('app_dat_entidades as den', 'den.id', '=', 'ds.id_entidad')
            ->leftJoin('app_dat_locales as dl', 'dl.id', '=', 'ls.id_local')
            ->leftJoin('app_dat_recursos_servicios as rs', 'rs.id_turno_servicio', '=', 'ts.id')
            ->leftJoin('app_dat_recurso_general as rg', 'rg.id', '=', 'rs.id_rec')
            ->leftJoin('app_dat_distribucion_recursos as dr', 'dr.id', '=', 'rg.id')
            ->leftJoin('app_dat_distribucion_turnos as dt', 'dt.id_turno_servicio', '=', 'ts.id')
            ->where('ts.id_local_servicio', '=', $id_local_servicio)
            ->select([
                    'ts.id_local_servicio as id',
                    'ds.denominacion as nombre',
                    'ds.descripcion as descripcion',
                    'dl.denominacion as establecimiento',
                    'nts.denominacion as tipo_servicio',
                    'den.telefono as telefono',
                    'den.email as email',
                    'den.id_dpa as dpa'
                ]
            )
            ->first();
        $detallesServicio->municipio = 'Santa Clara';
        $detallesServicio->provincia = 'Villa Clara';
        unset($detallesServicio->dpa);
        $detallesServicio->capacidades = $capacidadesServicio[0]->capacidad;
        return response()->json($detallesServicio);
    }


    public function cancelarReservacion($id)
    {
        return response()->json(AppDatAgenda::find($id)->delete())->setStatusCode(202);
    }


}
