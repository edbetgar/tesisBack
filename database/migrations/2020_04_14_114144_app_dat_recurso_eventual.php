<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AppDatRecursoEventual extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('app_dat_recurso_eventual', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('id_rec');
            $table->unsignedInteger('id_recurso');
            $table->unsignedInteger('id_turno_servicio');
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
        Schema::dropIfExists('app_dat_recurso_eventual');
    }
}
