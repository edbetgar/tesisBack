<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AppDatDistribucionRecursos extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('app_dat_distribucion_recursos', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('id_recurso_servicio');
            $table->unsignedInteger('cantidad');
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
        Schema::dropIfExists('app_dat_distribucion_turnos');
    }
}
