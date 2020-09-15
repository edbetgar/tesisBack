<?php

namespace Tests\Feature\App\Http\Controllers\Business;

use App\Modules\WSO2Client\WSO2Client;
use Tests\TestCase;

class NegocioControllerTest extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function testGetDisponibilidades()
    {
        $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $headers = [
            'Authorization' => 'Bearer ' . $wso2->accessToken,
            'hashed' => $hashed,
            'Content-Type' => 'application/json'
        ];
        $id_local_servicio = '1';
        $response = $this->get('api/disponibilidades/' . $id_local_servicio, $headers);
        $response->assertStatus(200);
        $response->dump();
    }

    public function testGetTurnos()
    {
        $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $headers = [
            'Authorization' => 'Bearer ' . $wso2->accessToken,
            'hashed' => $hashed,
            'Content-Type' => 'application/json'
        ];
        $id_local_servicio = '1';
        $id_plan_servicio = 66;
        $response = $this->get('api/turnos/' . $id_local_servicio . '?plan=' . $id_plan_servicio, $headers);
        $response->assertStatus(200);
        $response->dump();
    }

    public function testGetEstablecimientos()
    {
        $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $headers = [
            'Authorization' => 'Bearer ' . $wso2->accessToken,
            'hashed' => $hashed,
            'Content-Type' => 'application/json'
        ];
        $id_provincia = '9289';
        $id_municipio = '92946';
        $id_organismo = '1';
        $response = $this->get('api/establecimientos?id_provincia=' . $id_provincia . '&id_municipio=' . $id_municipio . '&id_organismo=' . $id_organismo, $headers);
        $response->assertStatus(200);
        $response->dump();
    }

    public function testGetProveedores()
    {
        $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $headers = [
            'Authorization' => 'Bearer ' . $wso2->accessToken,
            'hashed' => $hashed,
            'Content-Type' => 'application/json'
        ];
        $id_local_servicio = '1';
        $response = $this->get('api/proveedores/' . $id_local_servicio, $headers);
        $response->assertStatus(200);
        $response->dump();
    }

    public function testGetServicios()
    {
        $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $headers = [
            'Authorization' => 'Bearer ' . $wso2->accessToken,
            'hashed' => $hashed,
            'Content-Type' => 'application/json'
        ];
        $id_establecimiento = '1';
        $response = $this->get('api/servicios/' . $id_establecimiento, $headers);
        $response->assertStatus(200);
        $response->dump();
    }

    public function testGetServicio()
    {
        $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $headers = [
            'Authorization' => 'Bearer ' . $wso2->accessToken,
            'hashed' => $hashed,
            'Content-Type' => 'application/json'
        ];
        $id_establecimiento = '1';
        $response = $this->get('api/servicio/' . $id_establecimiento, $headers);
        $response->assertStatus(200);
        $response->dump();
    }

    public function testGetReservaciones()
    {
        $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $headers = [
            'Authorization' => 'Bearer ' . $wso2->accessToken,
            'hashed' => $hashed,
            'Content-Type' => 'application/json'
        ];
        $response = $this->get('api/reservaciones', $headers);
        $response->assertStatus(200);
        $response->dump();
    }

    public function testGetReservacionesByID()
    {
        $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $headers = [
            'Authorization' => 'Bearer ' . $wso2->accessToken,
            'hashed' => $hashed,
            'Content-Type' => 'application/json'
        ];
        $id_reservacion = '357';
        $response = $this->get('api/reservaciones/' . $id_reservacion, $headers);
        $response->assertStatus(200);
        $response->dump();
    }

    public function testDeleteReservacion()
    {
        $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $headers = [
            'Authorization' => 'Bearer ' . $wso2->accessToken,
            'hashed' => $hashed,
            'Content-Type' => 'application/json'
        ];
        $id_reservacion = '254';
        $response = $this->delete('api/reservaciones/' . $id_reservacion, $headers);
        $response->assertStatus(200);
        $response->dump();
    }

    public function testReservarServicio()
    {
        $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $headers = [
            'Authorization' => 'Bearer ' . $wso2->accessToken,
            'hashed' => $hashed,
            'Content-Type' => 'application/x-www-form-urlencoded'
        ];
        $data = [
            'cliente' => [
                'ci' => '96060714801',
                'email' => 'fernandojose@xetid.cu',
                'apellidos' => 'Castellanos Borroto',
                'nombre' => 'Fernando',
                'telefono' => '54590236'
            ],
            'reservaciones' => [
                [
                    'id_dat_plan_servicio' => '136',
                    'id_recurso_servicio' => '1',
                    'cantidad' => '1',
                ]
            ]
        ];
        $response = $this->post('api/reservaciones', $data, $headers);
        $response->assertStatus(200);
        $response->assertJson([
           'success' => true,
           'message' => 'Reservaciones realizadas satisfactoriamente'
        ]);
        $response->dump();
    }

    public function testInsertRating()
    {
        $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $headers = [
            'Authorization' => 'Bearer ' . $wso2->accessToken,
            'hashed' => $hashed,
            'Content-Type' => 'application/x-www-form-urlencoded'
        ];
        $data = [
           'id_reservacion' => '315',
           'valoracion' =>  rand(1,5),
           'comentario' =>  'Esto es un comentario random '.rand(),
        ];
        $response = $this->post('api/ratings', $data, $headers);
       /* $response->assertStatus(200);
        $response->assertJson([
            'success' => true,
            'message' => 'Reservaciones realizadas satisfactoriamente'
        ]);*/
        $response->dump();
    }

    public function testConsumedService()
    {
        $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $headers = [
            'Authorization' => 'Bearer ' . $wso2->accessToken,
            'hashed' => $hashed,
            'Content-Type' => 'application/x-www-form-urlencoded'
        ];
        $data = [
            'id_reservacion' => '315',
        ];
        $response = $this->post('api/consumed-service', $data, $headers);
        /* $response->assertStatus(200);
         $response->assertJson([
             'success' => true,
             'message' => 'Reservaciones realizadas satisfactoriamente'
         ]);*/
        $response->dump();
    }
    //Dairo López Molllinedo
    public function testGetValoracion()
    {
       /* $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $headers = [
            'Authorization' => 'Bearer ' . $wso2->accessToken,
            'hashed' => $hashed,
            'Content-Type' => 'application/json'
        ];*/
        $id_local_servicio = '1';
        $response = $this->get('api/ratings/' . $id_local_servicio);
        $response->assertStatus(200);
        $response->dump();
    }
    public function testPrereserva()
    {
        /*$wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);*/

        $headers = [
            'Content-Type' => 'application/x-www-form-urlencoded'
        ];
        $data = [
            'id_plan_servicio' => '81',
            'cantidad'=>'5',
        ];
        $response = $this->post('api/prereserva', $data,$headers);
        $response->dump();
    }
}
