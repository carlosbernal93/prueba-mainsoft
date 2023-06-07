<?php

namespace App\Http\Controllers;

use App\Models\Ciudad;
use Illuminate\Http\Request;

class MapController extends Controller
{
    public function index(){
        $ciudades = Ciudad::all();
        return view("maps.index", compact('ciudades'));
    }
}
