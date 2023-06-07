<?php

namespace App\Http\Controllers;

use App\models\History;
use Illuminate\Http\Request;

class HistoryController extends Controller
{
    public function index(){
        $historial = History::all();
        foreach ($historial as $h) {
            $h->nombre_ciudad = $h->nombre_ciudad;
        }
        return response()->json(["data" => $historial]);
        
    }
    public function save(Request $request){
        
        foreach ($request->cities as $city) {
            $historial = new History;
            $historial->ciudad_id = $city["id"];
            $historial->humedad = $city["humedad"];
            $historial->dia = now();
            $historial->save();
        }
        return response()->json(['success' => true]);
    }
}
