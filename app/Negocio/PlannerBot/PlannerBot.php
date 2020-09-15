<?php


namespace App\Negocio\PlannerBot;


use App\Models\AppDatPlanServicio;
use Carbon\Carbon;
use DateTime;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Facades\DB;
use Symfony\Component\VarDumper\Cloner\Data;

class PlannerBot
{
    const INFINITE = 999999;

    public static function dailyPlanner()
    {

        $turnos = DB::table('app_dat_servicios as ds')
            ->join('app_dat_locales_servicios as ls', 'ls.id_servicio', '=', 'ds.id')
            ->join('app_dat_turnos_servicios as ts', 'ts.id_local_servicio', '=', 'ls.id')
            ->select([
                'ts.id as id',
                'ls.dias_de_publicacion as dias_de_publicacion',
                'ls.dias_de_planificacion as dias_de_planificacion',
            ])
            ->get();


        $turnos->each(function ($turno) {
            $turno->recursos = DB::table('app_dat_recursos_servicios')
                ->where('id_turno_servicio', '=', $turno->id)
                ->get();
            if (count($turno->recursos) > 0) {
                $turno->cantidad = self::INFINITE;
                $turno->recursos->each(function ($recurso) use ($turno) {
                    /*$interrupciones = DB::table('app_dat_interrupciones')
                        ->where('id_recurso_servicio', '=', $recurso->id)
                        ->where('id_turno_servicio', '=', $turno->id)
                        ->whereNull('deleted_at')
                        ->get();
                    $interrumpido = false;
                    $interrumpido = $interrupciones->each(function ($interrupcion) {
                        $fecha_actual = Carbon::now();
                        if (!($interrupcion->fecha_desde >= $fecha_actual || $fecha_actual <= $interrupcion->fecha_hasta)) {
                            return true;
                        }
                    });*/
                    if (isset($recurso->cantidad) && $recurso->cantidad <= $turno->cantidad) {
                        $turno->cantidad = $recurso->cantidad;
                    } else {
                        $turno->cantidad = self::INFINITE;
                    }
                });
            } else {
                $distribucion = DB::table('app_dat_distribucion_turnos')
                    ->where('id_turno_servicio', '=', $turno->id)
                    ->first();
                if (!isset($distribucion))
                    $turno->cantidad = self::INFINITE;
                else
                    $turno->cantidad = $distribucion->cantidad;
            }
            $fecha = (new DateTime(date('Y-m-d')));
            $fecha->modify('+' . $turno->dias_de_planificacion . ' days');

            $t = DB::table('app_dat_plan_servicios')
                ->where('id_turno_servicio', '=', $turno->id)
                ->where('fecha_reservacion', '=', $fecha)
                ->whereNull('deleted_at')
                ->exists();
            //Crear app_dat_plan_servicio
            if (isset($turno->cantidad)
                && $turno->cantidad > 0
                && $turno->cantidad < self::INFINITE
                && !$t
            ) {
                $fecha = (new DateTime(date('Y-m-d')));
                $fecha->modify('+' . $turno->dias_de_planificacion . ' days');
                $plan_servicio = new AppDatPlanServicio();
                $plan_servicio->id_turno_servicio = $turno->id;
                $plan_servicio->id_nom_categoria_uso = $turno->id;
                $plan_servicio->fecha_reservacion = $fecha;
                $plan_servicio->cantidad = $turno->cantidad;
                $plan_servicio->save();
            }

            $turnos_a_publicar = DB::table('app_dat_plan_servicios')
                ->where('id_turno_servicio', '=', $turno->id)
                ->whereNull('deleted_at')
                ->get();

            $turnos_a_publicar->each(function ($turno_a_publicar) use ($turno) {
                $fecha = new DateTime($turno_a_publicar->fecha_reservacion);
                $fecha->modify('-' . $turno->dias_de_publicacion . ' days');


                if (Carbon::now()->format('Y-m-d') == $fecha->format('Y-m-d')) {
                    $t = AppDatPlanServicio::find($turno_a_publicar->id)->first();
                    $t->publico = 1;
                    $t->save();
                }
            });

        });
        return $turnos;
    }
}
