<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AppDatAgendaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('app_conf_confirmacion_servicio', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('id_local_servicio');
            $table->unsignedInteger('id_periodo');
            $table->unsignedInteger('id_tiempo_desde');
            $table->unsignedInteger('id_tiempo_hasta');
            $table->unsignedInteger('id_tiempo_cancelacion');
            $table->timestamp('tiempo_ultimo_aviso');
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
        Schema::dropIfExists('app_conf_confirmacion_servicio');
    }
}
