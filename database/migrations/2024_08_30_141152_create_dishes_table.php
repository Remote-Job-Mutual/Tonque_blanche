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
        Schema::create('dishes', function (Blueprint $table) {
            $table->id();
            $table->json('name');
            $table->json('description')->nullable();
            $table->decimal('price', 8, 2);
            $table->decimal('rating', 3, 2)->nullable(); // Rating value
            $table->decimal('distance', 5, 2)->nullable(); // Distance in kilometers
            $table->boolean('is_suggested')->default(false); // New field
            $table->boolean('is_new')->default(false);       // New field
            $table->boolean('is_offer')->default(false);     // New field
            $table->foreignId('restaurant_id')->constrained()->onDelete('cascade');
            $table->foreignId('category_id')->constrained()->onDelete('cascade');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dishes');
    }
};
