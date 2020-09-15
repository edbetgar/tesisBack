<?php


namespace App\Modules\WSO2Client;


class Constants
{
    const WSO2_URL = 'https://oficina-vhabitat.xutil.cu';
    const WSO2_API = '/apps';
    const WSO2_USER_URI = '/oauth2/userinfo';
    const WSO2_USER_PERMISOS = '/apps/bienestar/api/permisos';
    const WSO2_TOKEN = '/oauth2/token';

    // API PERFIL
    const WSO2_API_PERFIL_USER_INFO = '/bienestar/api/users';
    const WSO2_API_PERFIL_CHECK_PERMISOS = '/bienestar/api/checking-route';

    const WSO2_API_PERFIL_PROVINCIAS = '/bienestar/api/provincias';
    const WSO2_API_PERFIL_MUNICIPIOS = '/bienestar/api/municipios';
    const WSO2_API_PERFIL_PROVINCIA_BY_ID = '/bienestar/api/provincia/';
    const WSO2_API_PERFIL_MUNICIPIO_BY_ID = '/bienestar/api/municipio/';
    const WSO2_API_PERFIL_MUNICIPIOS_BY_PROVINCIA = '/bienestar/api/municipios/';
    const WSO2_API_PERFIL_CONSEJO_POPULAR_BY_MUNICIPIO = '/bienestar/api/consejos-populares/';
    const WSO2_API_PERFIL_CONSEJO_POPULAR_BY_ID = '/bienestar/api/consejo-popular/';
    const WSO2_API_PERFIL_DPA = '/bienestar/api/ver-dpa';

}
