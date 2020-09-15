<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Exception;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Http\Resources\Json\Resource;
use Illuminate\Http\Resources\Json\ResourceCollection;
use Illuminate\Support\Facades\Validator;

class ApiController extends Controller
{
    protected $model;
    protected $collectionClass;
    protected $resource;

    public function __construct(Model $model,$collection,$resource)
    {
        $modelClass = get_class($model);
        $resourceClass = get_class($resource);
        $this->collectionClass = get_class($collection);

        $this->model = new $modelClass();
        $this->model = $model;
        $this->resource = new $resourceClass();
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        return response()->json($this->model->paginate());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $this->validateRequest($request);
        foreach ($this->model->getFillable() as $key){
            $this->model[$key] = $request->input($key);
        }
        $this->model->save();
        return response()->json($this->model);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        $this->model = $this->model->findOrFail($id);
        return response()->json($this->model);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param  int  $id
     * @return JsonResource
     */
    public function update(Request $request, $id)
    {
        $this->validateRequest($request);
        $this->model = $this->model->findOrFail($id);
        foreach ($this->model->getFillable() as $key){
            $this->model[$key] = $request->input($key);
        }
        $this->model->save();
        return new $this->resource($this->model);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return JsonResource
     * @throws Exception
     */
    public function destroy($id)
    {
        $this->model = $this->model->findOrFail($id);
        $this->model->delete();
        return new $this->resource($this->model);
    }

    protected function validateRequest(Request $request){
        $dataValidator = Validator::make($request->all(), $this->model->getRules());
        if ($dataValidator->fails()) {
            return response()->json(['status' => 406, 'data' => $dataValidator->errors()], 406);
        }
    }
}
