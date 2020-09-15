<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AppDatRecurso extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('app_dat_recurso', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('id_tipo_recurso');
            $table->string('denominacion')->unique();
            $table->unsignedInteger('id_entidad');
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
        Schema::dropIfExists('app_dat_recurso');
    }
}
