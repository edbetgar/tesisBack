<?php

namespace App\Console\Commands;

use App\Modules\WSO2Client\WSO2Client;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class GetToken extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'get:token';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {


        //$this->getMunicipio();
        $this->info(json_encode(self::calculateStatistics(), JSON_PRETTY_PRINT));


    }

    private static function calculateStatistics()
    {
        DB::table('app_estadisticas')->delete();
        $res = DB::table('app_dat_valoraciones')
            ->select([
                'id_local_servicio',
                DB::raw('avg(valoracion) as rating'),
            ])->whereNull('deleted_at')
        ->groupBy('id_local_servicio')
        ->get();
        foreach ($res as $item){
            DB::table('app_estadisticas')->insert([
               'id_local_servicio' => $item->id_local_servicio,
               'valoracion_promedio' => $item->rating,
               'created_at' => Carbon::now(),
               'updated_at' => Carbon::now()
            ]);
        }
    }

    private function getToken()
    {
        $wso2 = new Wso2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $this->info($wso2->accessToken);
        $this->info(base64_encode('Bearer ' . $wso2->accessToken));
        $resource = '/api/app-nom-tipo-servicio';
        $userHashed = base64_encode('Bearer ' . $wso2->accessToken);

        $this->info(json_encode(Wso2Client::getUserInfo(base64_encode('Bearer ' . $wso2->accessToken))));
        $this->info(json_encode(Wso2Client::checkPermisos($wso2->accessToken, $resource, $userHashed)));

    }

    private function getMunicipio()
    {
        $wso2 = new WSO2Client(
            env('WSO2_CLIENT_ID'),
            env('WSO2_CLIENT_SECRET'),
            env('WSO2_USERNAME'),
            env('WSO2_PASSWORD')
        );
        $id = 92946;
        $hashed = base64_encode('Bearer ' . $wso2->accessToken);
        $this->info(json_encode(WSO2Client::getMunicipio($hashed, 92946)));

    }
}
