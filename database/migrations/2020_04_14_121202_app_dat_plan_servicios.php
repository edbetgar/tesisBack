<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AppDatPlanServicios extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('app_dat_plan_servicios', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('id_turno_servicio');
            $table->unsignedInteger('id_nom_categoria_uso');
            $table->timestamp('fecha_reservacion');
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
        Schema::dropIfExists('app_dat_plan_servicios');
    }
}
