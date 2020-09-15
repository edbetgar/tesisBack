<?php


namespace App\Modules\CitasApiClient;


class Constants
{
    const WSO2_URL = 'https://oficina-vhabitat.xutil.cu';
    const WSO2_API = '/apps';
    const WSO2_APP = '/bienestar';
    const WSO2_USER_URI = '/oauth2/userinfo';
    const WSO2_USER_PERMISOS = '/apps/bienestar/api/permisos';
    const WSO2_TOKEN = '/oauth2/token';

    // API PERFIL
    const WSO2_API_PERFIL_USER_INFO = '/bienestar/api/users';
    const WSO2_API_PERFIL_CHECK_PERMISOS = '/bienestar/api/checking-route';

    const WSO2_API_PERFIL_PROVINCIAS = '/api/provincias';
    const WSO2_API_PERFIL_MUNICIPIOS = '/api/municipios';
    const WSO2_API_PERFIL_PROVINCIA_BY_ID = '/api/provincia/';
    const WSO2_API_PERFIL_MUNICIPIO_BY_ID = '/api/municipio/';
    const WSO2_API_PERFIL_MUNICIPIOS_BY_PROVINCIA = '/api/municipios/';
    const WSO2_API_PERFIL_CONSEJO_POPULAR_BY_MUNICIPIO = '/api/consejos-populares/';
    const WSO2_API_PERFIL_CONSEJO_POPULAR_BY_ID = '/api/consejo-popular/';
    const WSO2_API_PERFIL_DPA = '/api/ver-dpa';


    //API CITAS
    const GET_DISPONIBILIDADES = '/api/disponibilidades/'; //parametros -> {id_servicio}
    const GET_TURNOS = '/api/turnos/'; //parametros -> {id_local_servicio}
    const GET_SERVICIOS_PLANIFICADOS = '/api/servicios-planificados/'; //parametros -> {id_local_servicio}
    const GET_ESTABLECIMIENTOS = '/api/establecimientos';
    const GET_PROVEEDORES = '/api/proveedores/'; //parametros -> {id_local_servicio}
    const GET_SERVICIOS = '/api/servicios/'; //parametros -> {id_establecimiento}
    const GET_SERVICIO_INFO = '/api/servicio/'; //parametros -> {id_local_servicio}
    const GET_RESERVACIONES = '/api/reservaciones';
    const GET_RESERVACIONES_INFO = '/api/reservaciones/'; //parametros -> {id_reservacion}

}
