<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AppDatServicios extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('app_dat_servicios', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('id_entidad');
            $table->unsignedInteger('id_tipo_servicio');
            $table->string('denominacion')->unique();
            $table->string('descripcion');
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
        //
        Schema::dropIfExists('app_dat_servicios');
    }
}
