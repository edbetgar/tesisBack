<?php

use Illuminate\Support\Facades\Route;


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

