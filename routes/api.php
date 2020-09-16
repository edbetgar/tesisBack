<?php

use Illuminate\Support\Facades\Route;




Route::apiResources([
    'app-conf-confirmacion-servicio' => 'API\\AppConfConfirmacionServicioController',
    'app-conf-prereserva' => 'API\\AppConfPrereservaController',
    'app-dat-actividades' => 'API\\AppDatActividadesController',
    'app-dat-agenda-cambiada' => 'API\\AppDatAgendaCambiadaController',
    'app-dat-agenda' => 'API\\AppDatAgendaController',
    'app-dat-agenda-interrupcion' => 'API\\AppDatAgendaInterrupcionController',
    'app-dat-agenda-prioridad' => 'API\\AppDatAgendaPrioridadController',
    'app-dat-cliente' => 'API\\AppDatClienteController',
    'app-dat-distribucion-recurso' => 'API\\AppDatDistribucionRecursoController',
    'app-dat-distribucion-turno' => 'API\\AppDatDistribucionTurnoController',
    'app-dat-entidades' => 'API\\AppDatEntidadeController',
    'app-dat-interrupciones' => 'API\\AppDatInterrupcioneController',
    'app-dat-locales' => 'API\\AppDatLocaleController',
    'app-dat-locales-servicios' => 'API\\AppDatLocalesServicioController',
    'app-dat-plan-prereserva' => 'API\\AppDatPlanPrereservaController',
    'app-dat-prereserva' => 'API\\AppDatPrereservaController',
    'app-dat-recurso' => 'API\\AppDatRecursoController',
    'app-dat-recurso-eventual' => 'API\\AppDatRecursoEventualController',
    'app-dat-recurso-general' => 'API\\AppDatRecursoGeneralController',
    'app-dat-recursos-servicios' => 'API\\AppDatRecursosServicioController',
    'app-dat-servicios' => 'API\\AppDatServicioController',
    'app-dat-servicio-real' => 'API\\AppDatServicioRealController',
    'app-dat-turnos' => 'API\\AppDatTurnoController',
    'app-dat-turnos-servicios' => 'API\\AppDatTurnoServicioController',
    'app-nom-branch-sector' => 'API\\AppNomBranchSectorController',
    'app-nom-motivo-interrupcion' => 'API\\AppNomMotivoInterrupcionController',
    'app-nom-organismos' => 'API\\AppNomOrganismoController',
    'app-nom-periodo' => 'API\\AppNomPeriodoController',
    'app-nom-prioridad' => 'API\\AppNomPrioridadController',
    'app-nom-tipo-mensaje' => 'API\\AppNomTipoMensajeController',
    'app-nom-tipo-recurso' => 'API\\AppNomTipoRecursoController',
    'app-nom-tipo-servicio' => 'API\\AppNomTipoServicioController',
]);


/*
 * API Publicada en WSO2
 * */
Route::get('disponibilidades/{id_local_servicio}', 'Business\\NegocioController@getDiasDisponiblesByIDServicio');
Route::get('turnos/{id_local_servicio}', 'Business\\NegocioController@getTurnosDisponiblesByIDServicio');
Route::get('establecimientos', 'Business\\NegocioController@listarEstablecimientosPorUbicacionLocal');
Route::get('proveedores/{id_local_servicio}', 'Business\\NegocioController@getProveedoresByIDServicio');
Route::get('servicios/{id_establecimiento}', 'Business\\NegocioController@listarServiciosPorUbicacionLocal');
Route::get('servicio/{id_local_servicio}', 'Business\\NegocioController@getServicioByIDLocal');

// TODO-> Listar historial de las reservaciones realizadas
Route::get('reservaciones', 'Business\\NegocioController@listarReservacionesRealizadas');
Route::get('reservaciones/{id}', 'Business\\NegocioController@getDetalleReservacion');
Route::delete('reservaciones/{id}', 'Business\\NegocioController@cancelarReservacion');
Route::post('reservaciones', 'Business\\NegocioController@reservarServicio');
Route::post('ratings', 'Business\\NegocioController@insertRating');
Route::get('ratings/{id}', 'Business\\NegocioController@getRatingByIdLocalServicio');
Route::post('consumed-service', 'Business\\NegocioController@insertRealService');
Route::post('prereserva', 'Business\\NegocioController@insertPrereserva');

