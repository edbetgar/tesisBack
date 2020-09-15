<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatClienteCollection;
use App\Models\AppDatCliente;
use Illuminate\Http\Request;

class AppDatClienteController extends ApiController
{
    public function __construct()
    {
        $this->model = new AppDatCliente();
        $this->resource = new \App\Http\Resources\Single\AppDatCliente($this->model);
        $this->collection = new AppDatClienteCollection($this->resource);
    }
}
