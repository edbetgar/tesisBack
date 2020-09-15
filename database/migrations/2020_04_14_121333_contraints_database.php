<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ContraintsDatabase extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('app_conf_confirmacion_servicio', function (Blueprint $table) {
            $table->foreign('id_local_servicio')
                ->references('id')
                ->on('app_dat_locales_servicios')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->foreign('id_periodo')
                ->references('id')
                ->on('app_dat_nom_periodo')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->foreign('id_tiempo_desde')
                ->references('id')
                ->on('app_dat_nom_periodo')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->foreign('id_tiempo_hasta')
                ->references('id')
                ->on('app_dat_nom_periodo')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->foreign('id_tiempo_cancelacion')
                ->references('id')
                ->on('app_dat_nom_periodo')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_agenda', function (Blueprint $table) {
            $table->foreign('id_turno_servicio')
                ->references('id')
                ->on('app_dat_turnos_servicios')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_recurso_servicio')
                ->references('id')
                ->on('app_dat_recursos_servicios')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_cliente')
                ->references('id')
                ->on('app_dat_cliente')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_nom_categoria_uso')
                ->references('id')
                ->on('app_nom_categoria_uso')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_agenda_cambiada', function (Blueprint $table) {
            $table->foreign('id_agenda')
                ->references('id')
                ->on('app_dat_agenda')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_agenda_interrupcion', function (Blueprint $table) {
            $table->foreign('id_agenda')
                ->references('id')
                ->on('app_dat_agenda')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_interrupcion')
                ->references('id')
                ->on('app_dat_interrupciones')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_agenda_prioridad', function (Blueprint $table) {
            $table->foreign('id_agenda')
                ->references('id')
                ->on('app_dat_agenda')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_prioridad')
                ->references('id')
                ->on('app_nom_prioridad')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_distribucion_recursos', function (Blueprint $table) {
            $table->foreign('id_recurso_servicio')
                ->references('id')
                ->on('app_dat_recursos_servicios')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_distribucion_recursos', function (Blueprint $table) {
            $table->foreign('id_recurso_servicio')
                ->references('id')
                ->on('app_dat_recursos_servicios')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_prioridad')
                ->references('id')
                ->on('app_nom_prioridad')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_entidades', function (Blueprint $table) {
            $table->foreign('id_organismo')
                ->references('id')
                ->on('app_dat_organimso')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_nom_branch_sector')
                ->references('id')
                ->on('app_nom_branch_sectors')
                ->onDelete('cascade')
                ->onUpdate('cascade');

        });
        Schema::table('app_dat_interrupciones', function (Blueprint $table) {
            $table->foreign('id_recurso_servicio')
                ->references('id')
                ->on('app_dat_recursos_servicios')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_turno_servicio')
                ->references('id')
                ->on('app_dat_turnos_servicios')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_motivo_interrupcion')
                ->references('id')
                ->on('app_nom_motivo_interrupcion')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_locales', function (Blueprint $table) {
            $table->foreign('id_entidad')
                ->references('id')
                ->on('app_dat_entidades')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_locales_servicios', function (Blueprint $table) {
            $table->foreign('id_local')
                ->references('id')
                ->on('app_dat_locales')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_servicio')
                ->references('id')
                ->on('app_dat_servicios')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_recurso', function (Blueprint $table) {
            $table->foreign('id_entidad')
                ->references('id')
                ->on('app_dat_entidades')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_tipo_recurso')
                ->references('id')
                ->on('app_nom_tipo_recurso')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_recursos_servicios', function (Blueprint $table) {
            $table->foreign('id_rec')
                ->references('id')
                ->on('app_dat_recurso_general')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_recurso')
                ->references('id')
                ->on('app_dat_recurso')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_turno_servicio')
                ->references('id')
                ->on('app_dat_turnos_servicios')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_recurso_eventual', function (Blueprint $table) {
            $table->foreign('id_rec')
                ->references('id')
                ->on('app_dat_recurso_general')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_recurso')
                ->references('id')
                ->on('app_dat_recurso')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_turno_servicio')
                ->references('id')
                ->on('app_dat_turnos_servicios')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_recurso_eventual', function (Blueprint $table) {
            $table->foreign('id_entidad')
                ->references('id')
                ->on('app_dat_entidades')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_tipo_servicio')
                ->references('id')
                ->on('app_nom_tipo_servicios')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_servicio_real', function (Blueprint $table) {
            $table->foreign('id_agenda')
                ->references('id')
                ->on('app_dat_agenda')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_rec')
                ->references('id')
                ->on('app_dat_recurso_general')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_turnos', function (Blueprint $table) {
            $table->foreign('id_entidad')
                ->references('id')
                ->on('app_dat_entidades')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_turnos_servicios', function (Blueprint $table) {
            $table->foreign('id_local_servicio')
                ->references('id')
                ->on('app_dat_locales_servicios')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_turno')
                ->references('id')
                ->on('app_dat_turnos')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_mensaje', function (Blueprint $table) {
            $table->foreign('id_nom_tipo_mensaje')
                ->references('id')
                ->on('app_nom_tipo_mensaje')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_plan_servicios', function (Blueprint $table) {
            $table->foreign('id_turno_servicio')
                ->references('id')
                ->on('app_dat_turnos_servicios')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_nom_categoria_uso')
                ->references('id')
                ->on('app_nom_categoria_uso')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
        Schema::table('app_dat_entidades_categorias', function (Blueprint $table) {
            $table->foreign('id_entidad')
                ->references('id')
                ->on('app_dat_entidades')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('id_nom_categoria_uso')
                ->references('id')
                ->on('app_nom_categoria_uso')
                ->onDelete('cascade')
                ->onUpdate('cascade');
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
    }
}
