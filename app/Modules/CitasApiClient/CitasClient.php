<?php


namespace App\Modules\CitasApiClient;


use GuzzleHttp\Client;

class CitasClient
{
    protected $_clientID = '';
    protected $_clientSecret = '';
    public $accessToken = '';
    protected $_encoded = '';
    protected $_username = '';
    protected $_password = '';
    public $hashed = '';

    public function __construct(
        $clientID,
        $clientSecret,
        $username,
        $password
    )
    {
        $this->_clientID = $clientID;
        $this->_clientSecret = $clientSecret;
        $this->_username = $username;
        $this->_password = $password;
        $this->_encoded = base64_encode($this->_clientID . ':' . $this->_clientSecret);
        $this->accessToken = $this->generarToken()->access_token;
        $this->hashed = base64_encode('Bearer ' . $this->accessToken);
    }

    private function generarToken()
    {
        $client = new Client(['verify' => false]);
        $response = $client->post(Constants::WSO2_URL.Constants::WSO2_TOKEN, [
            'headers' => [
                'Content-Type' => 'application/x-www-form-urlencoded',
                'Authorization' => 'Basic '.base64_encode($this->_clientID.':'.$this->_clientSecret)
            ],
            'form_params' => [
                'grant_type' => 'password',
                'username' => $this->_username,
                'password' => $this->_password,
                'consumerSecret' => $this->_clientSecret,
                'scope' => 'openid admin_bienestar',
            ],
        ]);
        return json_decode($response->getBody()->getContents());
    }

    public function getDisponibilidades($id_local_servicio)
    {
        $client = new Client(['verify' => false]);
        $response = $client->get(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API.Constants::GET_DISPONIBILIDADES.'/'.$id_local_servicio, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer '.$this->accessToken,
                'hashed' => $this->hashed
            ],
        ]);
        return json_decode($response->getBody()->getContents());
    }

    public function getTurnos($id_local_servicio)
    {
        $client = new Client(['verify' => false]);
        $response = $client->get(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API.Constants::GET_TURNOS.'/'.$id_local_servicio, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer '.$this->accessToken,
                'hashed' => $this->hashed
            ],
        ]);
        return json_decode($response->getBody()->getContents());
    }

    public function getServiciosPlanificados($id_servicio)
    {
        $client = new Client(['verify' => false]);
        $response = $client->get(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API.Constants::GET_SERVICIOS_PLANIFICADOS.'/'.$id_servicio, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer '.$this->accessToken,
                'hashed' => $this->hashed
            ],
        ]);
        return json_decode($response->getBody()->getContents());
    }

    public function getEstablecimientos()
    {
        $client = new Client(['verify' => false]);
        $response = $client->get(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API.Constants::GET_SERVICIOS_PLANIFICADOS, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer '.$this->accessToken,
                'hashed' => $this->hashed
            ],
        ]);
        return json_decode($response->getBody()->getContents());
    }

    public function getProveedores($id_local_servicio)
    {
        $client = new Client(['verify' => false]);
        $response = $client->get(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API.Constants::GET_PROVEEDORES.'/'.$id_local_servicio, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer '.$this->accessToken,
                'hashed' => $this->hashed
            ],
        ]);
        return json_decode($response->getBody()->getContents());
    }

    public function getServicios($id_establecimiento)
    {
        $client = new Client(['verify' => false]);
        $response = $client->get(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API.Constants::GET_SERVICIOS.'/'.$id_establecimiento, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer '.$this->accessToken,
                'hashed' => $this->hashed
            ],
        ]);
        return json_decode($response->getBody()->getContents());
    }

    public function getServicioInfo($id_local_servicio)
    {
        $client = new Client(['verify' => false]);
        $response = $client->get(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API.Constants::GET_SERVICIO_INFO.'/'.$id_local_servicio, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer '.$this->accessToken,
                'hashed' => $this->hashed
            ],
        ]);
        return json_decode($response->getBody()->getContents());
    }

    public function getReservaciones()
    {
        $client = new Client(['verify' => false]);
        $response = $client->get(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API.Constants::GET_RESERVACIONES, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer '.$this->accessToken,
                'hashed' => $this->hashed
            ],
        ]);
        return json_decode($response->getBody()->getContents());
    }

    public function getReservacionInfo($id)
    {
        $client = new Client(['verify' => false]);
        $response = $client->get(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API.Constants::GET_RESERVACIONES.'/'.$id, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer '.$this->accessToken,
                'hashed' => $this->hashed
            ],
        ]);
        return json_decode($response->getBody()->getContents());
    }
    public function deleteReservacion($id)
    {
        $client = new Client(['verify' => false]);
        $response = $client->delete(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API.Constants::GET_RESERVACIONES.'/'.$id, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer '.$this->accessToken,
                'hashed' => $this->hashed
            ],
        ]);
        return json_decode($response->getBody()->getContents());
    }
    public function postReservacion($solicitud)
    {
        $client = new Client(['verify' => false]);
        $response = $client->post(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API.Constants::GET_RESERVACIONES, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer '.$this->accessToken,
                'hashed' => $this->hashed
            ],
            'form_params' => $solicitud
        ]);
        return json_decode($response->getBody()->getContents());
    }
}
