<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatAgendaCambiadaCollection;
use App\Models\AppDatAgendaCambiada;
use Illuminate\Http\Request;

class AppDatAgendaCambiadaController extends ApiController
{
    public function __construct()
    {
        $this->model = new AppDatAgendaCambiada();
        $this->resource = new \App\Http\Resources\Single\AppDatAgendaCambiada($this->model);
        $this->collection = new AppDatAgendaCambiadaCollection($this->resource);
    }

}
