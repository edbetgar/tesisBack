<?php

namespace App\Http\Resources\Single;

use Illuminate\Http\Resources\Json\JsonResource;

class AppDatAgendaInterrupcion extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return parent::toArray($request);
    }
}
