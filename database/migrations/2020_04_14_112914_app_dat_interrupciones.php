<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AppDatInterrupciones extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('app_dat_interrupciones', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('id_recurso_servicio');
            $table->unsignedInteger('id_turno_servicio');
            $table->unsignedInteger('id_motivo_interrupcion');
            $table->timestamp('fecha_desde');
            $table->timestamp('fecha_hasta');
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
        Schema::dropIfExists('app_dat_interrupciones');
    }
}
