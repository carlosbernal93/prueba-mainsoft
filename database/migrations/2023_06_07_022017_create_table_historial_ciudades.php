<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableHistorialCiudades extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('historial_ciudades', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('ciudad_id');
            $table->string('humedad');
            $table->dateTime('dia');
            $table->foreign('ciudad_id')->references('id')->on('ciudades')->onUpdate('cascade')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('historial_ciudades');
    }
}
