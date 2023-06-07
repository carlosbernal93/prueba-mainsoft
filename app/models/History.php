<?php

namespace App\models;

use App\Models\Ciudad;
use Illuminate\Database\Eloquent\Model;

class History extends Model
{
    protected $table = "historial_ciudades";
    protected $appends = ['nombre_ciudad'];
    public function ciudad(){
        return $this->hasOne(Ciudad::class, 'id', 'ciudad_id');
    }
    public function getNombreCiudadAttribute(){
        return $this->ciudad->nombre;
    }
}
