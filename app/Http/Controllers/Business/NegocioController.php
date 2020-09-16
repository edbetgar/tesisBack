<?php

namespace App\Http\Controllers\Business;

use App\Http\Controllers\Controller;
use App\Modules\WSO2Client\Constants;
use App\Modules\WSO2Client\WSO2Client;
use App\Negocio\NegocioDB;
use GuzzleHttp\Client;
use Illuminate\Http\Request;


class NegocioController extends Controller
{
    /*
     * Funcionalidad #1: Listar provincias,municipios y consejos populares
     * Desarrollada en el API-Perfil
     * */

    /*
     * Funcionalidad #2.1: Listar establecimientos disponibles
     * url ->GET /api/establecimientos
     * Nota: En el body de la peticion se envia el 'dpa'
     * return [
     * {    'id' => int,
     *      'establecimiento' => string,
     *      'direccion' => string,
     * }
     *  ]
     * */
    public function listarEstablecimientosPorUbicacionLocal(Request $request)
    {

        //TODO 1- Obtener id_dpa segun la ubicacion de la (provincia, municipio o consejo_popular)
        $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $organismo = 1;
        $id_provincia = -1;

        if ($request->get('id_organismo') != null) {
            $organismo = $request->get('id_organismo');
        }
        if ($request->get('id_provincia') != null && $request->get('id_municipio') == null) {
            $id_provincia = $request->get('id_provincia');
        }

        $ids_municipio = [];
        if ($id_provincia != -1) {

            $municipios = WSO2Client::getMunicipiosByProvincia($hashed, $id_provincia);
            foreach ($municipios as $municipio) {
                array_push($ids_municipio, $municipio->id);
            }
            $servicios = NegocioDB::getServiciosByProvincia($organismo, $ids_municipio);
        } else {
            $servicios = NegocioDB::getServiciosByMunicipio($organismo, $request->get('id_municipio'));


        }
        return response()->json($servicios);
    }

    /*
     * Funcionalidad #2: Listar establecimientos disponibles
     * url ->GET /api/servicios/{id_establecimiento}
     * Nota: En el body de la peticion se envia el 'dpa'
     * return [
     * {    'id' => int,
     *      'nombre_establecimiento' => string,
     *      'direccion' => string,
     * }
     *  ]
     * */
    public function listarServiciosPorUbicacionLocal($id_establecimiento, Request $request)
    {
        //TODO 1- Obtener id_dpa segun la ubicacion de la (provincia, municipio o consejo_popular)
        /*$wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);*/

        return response()->json(NegocioDB::obtenerServiciosConDisponibilidad($id_establecimiento));
    }

    /*
     * Funcionalidad #3: Ver servicio por id_local_servicio
     * url ->GET /api/servicio/{id_local_servicio}
     * return [
     * {    'id' => int,
     *      'nombre_servicio' => string,
     *      'costo' => double,
     * }
     */
    public function getServicioByIDLocal($id_local_servicio)
    {
        return response()->json(NegocioDB::getDetalleServicio($id_local_servicio));
    }

    /*
     * Funcionalidad #4: Listar proveedores del servicio por id_servicio
     * url ->GET /api/proveedores/{id_local_servicio}
     * return [
     * {    'id' => int,
     *      'nombre_proveedor' => string,
     * }
     * ]
     * */
    public function getProveedoresByIDServicio($id_local_servicio, Request $request)
    {

        return response()->json(NegocioDB::getProveedoresByIDServicio($id_local_servicio));


    }

    /*
     * Funcionalidad #5: Listar dias disponibles para el servicio segun id_servicio
     * url ->GET /api/disponibilidades/{id_servicio}
     * return [
     * {
     *      'id' => int,
     *      'fecha' => string,
     * }
     * ]
     * */
    public function getDiasDisponiblesByIDServicio($id_local_servicio, Request $request)
    {
        $proveedor = $request->get('proveedor');
        //TODO 1- Listar dias disponibles para el servicio segun id_servicio
        return response()->json(NegocioDB::getDiasDisponiblesByIDServicio($id_local_servicio, $proveedor));
    }

    /*
     * Funcionalidad #6: Listar turnos disponibles del servicio segun su id_servicio y fecha
     * url ->GET /api/turnos/{id_local_servicio}
     * NOTA: El campo 'fecha' es enviado en el body
     * return [
     * {
     *      'id' => int,
     *      'denominacion_turno' => string,
     * }
     * ]
     * */
    public function getTurnosDisponiblesByIDServicio($id_local_servicio, Request $request)
    {
        //TODO 1- Listar turnos disponibles del servicio segun su id_servicio y fecha
        return response()->json(NegocioDB::getTurnosDisponiblesByIDServicio($id_local_servicio, $request->get('plan')));

    }

    /*
     * Funcionalidad #7: Ver valoraciones del servicio por id_servicio
     * url ->GET /api/valoracion-servicio/{id_servicio}
     * return [
     * {
     *      'id' => int,
     *      'nombre_usuario' => string,
     *      'mensaje' => string,
     *      'evaluacion' => int,
     * }
     * ]
     * */
    public function getValoracionServicioByIDServicio($id_servicio)
    {
        //TODO 1- Ver valoraciones del servicio por id_servicio


    }

    /*
     * Funcionalidad #8: Reservar un servicio
     * url ->POST /api/reservaciones
     * return [
     * 'success' => boolean,
     * 'message' => string
     * ]
     * */
    public function reservarServicio(Request $request)
    {
        $data = NegocioDB::reservarMultipleServicioConCopiaDeCliente(
            $request->input('reservaciones'),
            $request->input('cliente'),
            WSO2Client::getUserInfo($request->header('hashed'))->email
        );
        return response()->json($data)->setStatusCode(200);
        if ($data['success']) {
            return response()->json($data)->setStatusCode(200);
        } else {
            return response()->json($data)->setStatusCode(406);
        }
    }

    /*
    * Funcionalidad #9: Listar reservaciones realizadas
    * url ->GET /api/reservaciones
    * */
    public function listarReservacionesRealizadas(Request $request)
    {
        //TODO 1- Listar reservaciones realizadas
        $id_usuario_wso2 = WSO2Client::getUserInfo($request->header('hashed'))->email;
        return response()->json(NegocioDB::listarReservacionesRealizadas($id_usuario_wso2, $request));
    }
    /*
    * Funcionalidad #10: Ver detalles de reservacion por id
    * url ->GET /api/reservaciones/{id}
    * */
    public function getDetalleReservacion($id)
    {
        //TODO 1- Ver detalles de la reservacion por id
        return response()->json(NegocioDB::getReservacion($id));
    }

    public function cancelarReservacion($id, Request $request)
    {
        return response()->json(NegocioDB::cancelarReservacion($id, $request->get('cantidad')));
    }

    public function insertRating(Request $request){
        $id_usuario_wso2 = WSO2Client::getUserInfo($request->header('hashed'))->email;
        return response()->json(NegocioDB::insertRating($id_usuario_wso2, $request));
    }

    //Dairo López Mollinedo  falta nombre usuario wso2 arreglar
    public function getRatingByIdLocalServicio($id){
        return response()->json( NegocioDB::getValoraciones($id));
    }

    public function insertRealService(Request $request){
        return response()->json(NegocioDB::insertServicioConsumido($request));
    }

    public function insertPrereserva(Request $request){
        return response()->json(NegocioDB::insertPrereserva($request));
    }

}


