<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Resources\Collection\AppNotificacioneCollection;
use App\Models\AppNotificacione;

class AppNotificacioneController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppNotificacione();
        $this->resource = new \App\Http\Resources\Single\AppNotificacione($this->model);
        $this->collection = new AppNotificacioneCollection($this->resource);
    }
}
