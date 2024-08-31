<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use LaravelLocalization;

class SetLocaleForApi
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        // $locale = \Route::current()->parameter('locale');

        // if (isset(LaravelLocalization::getSupportedLocales()[$locale])) {
        //     LaravelLocalization::setLocale($locale);
        // } else {
        //     LaravelLocalization::setLocale(LaravelLocalization::getDefaultLocale());
        // }

        return $next($request);
    }
}
