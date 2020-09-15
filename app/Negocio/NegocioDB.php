<?php

namespace App\Negocio;

use App\Models\AppDatAgenda;
use App\Models\AppDatCliente;
use App\Models\AppDatPlanAgenda;
use App\Models\AppDatPlanServicio;
use App\Models\AppDatPrereserva;
use App\Models\AppDatServicioReal;
use App\Models\AppDatValoracion;
use App\Modules\WSO2Client\WSO2Client;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class NegocioDB
{
    public static function checkearDisponibilidadPlanificados()
    {
        $ids = [];
        $plan_servicios = AppDatPlanServicio::
        where('fecha_reservacion', '>', Carbon::now())
            ->whereNull('deleted_at')
            ->where('publico', '=', 1)
            ->select(['id', 'cantidad'])
            ->get();
        foreach ($plan_servicios as $plan_servicio) {
            $cantidad_agendados = AppDatPlanAgenda::
            where('id_dat_plan_servicio', '=', $plan_servicio->id)
                ->whereNull('deleted_at')
                ->select('*')
                ->count('*');
            if ($cantidad_agendados < $plan_servicio->cantidad) {
                array_push($ids, $plan_servicio->id);
            }
        }
        return $ids;
    }

    public static function obtenerServiciosConDisponibilidad($id_establecimiento)
    {
        $servicios = DB::table('app_dat_plan_servicios as ps')
            ->leftJoin('app_dat_plan_agenda as dpa', 'dpa.id_dat_plan_servicio', '=', 'ps.id')
            ->leftJoin('app_dat_agenda as da', 'da.id', '=', 'dpa.id_dat_agenda')
            ->leftJoin('app_dat_turnos_servicios as ts', 'ps.id_turno_servicio', '=', 'ts.id')
            ->leftJoin('app_dat_locales_servicios as ls', 'ts.id_local_servicio', '=', 'ls.id')
            ->leftJoin('app_dat_servicios as ds', 'ls.id_servicio', '=', 'ds.id')
            ->leftJoin('app_nom_tipo_servicios as nts', 'nts.id', '=', 'ds.id_tipo_servicio')
            ->leftJoin('app_dat_entidades as de', 'de.id', '=', 'ds.id_entidad')
            ->leftJoin('app_dat_locales as dl', 'dl.id', '=', 'ls.id_local')
            ->whereNull('da.deleted_at')
            ->whereIn('ps.id', NegocioDB::checkearDisponibilidadPlanificados())
            ->where('ls.id_local', '=', $id_establecimiento)
            ->where('ps.publico', '=', 1)
            ->select([
                'ls.id as id',
                'ls.precio as precio',
                'ds.denominacion as nombre',
                'nts.denominacion as tipo_servicio',
                //'dl.id_dpa as dpa',
            ])
            ->groupBy('id')
            ->get();
        /*$servicios->each(function ($servicio) use ($hashed) {
           $dpa = WSO2Client::getMunicipio($hashed, $servicio->dpa);
            $provincia = WSO2Client::getProvincia($hashed, $dpa->id_provincia);
            try {
                $servicio->provincia = $provincia->nombre_provincia;
                $servicio->municipio = $dpa->nombre_municipio;
            } catch (\Exception $exp) {
                $servicio->dpa = "";
            }
            //unset($servicio->dpa);
        });*/
        return $servicios;
    }

    public static function getDetalleServicio($id_local_servicio)
    {
        $detallesServicio = DB::table('app_dat_turnos_servicios as ts')
            ->leftJoin('app_dat_locales_servicios as ls', 'ts.id_local_servicio', '=', 'ls.id')
            ->leftJoin('app_dat_servicios as ds', 'ls.id_servicio', '=', 'ds.id')
            ->leftJoin('app_nom_tipo_servicios as nts', 'nts.id', '=', 'ds.id_tipo_servicio')
            ->leftJoin('app_dat_entidades as de', 'de.id', '=', 'ds.id_entidad')
            ->leftJoin('app_dat_entidades as den', 'den.id', '=', 'ds.id_entidad')
            ->leftJoin('app_dat_locales as dl', 'dl.id', '=', 'ls.id_local')
            ->leftJoin('app_dat_recursos_servicios as rs', 'rs.id_turno_servicio', '=', 'ts.id')
            ->leftJoin('app_dat_recurso_general as rg', 'rg.id', '=', 'rs.id_rec')
            ->leftJoin('app_dat_distribucion_recursos as dr', 'dr.id', '=', 'rg.id')
            ->leftJoin('app_dat_distribucion_turnos as dt', 'dt.id_turno_servicio', '=', 'ts.id')
            ->where('ts.id_local_servicio', '=', $id_local_servicio)
            ->select([
                    'ts.id_local_servicio as id',
                    'ls.precio as precio',
                    'ds.denominacion as nombre',
                    'ds.descripcion as descripcion',
                    'dl.denominacion as establecimiento',
                    'nts.denominacion as tipo_servicio',
                    'dl.telefono as telefono',
                    'dl.email as email',
                    'dl.id_dpa as dpa'
                ]
            )
            ->first();
        //TODO 1- Obtener id_dpa segun la ubicacion de la (provincia, municipio o consejo_popular)
        $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $dpa = WSO2Client::getMunicipio($hashed, $detallesServicio->dpa);
        $provincia = WSO2Client::getProvincia($hashed, $dpa->id_provincia);
        try {
            $detallesServicio->provincia = $provincia->nombre_provincia;
            $detallesServicio->municipio = $dpa->nombre_municipio;
        } catch (\Exception $exp) {
            $detallesServicio->dpa = "";
        }
        unset($detallesServicio->dpa);
        return $detallesServicio;
    }

    public static function getServiciosByProvincia($organismo, $ids_municipio)
    {
        $servicios = DB::table('app_dat_plan_servicios as ps')
            ->leftJoin('app_dat_plan_agenda as dpa', 'dpa.id_dat_plan_servicio', '=', 'ps.id')
            ->leftJoin('app_dat_agenda as da', 'da.id', '=', 'dpa.id_dat_agenda')
            ->leftJoin('app_dat_turnos_servicios as ts', 'ps.id_turno_servicio', '=', 'ts.id')
            ->leftJoin('app_dat_locales_servicios as ls', 'ts.id_local_servicio', '=', 'ls.id')
            ->leftJoin('app_dat_servicios as ds', 'ls.id_servicio', '=', 'ds.id')
            ->leftJoin('app_nom_tipo_servicios as nts', 'nts.id', '=', 'ds.id_tipo_servicio')
            ->leftJoin('app_dat_entidades as de', 'de.id', '=', 'ds.id_entidad')
            ->leftJoin('app_dat_locales as dl', 'dl.id', '=', 'ls.id_local')
            ->where('ps.publico', '=', 1)
            ->whereNull('da.deleted_at')
            ->where('de.id_organismo', '=', $organismo)
            ->where('ps.fecha_reservacion', '>', Carbon::now())
            ->whereIn('dl.id_dpa', $ids_municipio)
            ->select(
                'ps.id as id',
                'ps.cantidad as cantidad'
            )
            ->groupBy('id')
            ->get();
        $r = [];
        foreach ($servicios as $servicio) {
            if (($servicio->cantidad - DB::table('app_dat_plan_agenda')
                        ->where('id_dat_plan_servicio', '=', $servicio->id)
                        ->count()) > 0) {
                array_push($r, $servicio->id);
            }
        }
        $servicios = DB::table('app_dat_plan_servicios as ps')
            ->leftJoin('app_dat_plan_agenda as dpa', 'dpa.id_dat_plan_servicio', '=', 'ps.id')
            ->leftJoin('app_dat_agenda as da', 'da.id', '=', 'dpa.id_dat_agenda')
            ->leftJoin('app_dat_turnos_servicios as ts', 'ps.id_turno_servicio', '=', 'ts.id')
            ->leftJoin('app_dat_locales_servicios as ls', 'ts.id_local_servicio', '=', 'ls.id')
            ->leftJoin('app_dat_servicios as ds', 'ls.id_servicio', '=', 'ds.id')
            ->leftJoin('app_nom_tipo_servicios as nts', 'nts.id', '=', 'ds.id_tipo_servicio')
            ->leftJoin('app_dat_entidades as de', 'de.id', '=', 'ds.id_entidad')
            ->leftJoin('app_dat_locales as dl', 'dl.id', '=', 'ls.id_local')
            ->where('ps.publico', '=', 1)
            ->whereNull('da.deleted_at')
            ->whereIn('ps.id', $r)
            ->select([
                    'dl.id as id_local',
                    'dl.denominacion as denominacion',
                    'dl.direccion as direccion',
                ]
            )
            ->groupBy('id_local')
            ->get();
        return $servicios;
    }

    public static function getServiciosByMunicipio($organismo, $id_municipio)
    {
        $servicios = DB::table('app_dat_plan_servicios as ps')
            ->leftJoin('app_dat_plan_agenda as dpa', 'dpa.id_dat_plan_servicio', '=', 'ps.id')
            ->leftJoin('app_dat_agenda as da', 'da.id', '=', 'dpa.id_dat_agenda')
            ->leftJoin('app_dat_turnos_servicios as ts', 'ps.id_turno_servicio', '=', 'ts.id')
            ->leftJoin('app_dat_locales_servicios as ls', 'ts.id_local_servicio', '=', 'ls.id')
            ->leftJoin('app_dat_servicios as ds', 'ls.id_servicio', '=', 'ds.id')
            ->leftJoin('app_nom_tipo_servicios as nts', 'nts.id', '=', 'ds.id_tipo_servicio')
            ->leftJoin('app_dat_entidades as de', 'de.id', '=', 'ds.id_entidad')
            ->leftJoin('app_dat_locales as dl', 'dl.id', '=', 'ls.id_local')
            ->where('ps.publico', '=', 1)
            //->whereNull('da.id')
            ->whereNull('da.deleted_at')
            ->where('de.id_organismo', '=', $organismo)
            ->where('ps.fecha_reservacion', '>', Carbon::now())
            ->where('dl.id_dpa', '=', $id_municipio)
            ->select(
                'ps.id as id',
                'ps.cantidad as cantidad'
            )
            ->groupBy('id')
            ->get();
        $r = [];
        foreach ($servicios as $servicio) {
            if (($servicio->cantidad - DB::table('app_dat_plan_agenda')
                        ->where('id_dat_plan_servicio', '=', $servicio->id)
                        ->count()) > 0) {
                array_push($r, $servicio->id);
            }
        }
        $servicios = DB::table('app_dat_plan_servicios as ps')
            ->leftJoin('app_dat_plan_agenda as dpa', 'dpa.id_dat_plan_servicio', '=', 'ps.id')
            ->leftJoin('app_dat_agenda as da', 'da.id', '=', 'dpa.id_dat_agenda')
            ->leftJoin('app_dat_turnos_servicios as ts', 'ps.id_turno_servicio', '=', 'ts.id')
            ->leftJoin('app_dat_locales_servicios as ls', 'ts.id_local_servicio', '=', 'ls.id')
            ->leftJoin('app_dat_servicios as ds', 'ls.id_servicio', '=', 'ds.id')
            ->leftJoin('app_nom_tipo_servicios as nts', 'nts.id', '=', 'ds.id_tipo_servicio')
            ->leftJoin('app_dat_entidades as de', 'de.id', '=', 'ds.id_entidad')
            ->leftJoin('app_dat_locales as dl', 'dl.id', '=', 'ls.id_local')
            ->where('ps.publico', '=', 1)
            ->whereNull('da.deleted_at')
            ->whereIn('ps.id', $r)
            ->select([
                    'dl.id as id_local',
                    'dl.denominacion as denominacion',
                    'dl.direccion as direccion',
                ]
            )
            ->groupBy('id_local')
            ->get();
        return $servicios;
    }

    public static function getProveedoresByIDServicio($id_local_servicio)
    {
        //TODO 1- Obtener lista de proveedores del servicio por id_servicio
        $planes = DB::table('app_dat_plan_servicios as ps')
            ->leftJoin('app_dat_plan_agenda as dpa', 'dpa.id_dat_plan_servicio', '=', 'ps.id')
            ->leftJoin('app_dat_agenda as da', 'da.id', '=', 'dpa.id_dat_agenda')
            ->leftJoin('app_dat_turnos_servicios as ts', 'ps.id_turno_servicio', '=', 'ts.id')
            ->leftjoin('app_dat_recursos_servicios as rs', 'rs.id_turno_servicio', '=', 'ts.id')
            ->leftJoin('app_dat_locales_servicios as ls', 'ts.id_local_servicio', '=', 'ls.id')
            ->where('ps.publico', '=', 1)
            ->whereNull('da.deleted_at')
            ->where('ps.fecha_reservacion', '>', Carbon::now())
            ->where('ls.id', '=', $id_local_servicio)
            ->whereIn('ps.id', NegocioDB::checkearDisponibilidadPlanificados())
            ->select([
                'ps.id as id',
                'ps.cantidad as cantidad',
                'ps.fecha_reservacion as fecha_reservacion',
            ])
            ->distinct()
            ->get();

        $ids = [];
        foreach ($planes as $plan) {
            array_push($ids, $plan->id);
        }

        $r = DB::table('app_dat_plan_servicios as ps')
            ->leftJoin('app_dat_turnos_servicios as ts', 'ts.id', '=', 'ps.id_turno_servicio')
            ->leftJoin('app_dat_recursos_servicios as rs', 'rs.id', '=', 'ps.id_turno_servicio')
            ->leftjoin('app_dat_recurso_general as rg', 'rg.id', '=', 'rs.id_recurso')
            ->where('ps.publico', '=', 1)
            ->whereIn('ps.id', $ids)
            ->whereNotNull('rg.id')
            ->distinct()
            ->select([
                'rg.id as id_recurso',
                'rg.tipo as tipo_recurso',
                'rs.id as id_recurso_servicio'
            ])
            ->get();

        return $r;

    }

    public static function getDiasDisponiblesByIDServicio($id_local_servicio, $proveedor)
    {
        if ($proveedor == null || $proveedor == "") {
            $fechas = DB::table('app_dat_plan_servicios as ps')
                ->leftJoin('app_dat_plan_agenda as dpa', 'dpa.id_dat_plan_servicio', '=', 'ps.id')
                ->leftJoin('app_dat_agenda as da', 'da.id', '=', 'dpa.id_dat_agenda')
                ->leftJoin('app_dat_turnos_servicios as ts', 'ps.id_turno_servicio', '=', 'ts.id')
                ->leftjoin('app_dat_recursos_servicios as rs', 'rs.id_turno_servicio', '=', 'ts.id')
                ->leftJoin('app_dat_locales_servicios as ls', 'ts.id_local_servicio', '=', 'ls.id')
                ->where('ps.publico', '=', 1)
                ->whereNull('da.deleted_at')
                ->where('ps.fecha_reservacion', '>', Carbon::now())
                ->where('ls.id', '=', $id_local_servicio)
                ->whereIn('ps.id', NegocioDB::checkearDisponibilidadPlanificados())
                ->select([
                    'ps.id as id_dat_plan_servicio',
                    'ps.cantidad as cantidad',
                    'ps.fecha_reservacion as fecha_reservacion',
                ])
                ->distinct()
                ->get();
        } else {
            $fechas = DB::table('app_dat_plan_servicios as ps')
                ->leftJoin('app_dat_plan_agenda as dpa', 'dpa.id_dat_plan_servicio', '=', 'ps.id')
                ->leftJoin('app_dat_agenda as da', 'da.id', '=', 'dpa.id_dat_agenda')
                ->leftJoin('app_dat_turnos_servicios as ts', 'ps.id_turno_servicio', '=', 'ts.id')
                ->leftjoin('app_dat_recursos_servicios as rs', 'rs.id_turno_servicio', '=', 'ts.id')
                ->leftJoin('app_dat_locales_servicios as ls', 'ts.id_local_servicio', '=', 'ls.id')
                ->where('ps.publico', '=', 1)
                ->whereNull('da.deleted_at')
                ->where('rs.id_recurso', '=', $proveedor)
                ->where('ps.fecha_reservacion', '>', Carbon::now())
                ->where('ls.id', '=', $id_local_servicio)
                ->whereIn('ps.id', NegocioDB::checkearDisponibilidadPlanificados())
                ->select([
                    'ps.id as id_dat_plan_servicio',
                    'ps.cantidad as cantidad',
                    'ps.fecha_reservacion as fecha_reservacion',
                ])
                ->distinct()
                ->get();
        }
        $fechas->each(function ($fecha) {
            $r = new \DateTime($fecha->fecha_reservacion);
            $fecha->fecha_reservacion = $r->format('Y-m-d');
            $fecha->disponibles = $fecha->cantidad - (AppDatPlanAgenda::
                where('id_dat_plan_servicio', '=', $fecha->id_dat_plan_servicio)
                    ->select('*')
                    ->count('*'));
        });
        //TODO 1- Listar dias disponibles para el servicio segun id_servicio
        return $fechas;
    }

    public static function getTurnosDisponiblesByIDServicio($id_local_servicio, $plan)
    {
        //TODO 1- Listar turnos disponibles del servicio segun su id_servicio y plan_servicio
        return
            DB::table('app_dat_plan_servicios as ps')
                ->leftJoin('app_dat_plan_agenda as dpa', 'dpa.id_dat_plan_servicio', '=', 'ps.id')
                ->leftJoin('app_dat_agenda as da', 'da.id', '=', 'dpa.id_dat_agenda')
                ->leftJoin('app_dat_turnos_servicios as ts', 'ps.id_turno_servicio', '=', 'ts.id')
                ->leftJoin('app_dat_turnos as dts', 'ts.id_turno', '=', 'dts.id')
                ->leftJoin('app_dat_locales_servicios as ls', 'ts.id_local_servicio', '=', 'ls.id')
                ->where('ps.publico', '=', 1)
                ->whereNull('da.deleted_at')
                ->where('ls.id', '=', $id_local_servicio)
                ->where('ps.id', '=', $plan)
                ->distinct()
                ->select([
                    'dts.id as id_turno',
                    'dts.denominacion as denominacion_turno',
                ])
                ->get();
    }

    public static function reservarServicio(Request $request)
    {
        DB::beginTransaction();
        try {
            //TODO 1- Reservar un servicio
            $p = AppDatPlanServicio::find($request->input('id_dat_plan_servicio'));
            if (
                DB::table('app_dat_recursos_servicios')
                    ->where('id', '=', $request->input('id_recurso_servicio'))
                    ->exists()
                && AppDatPlanAgenda::
                where('id_dat_plan_servicio', '=', $p->id)
                    ->select('*')
                    ->count('*') < $p->cantidad
            ) {
                $reservacion = new AppDatAgenda();
                $plan_agenda = new AppDatPlanAgenda();
                if ($request->input('nombre') != ""
                    && $request->input('nombre') != ""
                    && $request->input('apellidos') != ""
                    && $request->input('ci') != ""
                    && $request->input('telefono') != ""
                    && $request->input('email') != ""
                ) {
                    $cliente = new AppDatCliente();
                    $cliente->nombre = $request->input('nombre');
                    $cliente->apellidos = $request->input('apellidos');
                    $cliente->ci = $request->input('ci');
                    $cliente->telefono = $request->input('telefono');
                    $cliente->email = $request->input('email');
                    $cliente->save();
                    $reservacion->id_cliente = $cliente->id;
                    $reservacion->id_usuario_wso2 = WSO2Client::getUserInfo($request->header('hashed'))->email;
                } else {
                    $reservacion->id_usuario_wso2 = WSO2Client::getUserInfo($request->header('hashed'))->email;
                }
                $reservacion->id_recurso_servicio = $request->input('id_recurso_servicio');
                $dat_plan_servicio = AppDatPlanServicio::find($request->input('id_dat_plan_servicio'));
                $reservacion->fecha_inicio_cita = $dat_plan_servicio->fecha_reservacion;
                $reservacion->id_dat_plan_agenda = $request->input('id_dat_plan_servicio');
                $reservacion->save();

                $plan_agenda->id_dat_agenda = $reservacion->id;
                $plan_agenda->id_dat_plan_servicio = $dat_plan_servicio->id;
                $plan_agenda->save();


                DB::commit();
                return ['success' => true, 'message' => 'Su cita se ha reservado satisfactoriamente'];
            }
            return ['success' => false, 'message' => 'No ha sido posible realizar su reservación'];
        } catch (\Exception $exp) {
            DB::rollBack();
            DB::commit();
            return ['success' => false, 'message' => 'No ha sido posible realizar su reservación con fallo'];
        }

    }

    public static function reservarMultipleServicioConCopiaDeCliente($dataReservaciones, $dataCliente, $id_usuario_wso2)
    {
        $dataCliente = (object)$dataCliente;
        $dataReservaciones = (object)$dataReservaciones;

        DB::beginTransaction();
        try {
            $hasClient = false;
            if (isset($dataCliente)) {
                if (
                    isset($dataCliente->nombre) && $dataCliente->nombre != "" &&
                    isset($dataCliente->apellidos) && $dataCliente->apellidos != "" &&
                    isset($dataCliente->ci) && $dataCliente->ci != ""
                ) {

                    $cliente = new AppDatCliente();
                    $cliente->nombre = $dataCliente->nombre;
                    $cliente->apellidos = $dataCliente->apellidos;
                    $cliente->ci = $dataCliente->ci;
                    $cliente->telefono = $dataCliente->telefono;
                    $cliente->email = $dataCliente->email;
                    $cliente->save();
                    $hasClient = true;

                }
            }

            foreach ($dataReservaciones as $dataReservacion) {
                //TODO 1- Reservar un servicio
                $dataReservacion = (object)$dataReservacion;
                if (isset($dataReservacion) && $dataReservacion->cantidad > 0) {
                    $p = AppDatPlanServicio::find($dataReservacion->id_dat_plan_servicio);
                    $reservacion = new AppDatAgenda();
                    //Si existe un beneficiario
                    if ($hasClient) {
                        //Asociar beneficiario a la reservacion
                        $reservacion->id_cliente = $cliente->id;
                        //Asociar la reservacion al usuario
                        $reservacion->id_usuario_wso2 = $id_usuario_wso2;
                    } else {
                        //Asociar la reservacion al usuario
                        $reservacion->id_usuario_wso2 = $id_usuario_wso2;
                    }
                    //Guardar el id de reservacion en la agenda
                    $reservacion->save();

                    for ($i = 0; $i < $dataReservacion->cantidad; $i++) {
                        //Checkear si el id_recurso_servicio existe
                        // y si existe disponibilidad en la agenda
                        if (
                            DB::table('app_dat_recursos_servicios')
                                ->where('id', '=', $dataReservacion->id_recurso_servicio)
                                ->exists()
                            && AppDatPlanAgenda::
                            where('id_dat_plan_servicio', '=', $p->id)
                                ->select('*')
                                ->count('*') < $p->cantidad
                        ) {
                            $plan_agenda = new AppDatPlanAgenda();
                            $plan_agenda->id_recurso_servicio = $dataReservacion->id_recurso_servicio;
                            $plan_agenda->id_dat_agenda = $reservacion->id;
                            $plan_agenda->id_dat_plan_servicio = $p->id;
                            $plan_agenda->save();
                        }
                    }
                }
            }
            DB::commit();
            return ['success' => true, 'message' => 'Reservaciones realizadas satisfactoriamente'];
        } catch (\Exception $exp) {
            DB::rollBack();
            return ['success' => false, 'message' => 'No ha sido posible realizar su reservación con fallo'];
        }

    }

    public static function reservarMultipleServicio($dataReservaciones, $dataCliente, $id_usuario_wso2)
    {
        $dataCliente = (object)$dataCliente;
        $dataReservaciones = (object)$dataReservaciones;

        DB::beginTransaction();
        try {
            $hasClient = false;
            if (isset($dataCliente)) {
                if (
                    isset($dataCliente->nombre) && $dataCliente->nombre != "" &&
                    isset($dataCliente->apellidos) && $dataCliente->apellidos != "" &&
                    isset($dataCliente->ci) && $dataCliente->ci != ""
                ) {

                    if (DB::table('app_dat_cliente')->where('ci', '=', $dataCliente->ci)->exists()) {
                        $cliente = AppDatCliente::where('ci', '=', $dataCliente->ci)->first();
                        $hasClient = true;
                    } else {
                        $cliente = new AppDatCliente();
                        $cliente->nombre = $dataCliente->nombre;
                        $cliente->apellidos = $dataCliente->apellidos;
                        $cliente->ci = $dataCliente->ci;
                        $cliente->telefono = $dataCliente->telefono;
                        $cliente->email = $dataCliente->email;
                        $cliente->save();
                        $hasClient = true;
                    }
                }
            }

            foreach ($dataReservaciones as $dataReservacion) {
                //TODO 1- Reservar un servicio
                $dataReservacion = (object)$dataReservacion;
                if (isset($dataReservacion) && $dataReservacion->cantidad > 0) {
                    $p = AppDatPlanServicio::find($dataReservacion->id_dat_plan_servicio);
                    $reservacion = new AppDatAgenda();
                    //Si existe un beneficiario
                    if ($hasClient) {
                        //Asociar beneficiario a la reservacion
                        $reservacion->id_cliente = $cliente->id;
                        //Asociar la reservacion al usuario
                        $reservacion->id_usuario_wso2 = $id_usuario_wso2;
                    } else {
                        //Asociar la reservacion al usuario
                        $reservacion->id_usuario_wso2 = $id_usuario_wso2;
                    }
                    //Guardar el id de reservacion en la agenda
                    $reservacion->save();

                    for ($i = 0; $i < $dataReservacion->cantidad; $i++) {
                        //Checkear si el id_recurso_servicio existe
                        // y si existe disponibilidad en la agenda
                        if (
                            DB::table('app_dat_recursos_servicios')
                                ->where('id', '=', $dataReservacion->id_recurso_servicio)
                                ->exists()
                            && AppDatPlanAgenda::
                            where('id_dat_plan_servicio', '=', $p->id)
                                ->select('*')
                                ->count('*') < $p->cantidad
                        ) {
                            $plan_agenda = new AppDatPlanAgenda();
                            $plan_agenda->id_recurso_servicio = $dataReservacion->id_recurso_servicio;
                            $plan_agenda->id_dat_agenda = $reservacion->id;
                            $plan_agenda->id_dat_plan_servicio = $p->id;
                            $plan_agenda->save();
                        }
                    }
                }
            }
            DB::commit();
            return ['success' => true, 'message' => 'Reservaciones realizadas satisfactoriamente'];
        } catch (\Exception $exp) {
            DB::rollBack();

            return ['success' => false, 'message' => 'No ha sido posible realizar su reservación con fallo'];
        }

    }

    public static function listarReservacionesRealizadas($id_usuario_wso2, Request $request)
    {
        $agendados = [];
        $operator = "";
        if ($request->has('filterBy')) {
            switch ($request->get('filterBy')) {
                case 'new':
                    $operator = '>';
                    break;
                case 'old':
                    $operator = '<';
                    break;
            }
        }
        if ($operator == "") {
            $agendados = DB::table('app_dat_plan_agenda as dpa')
                ->leftJoin('app_dat_agenda as da', 'da.id', '=', 'dpa.id_dat_agenda')
                ->leftJoin('app_dat_plan_servicios as dp', 'dp.id', '=', 'dpa.id_dat_plan_servicio')
                ->leftJoin('app_dat_turnos_servicios as ts', 'ts.id', '=', 'dp.id_turno_servicio')
                ->leftJoin('app_dat_locales_servicios as ls', 'ls.id', '=', 'ts.id_local_servicio')
                ->leftJoin('app_dat_locales as dl', 'dl.id', '=', 'ls.id_local')
                ->leftJoin('app_dat_servicios as ds', 'ds.id', '=', 'ls.id_servicio')
                ->whereNull('da.deleted_at')
                ->where('id_usuario_wso2', '=', $id_usuario_wso2)
                ->select([
                    'da.id as id',
                    'dp.fecha_reservacion as fecha_reservacion',
                    'ds.denominacion as servicio',
                    'dl.denominacion as establecimiento',
                ])
                //->groupBy('fecha_reservacion')
                ->get();
        } else {
            $agendados = DB::table('app_dat_plan_agenda as dpa')
                ->leftJoin('app_dat_agenda as da', 'da.id', '=', 'dpa.id_dat_agenda')
                ->leftJoin('app_dat_plan_servicios as dp', 'dp.id', '=', 'dpa.id_dat_plan_servicio')
                ->leftJoin('app_dat_turnos_servicios as ts', 'ts.id', '=', 'dp.id_turno_servicio')
                ->leftJoin('app_dat_locales_servicios as ls', 'ls.id', '=', 'ts.id_local_servicio')
                ->leftJoin('app_dat_locales as dl', 'dl.id', '=', 'ls.id_local')
                ->leftJoin('app_dat_servicios as ds', 'ds.id', '=', 'ls.id_servicio')
                //->leftJoin('app_dat_turnos as dts', 'dts.id','=', 'ts.id_turno')
                ->whereNull('da.deleted_at')
                ->where('id_usuario_wso2', '=', $id_usuario_wso2)
                ->where('dp.fecha_reservacion', $operator, Carbon::now())
                ->select([
                    'da.id as id',
                    'dp.fecha_reservacion as fecha_reservacion',
                    'ds.denominacion as servicio',
                    'dl.denominacion as establecimiento',
                ])
                //->groupBy('fecha_reservacion')
                ->get();
        }
        $agendados->each(function ($agendado) {
            $agendado->cantidad = 1;
            /*$agendado->cantidad = DB::table('app_dat_agenda')
                ->leftJoin('app_dat_plan_agenda as dpa', 'dpa.id_dat_agenda', '=', 'app_dat_agenda.id')
                ->leftJoin('app_dat_plan_servicios as dp', 'dp.id', '=', 'dpa.id_dat_plan_servicio')
                ->whereNull('app_dat_agenda.deleted_at')
                ->where('dp.fecha_reservacion', '=', $agendado->fecha_reservacion)
                //->where('dpa.id_dat_agenda', '=',$agendado->id)
                ->count();*/
            $r = new \DateTime($agendado->fecha_reservacion);
            $agendado->fecha_reservacion = $r->format('Y-m-d');
        });
        return $agendados;
    }

    public static function getReservacion($id_reservacion)
    {
        $plan = DB::table('app_dat_plan_agenda')
            ->where('id_dat_agenda', '=', $id_reservacion)
            ->whereNull('deleted_at')
            ->first();

        $proveedor = DB::table('app_dat_recursos_servicios as rs')
            ->leftJoin('app_dat_recurso_general as rg', 'rg.id', '=', 'rs.id_recurso')
            ->where('rs.id', '=', $plan->id_recurso_servicio)
            ->first();


        $agendado = AppDatAgenda::
        leftJoin('app_dat_plan_agenda as dpa', 'dpa.id_dat_agenda', '=', 'app_dat_agenda.id')
            ->leftJoin('app_dat_plan_servicios as dp', 'dp.id', '=', 'dpa.id_dat_plan_servicio')
            ->leftJoin('app_dat_turnos_servicios as ts', 'ts.id', '=', 'dp.id_turno_servicio')
            ->leftJoin('app_dat_recursos_servicios as rs', 'rs.id_turno_servicio', '=', 'ts.id')
            ->leftJoin('app_dat_recurso_general as rg', 'rg.id', '=', 'rs.id_recurso')
            ->leftJoin('app_dat_locales_servicios as ls', 'ls.id', '=', 'ts.id_local_servicio')
            ->leftJoin('app_dat_locales as dl', 'dl.id', '=', 'ls.id_local')
            ->leftJoin('app_dat_servicios as ds', 'ds.id', '=', 'ls.id_servicio')
            ->leftJoin('app_dat_turnos as dts', 'dts.id', '=', 'ts.id_turno')
            ->whereNull('app_dat_agenda.deleted_at')
            ->whereNotNull('ds.id')
            ->where('app_dat_agenda.id', '=', $id_reservacion)
            ->where('ds.denominacion', '<>', "")
            ->where('dl.denominacion', '<>', "")
            ->where('dts.denominacion', '<>', "")
            ->select([
                'app_dat_agenda.id_cliente as id_cliente',
                'dp.fecha_reservacion as fecha_reservacion',
                'ds.denominacion as servicio',
                'dl.denominacion as establecimiento',
                'dts.denominacion as turno',
                //    'rg.tipo as proveedor',
                'dl.id_dpa as dpa'
            ])->first();
        if (!isset($agendado->fecha_reservacion)) {
            abort(404);
        }
        $agendado->cantidad = 1;
        /*$agendado->cantidad = DB::table('app_dat_agenda')
            ->leftJoin('app_dat_plan_agenda as dpa', 'dpa.id_dat_agenda', '=', 'app_dat_agenda.id')
            ->leftJoin('app_dat_plan_servicios as dp', 'dp.id', '=', 'dpa.id_dat_plan_servicio')
            ->whereNull('app_dat_agenda.deleted_at')
            ->where('dp.fecha_reservacion', '=', $agendado->fecha_reservacion)
            //->where('dpa.id_dat_agenda', '=',$agendado->id)
            ->count();*/
        $r = new \DateTime($agendado->fecha_reservacion);
        $agendado->fecha_reservacion = $r->format('Y-m-d');

        $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $dpa = WSO2Client::getMunicipio($hashed, $agendado->dpa);
        $provincia = WSO2Client::getProvincia($hashed, $dpa->id_provincia);

        $agendado->proveedor = $proveedor->tipo;
        try {
            $agendado->provincia = $provincia->nombre_provincia;
            $agendado->municipio = $dpa->nombre_municipio;
        } catch (\Exception $exp) {
            $agendado->dpa = "";
        }
        unset($agendado->dpa);

        $agendado->cliente = null;
        if (isset($agendado->id_cliente) && $agendado->id_cliente > 0) {
            $agendado->cliente = AppDatCliente::find($agendado->id_cliente);
            unset($agendado->id_cliente);
        }

        return $agendado;
    }

    public static function cancelarReservacion($id, $cantidad)
    {
        if (!isset($cantidad) || $cantidad == null || $cantidad == 0) {
            $cantidad = 1;
        }
        DB::beginTransaction();
        try {
            if (DB::table('app_dat_plan_agenda')
                ->where('id_dat_agenda', '=', $id)
                ->whereNull('deleted_at')
                ->exists()) {
                /*$planes = DB::table('app_dat_plan_agenda as pa')
                    ->leftJoin('app_dat_plan_servicios as ps', 'ps.id', '=', 'pa.id_dat_plan_servicio')
                    ->whereNull('pa.deleted_at')
                    ->where('id_dat_agenda', '=', $id)
                    ->select([
                        'ps.*',
                    ])->get();*/
                DB::table('app_dat_agenda')->where('id', '=', $id)->delete();

                DB::commit();
                return ['success' => true, 'message' => 'Eliminado exitosamente'];

                /*if ($planes->count() >= $cantidad) {
                    $agendados = DB::table('app_dat_plan_agenda')
                        ->whereNull('deleted_at')
                        ->where('id_dat_plan_servicio', '=', $planes[0]->id)
                        ->get();
                    for ($i = 0; $i < $cantidad; $i++) {
                        DB::table('app_dat_plan_agenda')
                            ->whereNull('deleted_at')
                            ->where('id', '=', $agendados[$i]->id)
                            ->delete();
                    }
                    DB::commit();
                    return ['success' => true, 'message' => 'Eliminado exitosamente'];
                } else {
                    DB::rollBack();
                    return ['success' => false, 'message' => 'No existen tantas reservaciones'];
                }*/
            } else {
                DB::rollBack();
                return ['success' => false, 'message' => 'id_agenda no existe'];
            }
        } catch (\Exception $exp) {
            DB::rollBack();
            return ['success' => false, 'message' => $exp->getMessage()];
        }
    }

    public static function insertRating($id_usuario_wso2, Request $request)
    {

        $id_reservacion = $request->input('id_reservacion');
        $valoracion = $request->input('valoracion');
        $comentario = $request->input('comentario');

        if ($id_usuario_wso2 != ""
            && self::filtroDeComentarios($comentario)
            && self::checkRange($valoracion, 1, 5)
            && self::existAgenda($id_reservacion)) {
            $p = new AppDatValoracion();
            if (self::existRating($id_usuario_wso2, $id_reservacion)) {
                $p = self::getRating($id_usuario_wso2, $id_reservacion);
            } else {
                $p->id_local_servicio = self::findLocalServicio($id_reservacion)->id_local_servicio;
            }
            $p->id_plan_agenda = $id_reservacion;
            $p->valoracion = $valoracion;
            $p->comentario = $comentario;
            $p->id_usuario_wso2 = $id_usuario_wso2;
            $p->save();

            return ['success' => true, 'message' => 'Valoracion insertada'];
        }
        return ['success' => false, 'message' => 'No se ha podido insertar la valoracion'];

    }


    private static function filtroDeComentarios($comentario)
    {
        return true;
    }

    private static function checkRange($val, $min, $max)
    {
        if ($val >= $min && $val <= $max)
            return true;
        return false;
    }

    private static function existAgenda($id)
    {
        return DB::table('app_dat_plan_agenda')
            ->where('id_dat_agenda', '=', $id)
            ->whereNull('deleted_at')
            ->exists();
    }

    private static function existAgendaWithPlanServicioPasado($id)
    {
        return DB::table('app_dat_plan_agenda as dpa')
            ->join('app_dat_plan_servicios as dps', 'dps.id', '=', 'dpa.id_dat_agenda')
            ->where('dpa.id_dat_agenda', '=', $id)
            ->where('dps.fecha_reservacion', '>', Carbon::now()->addDay())
            ->whereNull('dpa.deleted_at')
            ->exists();
    }


    private static function existRating($id_usuario_wso2, $id_reservacion)
    {
        return DB::table('app_dat_valoraciones')
            ->where('id_plan_agenda', '=', $id_reservacion)
            ->where('id_usuario_wso2', '=', $id_usuario_wso2)
            ->exists();

    }


    private static function getRating($id_usuario_wso2, $id_reservacion)
    {
        return AppDatValoracion::where('id_plan_agenda', '=', $id_reservacion)
            ->where('id_usuario_wso2', '=', $id_usuario_wso2)
            ->first();
    }

    private static function findLocalServicio($id_reservacion)
    {
        return DB::table('app_dat_plan_agenda as dat')
            ->join('app_dat_plan_servicios as dps', 'dps.id', '=', 'dat.id_dat_plan_servicio')
            ->join('app_dat_turnos_servicios as dts', 'dts.id', '=', 'dps.id_turno_servicio')
            ->where('dat.id_dat_agenda', '=', $id_reservacion)
            ->select([
                'dts.id_local_servicio as id_local_servicio'
            ])->first();

    }

    public static function insertServicioConsumido(Request $request)
    {
        $id = $request->input('id_reservacion');

        if (self::existAgenda($id)) {
            if (self::existAgendaWithPlanServicioPasado($id)) {
                $servicioReal = new AppDatServicioReal();
                $servicioReal->id_agenda = $request->input('id_reservacion');
                $servicioReal->save();
                return ['success' => true, 'message' => 'Insercion exitosa'];
            }
            return ['success' => false, 'message' => 'El turno es muy reciente aun'];
        }
        return ['success' => false, 'message' => 'La reservacion no existe'];
    }

    //Dairo López Mollinedo
    public static function getValoraciones($id_local_servicio)
    {
        return DB::table('app_dat_valoraciones')
            ->where('id_local_servicio', '=', $id_local_servicio)
            ->whereNull('deleted_at')
            ->select([
                'id_plan_agenda', 'valoracion', 'comentario', 'created_at', 'updated_at', 'id_usuario_wso2'
            ])->get();
    }

    private static function existPlanServicio($id)
    {
        return DB::table('app_dat_plan_servicios')
            ->where('id', '=', $id)
            ->whereNull('deleted_at')
            ->exists();
    }

    public static function insertPrereserva(Request $request)
    {
        $id_plan_servicio = $request->input('id_plan_servicio');
        $cantidad = $request->input('cantidad');

        if (self::existPlanServicio($id_plan_servicio)) {
            $prereserva = new AppDatPrereserva();
            $prereserva->id_plan_servicio = $id_plan_servicio;
            $prereserva->cantidad = $cantidad;
            $prereserva->save();
            $datos_prereserva = DB::table('app_dat_prereserva as dp')
                ->leftJoin('app_dat_plan_servicios as dps', 'dp.id_plan_servicio', '=', 'dps.id')
               ->leftJoin('app_dat_turnos_servicios as dts', 'dps.id_turno_servicio', '=', 'dts.id')
                ->leftJoin('app_dat_locales_servicios as ls', 'dts.id_local_servicio', '=', 'ls.id')
                ->leftJoin('app_dat_locales as l', 'ls.id_local', '=', 'l.id')
                ->leftJoin('app_dat_entidades as de', 'l.id_entidad', '=', 'de.id')
                ->leftJoin('app_conf_prereserva as cp', 'cp.id_entidad', '=', 'de.id')
                ->leftJoin('app_conf_prereserva as confp', 'confp.id_local', '=', 'l.id')
                ->leftJoin('app_conf_prereserva as cfp', 'cfp.id_local_servicio', '=', 'ls.id')
                ->whereNull('dp.deleted_at')
                ->where('dp.id_plan_servicio', '=', $id_plan_servicio)
                ->where('dp.id', '=',$prereserva->id)
                ->select([
                    'dp.id as id',
                    'cp.tiempo as time',
                    'dp.created_at as created_date',
                ])
                ->get();

            return $datos_prereserva;
        }
    }
}
