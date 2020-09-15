<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AppDatAgenda extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('app_dat_agenda', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('id_turno_servicio');
            $table->unsignedInteger('id_recurso_servicio');
            $table->timestamp('fecha_inicio_cita');
            $table->unsignedInteger('id_cliente');
            $table->timestamp('fecha_fin_cita');
            $table->unsignedInteger('id_usuario_wso2');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('app_dat_agenda');
    }
}
