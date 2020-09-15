<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AppDatAgendaCambiada extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('app_dat_agenda_cambiada', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('id_agenda');
            $table->timestamp('fecha_inicio_cita');
            $table->timestamp('fecha_inicio_cita_old');
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
        Schema::dropIfExists('app_dat_agenda_cambiada');
    }
}
