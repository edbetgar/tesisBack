<?php


namespace App\Modules\WSO2Client;



use GuzzleHttp\Client;
use GuzzleHttp\Exception\ClientException;

class WSO2Client
{
    protected $_clientID = '';
    protected $_clientSecret = '';
    public $accessToken = '';
    protected $_encoded = '';
    protected $_username = '';
    protected $_password = '';
    protected $_hashed = '';

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
        $this->_encoded = base64_encode($this->_clientID.':'.$this->_clientSecret);
        $this->accessToken = $this->generarToken()->access_token;
        $this->_hashed = base64_encode('Bearer '.$this->accessToken);
    }
    public static function getUserInfo($token){
        $client = new Client(['verify' => false]);
        $response = $client->get(Constants::WSO2_URL.Constants::WSO2_USER_URI, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => base64_decode($token)//$token
            ],
        ]);
        $data = json_decode($response->getBody()->getContents());
        $data->email = $data->sub;
        return $data;
    }
    public static function checkPermisos($token,$resource,$userHashed){
        $client = new Client(['verify' => false]);
        try{
            $response = $client->post(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API_PERFIL_CHECK_PERMISOS, [
                'headers' => [
                    'Content-Type' => 'application/x-www-form-urlencoded',
                    'Authorization' => 'Bearer ' .$token,//$token,
                    'Accept' => 'application/json'
                ],
                'form_params' => [
                    'resource' => $resource,
                    'userHashed' => $userHashed,
                ],
            ]);
            if($response->getStatusCode() == 200){
                return true;
            }
        }catch (ClientException $exp){
            return false;
        }
    }
    public static function getPermisos($token){
        $client = new Client(['verify' => false]);
        $response = $client->get(Constants::WSO2_URL.Constants::WSO2_USER_PERMISOS, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => base64_decode($token)//$token
            ],
        ]);
        return json_decode($response->getBody()->getContents());
    }

    public static function getMunicipiosByProvincia($token, $id_provincia){
        $client = new Client(['verify' => false]);
        $response = $client->get(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API_PERFIL_MUNICIPIOS_BY_PROVINCIA.$id_provincia, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => base64_decode($token)//$token
            ],
        ]);
        return json_decode($response->getBody()->getContents());
    }

    public static function getProvincia($token, $id_provincia){
        $client = new Client(['verify' => false]);
        $response = $client->get(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API_PERFIL_PROVINCIA_BY_ID.$id_provincia, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => base64_decode($token)//$token
            ],
        ]);
        return json_decode($response->getBody()->getContents());
    }

    public static function getMunicipio($token, $id_municipio){
        $client = new Client(['verify' => false]);
        $response = $client->get(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API_PERFIL_MUNICIPIO_BY_ID.$id_municipio, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => base64_decode($token)//$token
            ],
        ]);
        return json_decode($response->getBody()->getContents());
    }

    public static function getConsejoPopular(){

    }


    public static function getDPA($token,$dpa){
        $client = new Client(['verify' => false]);
        //$response = $client->post(Constants::WSO2_URL.Constants::WSO2_API_PERFIL_DPA, [
        $response = $client->post('https://oficina-vhabitat.xutil.cu/apps/app-bienestar/api/ver-dpa', [
            'headers' => [
                'Content-Type' => 'application/x-www-form-urlencoded',
                'Authorization' => base64_decode($token)//$token
            ],
            'form_params' => [
                'dpa' => $dpa,
            ],
        ]);
        return json_decode($response->getBody()->getContents());

    }

    public static function getDPAByID($token,$id){
        $client = new Client(['verify' => false]);
        //$response = $client->post(Constants::WSO2_URL.Constants::WSO2_API_PERFIL_DPA, [
        $response = $client->get('https://oficina-vhabitat.xutil.cu/apps/app-bienestar/api/dpa/'.$id, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => base64_decode($token)//$token
            ],
        ]);
        return json_decode($response->getBody()->getContents());

    }

    public static function getConsejosPopularesByMunicipio($token, $id_municipio){
        $client = new Client(['verify' => false]);
        $response = $client->get(Constants::WSO2_URL.Constants::WSO2_API_PERFIL_CONSEJO_POPULAR_BY_MUNICIPIO.$id_municipio, [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => base64_decode($token)//$token
            ],
        ]);
        return json_decode($response->getBody()->getContents());
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
    public function findUser($user){
        $client = new Client(['verify' => false]);
        $response = $client->post(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API_PERFIL_USER_INFO, [
            'headers' => [
                'Content-Type' => 'application/x-www-form-urlencoded',
                'Authorization' => 'Bearer '.$this->accessToken,
                'hashed' => base64_encode('Bearer '.$this->accessToken)
            ],
            'form_params' => [
                'user' => $user,
            ],
        ]);
        return json_decode($response->getBody()->getContents());
    }
    function listUsers(){
        $client = new Client(['verify' => false]);
        $response = $client->get(Constants::WSO2_URL.Constants::WSO2_API.Constants::WSO2_API_PERFIL_USER_INFO, [
            'headers' => [
                'Content-Type' => 'application/x-www-form-urlencoded',
                'Authorization' => 'Bearer '.$this->accessToken,
                'hashed' => $this->_hashed
            ]
        ]);
        return json_decode($response->getBody()->getContents());
    }
}
