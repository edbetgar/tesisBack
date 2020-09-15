<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AppDatLocalesServicios extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('app_dat_locales_servicios', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('id_local');
            $table->unsignedInteger('id_servicio');
            $table->unsignedInteger('confirmacion');
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
        Schema::dropIfExists('app_dat_locales_servicios');
    }
}
