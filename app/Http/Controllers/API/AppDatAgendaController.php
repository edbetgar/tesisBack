<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatAgendaCollection;
use App\Models\AppDatAgenda;
use Illuminate\Http\Request;

class AppDatAgendaController extends ApiController
{
    public function __construct()
    {
        $this->model = new AppDatAgenda();
        $this->resource = new \App\Http\Resources\Single\AppDatAgenda($this->model);
        $this->collection = new AppDatAgendaCollection($this->resource);
    }

}
