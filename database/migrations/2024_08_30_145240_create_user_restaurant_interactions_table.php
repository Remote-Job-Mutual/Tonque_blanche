<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('user_restaurant_interactions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->nullable();
            $table->foreignId('restaurant_id')->nullable();
            $table->decimal('service_rating', 3, 2)->nullable();
            $table->decimal('cleaning_rating', 3, 2)->nullable();
            $table->decimal('timing_rating', 3, 2)->nullable();
            $table->decimal('environment_rating', 3, 2)->nullable();
            $table->decimal('place_rating', 3, 2)->nullable();
            $table->decimal('parking_rating', 3, 2)->nullable();
            $table->json('categories')->nullable();  // Storing selected categories as JSON
            $table->timestamp('visited_at')->useCurrent();
            $table->text('comments')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_restaurant_interactions');
    }
};
