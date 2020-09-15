<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppNomOrganismoCollection;
use App\Models\AppNomOrganismo;
use Illuminate\Http\Request;

class AppNomOrganismoController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppNomOrganismo();
        $this->resource = new \App\Http\Resources\Single\AppNomOrganismo($this->model);
        $this->collection = new AppNomOrganismoCollection($this->resource);
    }
}
