<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AppDatAgendaInterrupcion extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('app_dat_agenda_interrupcion', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('id_agenda');
            $table->unsignedInteger('id_interrupcion');
            $table->string('notificacion');
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
        Schema::dropIfExists('app_dat_agenda_interrupcion');
    }
}
