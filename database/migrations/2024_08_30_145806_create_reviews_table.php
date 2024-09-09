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
        Schema::create('reviews', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->nullable();
            $table->foreignId('dish_id')->nullable();
            $table->foreignId('restaurant_id')->nullable();
            $table->decimal('rating', 3, 2);
            $table->decimal('price', 8, 2)->nullable();
            $table->enum('dish_size', ['small', 'medium', 'large'])->nullable();
            $table->boolean('is_available')->default(true);
            $table->json('categories')->nullable();  // Storing selected categories as JSON
            $table->timestamp('reviewed_at')->useCurrent();
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
        Schema::dropIfExists('reviews');
    }
};
