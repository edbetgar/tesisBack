<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatAgendaInterrupcionCollection;
use App\Models\AppDatAgendaInterrupcion;
use Illuminate\Http\Request;

class AppDatAgendaInterrupcionController extends ApiController
{
    public function __construct()
    {
        $this->model = new AppDatAgendaInterrupcion();
        $this->resource = new \App\Http\Resources\Single\AppDatAgendaInterrupcion($this->model);
        $this->collection = new AppDatAgendaInterrupcionCollection($this->resource);
    }

}
