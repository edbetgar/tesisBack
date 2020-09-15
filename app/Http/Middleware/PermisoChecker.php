<?php

namespace App\Http\Middleware;

use App\Modules\WSO2Client\Constants;
use App\Modules\WSO2Client\Wso2Client;
use Closure;

class PermisoChecker
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(env('PERMISSION_CHECK')){
            $url = explode(env('APP_URL'),$request->url());
            $wso2 = new Wso2Client(
                env('WSO2_CLIENT_ID'),
                env('WSO2_CLIENT_SECRET'),
                env('WSO2_USERNAME'),
                env('WSO2_PASSWORD')
            );
            if(Wso2Client::checkPermisos($wso2->accessToken, $url[1], $request->header('hashed'))){
                return $next($request);
            }else{
                return response()->json()->setStatusCode(403);
            }
        }else{
            return $next($request);
        }
    }
}
