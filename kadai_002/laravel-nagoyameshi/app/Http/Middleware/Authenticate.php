<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     */
    protected function redirectTo(Request $request): ?string
    {
        //管理者認証機能追加の為、追加（名人）
        if ($request->is('admin/*')) {
            return route('admin.login');
        }
        
        return $request->expectsJson() ? null : route('login');
    }
}
