<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatTurnoCollection;
use App\Models\AppDatTurno;
use Illuminate\Http\Request;

class AppDatTurnoController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppDatTurno();
        $this->resource = new \App\Http\Resources\Single\AppDatTurno($this->model);
        $this->collection = new AppDatTurnoCollection($this->resource);
    }
}
