<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AppDatTurnosServicios extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('app_dat_turnos_servicios', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('id_local_servicio');
            $table->unsignedInteger('id_turno');
            $table->unsignedInteger('orden');
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
        Schema::dropIfExists('app_dat_turnos_servicios');
    }
}
