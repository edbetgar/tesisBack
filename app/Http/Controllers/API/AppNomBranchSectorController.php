<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppNomBranchSectorCollection;
use App\Models\AppNomBranchSector;
use Illuminate\Http\Request;

class AppNomBranchSectorController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppNomBranchSector();
        $this->resource = new \App\Http\Resources\Single\AppNomBranchSector($this->model);
        $this->collection = new AppNomBranchSectorCollection($this->resource);
    }
}
