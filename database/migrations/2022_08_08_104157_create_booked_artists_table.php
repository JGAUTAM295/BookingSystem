<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookedArtistsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('booked_artists', function (Blueprint $table) {
            $table->id();
            $table->integer('booking_id')->unsigned();
            $table->integer('artist_id')->unsigned();
            $table->timestamps();

            $table->foreign('booking_id')
                ->references('id')
                ->on('booking_forms')
                ->onDelete('cascade');

            $table->foreign('artist_id')
                ->references('id')
                ->on('users')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('booked_artists');
    }
}
