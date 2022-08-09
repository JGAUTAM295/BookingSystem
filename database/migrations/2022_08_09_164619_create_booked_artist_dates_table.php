<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookedArtistDatesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('booked_artist_dates', function (Blueprint $table) {
            $table->id();
            $table->integer('booking_id')->unsigned();
            $table->string('col_key');
            $table->string('booking_date');
            $table->timestamps();

            $table->foreign('booking_id')
                ->references('id')
                ->on('booking_forms')
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
        Schema::dropIfExists('booked_artist_dates');
    }
}
