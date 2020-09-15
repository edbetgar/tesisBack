<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AppNomPrioridad extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('app_nom_prioridad', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('denominacion')->unique();
            $table->string('descripcion');
            $table->unsignedInteger('nivel');
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
        Schema::dropIfExists('app_nom_prioridad');
    }
}
