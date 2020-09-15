<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AppDatServicioReal extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('app_dat_servicio_real', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('id_agenda');
            $table->unsignedInteger('id_rec');
            $table->timestamp('fecha_real');
            $table->timestamp('fecha_fecha_registro');
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
        Schema::dropIfExists('app_dat_servicio_real');
    }
}
