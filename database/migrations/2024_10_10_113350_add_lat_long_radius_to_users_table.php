<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('lat')->nullable()->after('active');
            $table->string('long')->nullable()->after('lat');
            $table->string('radius')->nullable()->after('long');
            $table->integer('sms_code')->nullable()->after('radius');
            $table->timestamp('sms_code_expired_at')->nullable()->after('sms_code');
            $table->integer('email_code')->nullable()->after('sms_code_expired_at');
            $table->timestamp('email_code_expired_at')->nullable()->after('email_code');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('lat');
            $table->dropColumn('long');
            $table->dropColumn('radius');
            $table->dropColumn('sms_code');
            $table->dropColumn('sms_code_expired_at');
            $table->dropColumn('email_code');
            $table->dropColumn('email_code_expired_at');
        });
    }
};
