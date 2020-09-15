<?php

namespace App\Console\Commands;

use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class FillDB extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'db:fill';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Pobla la base de datos';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        self::insertarEntidades();
        self::insertarLocales();
        self::insertarServicios();
        self::insertarLocalesServicios();
        self::insertarRecursos();
        self::insertarRecursosServicios();
        self::insertarRecursoGeneral();
        self::insertarTurnos();
        self::insertarEntidadesCategorias();
        self::insertarTurnosServicios();
        self::insertarNomBranchSector();
        self::insertarNomCategoriaUso();
        self::insertarNomMotivoInterrupcion();
        self::insertarNomOrganismo();
        self::insertarNomPeriodo();
        self::insertarNomPrioridad();
        self::insertarNomTipoMensaje();
        self::insertarNomTipoRecurso();
        self::insertarNomTipoServicios();

    }


    private static function insertarEntidades()
    {
        Schema::dropIfExists('app_dat_entidades');
        Schema::create('app_dat_entidades', function (Blueprint $table) {
            $table->increments('id');
            $table->string('denominacion')->unique();
            $table->string('telefono');
            $table->string('email');
            $table->string('direccion');
            $table->string('id_dpa');
            $table->string('id_organismo');
            $table->string('id_nom_branch_sector');
            $table->timestamps();
            $table->softDeletes();
        });

        $entidades = [
            [
                'denominacion' => 'Entidad 1',
                'telefono' => '34534534',
                'email' => 'entidad1@citas.cu',
                'direccion' => 'Direccion 1',
                'id_dpa' => '1',
                'id_organismo' => '1',
                'id_nom_branch_sector' => '1',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Entidad 2',
                'telefono' => '3453452334',
                'email' => 'entidad2@citas.cu',
                'direccion' => 'Direccion 2',
                'id_dpa' => '1',
                'id_organismo' => '1',
                'id_nom_branch_sector' => '1',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]
        ];

        DB::table('app_dat_entidades')
            ->insert($entidades);
    }

    private static function insertarLocales()
    {
        Schema::dropIfExists('app_dat_locales');
        Schema::create('app_dat_locales', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_entidad');
            $table->string('denominacion');
            $table->integer('id_dpa');
            $table->string('email');
            $table->string('direccion');
            $table->string('telefono');
            $table->timestamps();
            $table->softDeletes();
        });
        $locales = [
            [
                'id_entidad' => 1,
                'denominacion' => 'Local 1',
                'email' => 'local11@citas.cu',
                'direccion' => 'Direccion local 1',
                'telefono' => '3423123124',
                'id_dpa' => '92946',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id_entidad' => 2,
                'denominacion' => 'Local 2',
                'email' => 'local12@citas.cu',
                'direccion' => 'Direccion local 2',
                'telefono' => '34231224',
                'id_dpa' => '92946',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];
        DB::table('app_dat_locales')
            ->insert($locales);
    }

    private static function insertarServicios()
    {
        Schema::dropIfExists('app_dat_servicios');
        Schema::create('app_dat_servicios', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_entidad');
            $table->integer('id_tipo_servicio');
            $table->string('denominacion');
            $table->string('descripcion');
            $table->timestamps();
            $table->softDeletes();
        });
        $servicios = [
            [
                'id_entidad' => 1,
                'id_tipo_servicio' => 1,
                'denominacion' => 'Servicio 1',
                'descripcion' => 'Descripcion 1',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id_entidad' => 2,
                'id_tipo_servicio' => 2,
                'denominacion' => 'Servicio 2',
                'descripcion' => 'Descripcion 2',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];
        DB::table('app_dat_servicios')
            ->insert($servicios);
    }

    private static function insertarRecursos()
    {
        Schema::dropIfExists('app_dat_recurso');
        Schema::create('app_dat_recurso', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_tipo_recurso');
            $table->string('denominacion');
            $table->integer('id_entidad');
            $table->timestamps();
            $table->softDeletes();
        });
        $recurso = [
            [
                'id_tipo_recurso' => 1,
                'denominacion' => 'Recurso 1',
                'id_entidad' => 1,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id_tipo_recurso' => 2,
                'denominacion' => 'Recurso 2',
                'id_entidad' => 2,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];
        DB::table('app_dat_recurso')
            ->insert($recurso);
    }

    private static function insertarRecursosServicios()
    {
        Schema::dropIfExists('app_dat_recursos_servicios');
        Schema::create('app_dat_recursos_servicios', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_rec');
            $table->integer('id_recurso');
            $table->integer('id_turno_servicio');
            $table->integer('cantidad');
            $table->timestamps();
            $table->softDeletes();
        });
        $recursos_servicios = [
            [
                'id_rec' => 1,
                'id_recurso' => 1,
                'id_turno_servicio' => 1,
                'cantidad' => 35,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id_rec' => 2,
                'id_recurso' => 2,
                'id_turno_servicio' => 2,
                'cantidad' => 35,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];
        DB::table('app_dat_recursos_servicios')
            ->insert($recursos_servicios);
    }

    private static function insertarLocalesServicios()
    {
        Schema::dropIfExists('app_dat_locales_servicios');
        Schema::create('app_dat_locales_servicios', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_local');
            $table->integer('id_servicio');
            $table->integer('confirmacion');
            $table->decimal('precio');
            $table->integer('dias_de_publicacion');
            $table->integer('dias_de_planificacion');
            $table->timestamps();
            $table->softDeletes();
        });
        $locales_servicios = [
            [
                'id_local' => 1,
                'id_servicio' => 1,
                'confirmacion' => 1,
                'precio' => 32,
                'dias_de_publicacion' => 3,
                'dias_de_planificacion' => 5,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id_local' => 2,
                'id_servicio' => 2,
                'confirmacion' => 1,
                'precio' => 32,
                'dias_de_publicacion' => 3,
                'dias_de_planificacion' => 5,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];
        DB::table('app_dat_locales_servicios')
            ->insert($locales_servicios);
    }

    private static function insertarRecursoGeneral()
    {
        Schema::dropIfExists('app_dat_recurso_general');
        Schema::create('app_dat_recurso_general', function (Blueprint $table) {
            $table->increments('id');
            $table->string('tipo');
            $table->timestamps();
            $table->softDeletes();
        });
        $recurso_general = [
            [
                'tipo' => 'Recurso General 1',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'tipo' => 'Recurso General 2',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];
        DB::table('app_dat_recurso_general')
            ->insert($recurso_general);
    }

    private static function insertarTurnos()
    {
        Schema::dropIfExists('app_dat_turnos');
        Schema::create('app_dat_turnos', function (Blueprint $table) {
            $table->increments('id');
            $table->string('denominacion');
            $table->integer('id_entidad');
            $table->timestamps();
            $table->softDeletes();
        });
        $recurso_general = [
            [
                'denominacion' => 'Turno 1',
                'id_entidad' => 1,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Turno 2',
                'id_entidad' => 2,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];
        DB::table('app_dat_turnos')
            ->insert($recurso_general);
    }

    private static function insertarEntidadesCategorias()
    {
        Schema::dropIfExists('app_dat_entidades_categorias');
        Schema::create('app_dat_entidades_categorias', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_entidad');
            $table->integer('id_nom_categoria_uso');
            $table->timestamps();
            $table->softDeletes();

            //poner llaves foraneas como los son id_entidad y id_nom_categoria_uso
        });

        $entidades_categorias = [
            [
                'id_entidad' => 1,
                'id_nom_categoria_uso' => 1,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id_entidad' => 2,
                'id_nom_categoria_uso' => 2,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];

        DB::table('app_dat_entidades_categorias')
            ->insert($entidades_categorias);
    }

    private static function insertarTurnosServicios()
    {
        Schema::dropIfExists('app_dat_turnos_servicios');
        Schema::create('app_dat_turnos_servicios', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_local_servicio');
            $table->integer('id_turno');
            $table->string('orden');
            $table->timestamps();
            $table->softDeletes();
        });
        $recurso_general = [
            [
                'id_local_servicio' => 1,
                'id_turno' => 1,
                'orden' => 'Orden 1',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id_local_servicio' => 2,
                'id_turno' => 2,
                'orden' => 'Orden 2',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];
        DB::table('app_dat_turnos_servicios')
            ->insert($recurso_general);
    }

    private static function insertarNomBranchSector()
    {
        Schema::dropIfExists('app_nom_branch_sectors');
        Schema::create('app_nom_branch_sectors', function (Blueprint $table) {
            $table->increments('id');
            $table->string('denominacion');
            $table->string('descripcion');
            $table->timestamps();
            $table->softDeletes();
        });
        $nom_branch_sectors = [
            [
                'denominacion' => 'Trámites de la vivienda',
                'descripcion' => '',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Servicios Tecnicos y del Hogar',
                'descripcion' => '',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Restaurante y Recreacion',
                'descripcion' => '',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Alojamiento',
                'descripcion' => '',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Registro central Comercial',
                'descripcion' => '',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],

        ];
        DB::table('app_nom_branch_sectors')
            ->insert($nom_branch_sectors);
    }

    private static function insertarNomCategoriaUso()
    {
        Schema::dropIfExists('app_nom_categoria_uso');
        Schema::create('app_nom_categoria_uso', function (Blueprint $table) {
            $table->increments('id');
            $table->string('denominacion');
            $table->string('descripcion');
            $table->timestamps();
            $table->softDeletes();
        });
        $categoria_uso = [
            [
                'denominacion' => 'Categoria de uso 1',
                'descripcion' => '',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Categoria de uso 2',
                'descripcion' => '',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Categoria de uso 3',
                'descripcion' => '',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Categoria de uso 4',
                'descripcion' => '',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Categoria de uso 5',
                'descripcion' => '',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],

        ];
        DB::table('app_nom_categoria_uso')
            ->insert($categoria_uso);
    }

    private static function insertarNomMotivoInterrupcion()
    {
        Schema::dropIfExists('app_nom_motivo_interrupcion');
        Schema::create('app_nom_motivo_interrupcion', function (Blueprint $table) {
            $table->increments('id');
            $table->string('denominacion');
            $table->timestamps();
            $table->softDeletes();
        });
        $motivo_interrupcion = [
            [
                'denominacion' => 'Problemas personales del especialista',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Rotura del equipo',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Alarma ciclonica',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Pandemia',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Epidemia',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];
        DB::table('app_nom_motivo_interrupcion')
            ->insert($motivo_interrupcion);
    }

    private static function insertarNomOrganismo()
    {
        Schema::dropIfExists('app_nom_organismo');
        Schema::create('app_nom_organismo', function (Blueprint $table) {
            $table->increments('id');
            $table->string('denominacion');
            $table->timestamps();
            $table->softDeletes();
        });
        $organismos = [
            [
                'denominacion' => 'Instituto de Planificación Física',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Ministerio de Comercio Interior',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];
        DB::table('app_nom_organismo')
            ->insert($organismos);
    }

    private static function insertarNomPeriodo()
    {
        Schema::dropIfExists('app_nom_periodo');
        Schema::create('app_nom_periodo', function (Blueprint $table) {
            $table->increments('id');
            $table->string('denominacion');
            $table->timestamps();
            $table->softDeletes();
        });
        $periodo = [
            [
                'denominacion' => 'Horas',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Dias',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Meses',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Semanas',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];
        DB::table('app_nom_periodo')
            ->insert($periodo);
    }

    private static function insertarNomPrioridad()
    {
        Schema::dropIfExists('app_nom_prioridad');
        Schema::create('app_nom_prioridad', function (Blueprint $table) {
            $table->increments('id');
            $table->string('denominacion');
            $table->string('descripcion');
            $table->integer('nivel');
            $table->timestamps();
            $table->softDeletes();
        });
        $prioridad = [
            [
                'denominacion' => 'Normal',
                'descripcion' => 'esta es la prioridad todos las agendas por defecto.',
                'nivel' => 1,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Media',
                'descripcion' => 'esta prioridad la toman aquellas agendas que por una ves debieron cambiar su fecha prevista.',
                'nivel' => 2,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Alta',
                'descripcion' => 'Esta es la prioridad de las agendas que se han tenido que cambiar 2 veces.',
                'nivel' => 3,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];
        DB::table('app_nom_prioridad')
            ->insert($prioridad);
    }

    private static function insertarNomTipoMensaje()
    {
        Schema::dropIfExists('app_nom_tipo_mensaje');
        Schema::create('app_nom_tipo_mensaje', function (Blueprint $table) {
            $table->increments('id');
            $table->string('denominacion');
            $table->timestamps();
            $table->softDeletes();
        });
        $tipo_mensaje = [
            [
                'denominacion' => 'informativo',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'alerta',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'interactivo',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];
        DB::table('app_nom_tipo_mensaje')
            ->insert($tipo_mensaje);
    }

    private static function insertarNomTipoRecurso()
    {
        Schema::dropIfExists('app_nom_tipo_recurso');
        Schema::create('app_nom_tipo_recurso', function (Blueprint $table) {
            $table->increments('id');
            $table->string('denominacion');
            $table->timestamps();
            $table->softDeletes();
        });
        $tipo_mensaje = [
            [
                'denominacion' => 'Material gastable',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Material inmueble',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Material herramienta',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Humano',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];
        DB::table('app_nom_tipo_recurso')
            ->insert($tipo_mensaje);
    }


    private static function insertarNomTipoServicios()
    {
        Schema::dropIfExists('app_nom_tipo_servicios');
        Schema::create('app_nom_tipo_servicios', function (Blueprint $table) {
            $table->increments('id');
            $table->string('denominacion');
            $table->string('descripcion');
            $table->timestamps();
            $table->softDeletes();
        });
        $tipo_servicio = [
            [
                'denominacion' => 'Cita',
                'descripcion' => 'aquellos servicios que se prestan con un caracter sistematico. ejemplo turnos para el servicio de pe…',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Restaurante',
                'descripcion' => 'servicios del tipo restaurante para la reservacion de mesas y cantidad de personas etc. tambien pued…',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'denominacion' => 'Alojamiento',
                'descripcion' => 'Servicios del corte de alojamiento y otros asociados a el principal.',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];
        DB::table('app_nom_tipo_servicios')
            ->insert($tipo_servicio);
    }




}
