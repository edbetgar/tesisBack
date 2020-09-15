<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AppDatEntidades extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('app_dat_entidades', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('denominacion')->unique();
            $table->string('telefono',20);
            $table->string('email');
            $table->string('direccion');
            $table->unsignedInteger('id_dpa');
            $table->unsignedInteger('id_organimso');
            $table->unsignedInteger('id_nom_branch_sector');
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
        Schema::dropIfExists('app_dat_entidades');
    }
}
