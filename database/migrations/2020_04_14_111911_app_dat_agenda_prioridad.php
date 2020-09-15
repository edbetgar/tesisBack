<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AppDatAgendaPrioridad extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('app_dat_agenda_prioridad', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('id_agenda_prioridad');
            $table->unsignedInteger('id_agenda');
            $table->unsignedInteger('id_prioridad');
            $table->timestamp('fecha_cambio_estado');
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
        Schema::dropIfExists('app_dat_agenda_prioridad');
    }
}
