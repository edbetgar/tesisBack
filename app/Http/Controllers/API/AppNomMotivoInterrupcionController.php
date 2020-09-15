<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppNomMotivoInterrupcionCollection;
use App\Models\AppNomMotivoInterrupcion;
use Illuminate\Http\Request;

class AppNomMotivoInterrupcionController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppNomMotivoInterrupcion();
        $this->resource = new \App\Http\Resources\Single\AppNomMotivoInterrupcion($this->model);
        $this->collection = new AppNomMotivoInterrupcionCollection($this->resource);
    }
}
