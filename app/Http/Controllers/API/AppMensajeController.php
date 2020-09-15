<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppMensajeCollection;
use App\Models\AppMensaje;
use Illuminate\Http\Request;

class AppMensajeController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppMensaje();
        $this->resource = new \App\Http\Resources\Single\AppMensaje($this->model);
        $this->collection = new AppMensajeCollection($this->resource);
    }
}
