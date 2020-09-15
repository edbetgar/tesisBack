<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatLocaleCollection;
use App\Models\AppDatLocale;
use Illuminate\Http\Request;

class AppDatLocaleController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppDatLocale();
        $this->resource = new \App\Http\Resources\Single\AppDatLocale($this->model);
        $this->collection = new AppDatLocaleCollection($this->resource);
    }
}
