package nakama.http;

import cpp.Callable;
import cpp.RawPointer;
import cpp.ConstCharStar;
import cpp.Int32;
import cpp.Int64;
import cpp.SizeT;

/**
 * HTTP request methods.
 */
@:unreflective
@:include('nakama-cpp/NHttpTransportInterface.h')
@:native('::nakama::NHttpReqMethod')
extern enum NHttpReqMethod {
    GET;
    POST;
    PUT;
    DEL;
}

/**
 * HTTP request structure.
 */
@:unreflective
@:include('nakama-cpp/NHttpTransportInterface.h')
@:native('::nakama::NHttpRequest')
extern class NHttpRequest {
    var method: NHttpReqMethod;
    var headers: RawPointer<Dynamic>; // NHttpHeaders
    var queryArgs: RawPointer<Dynamic>; // NHttpQueryArgs
    var path: ConstCharStar;
    var body: ConstCharStar;
    
    @:native('new nakama::NHttpRequest')
    static function create(): RawPointer<NHttpRequest>;
}

/**
 * HTTP response structure.
 */
@:unreflective
@:include('nakama-cpp/NHttpTransportInterface.h')
@:native('::nakama::NHttpResponse')
extern class NHttpResponse {
    var statusCode: Int32;
    var body: ConstCharStar;
    var errorMessage: ConstCharStar;
}

typedef NHttpResponsePtr = RawPointer<NHttpResponse>;
typedef NHttpResponseCallback = Callable<NHttpResponsePtr->Void>;

/**
 * HTTP transport interface.
 */
@:unreflective
@:include('nakama-cpp/NHttpTransportInterface.h')
@:native('::nakama::NHttpTransportInterface')
extern class NHttpTransportInterface {
    function setBaseUri(uri: ConstCharStar): Void;
    function setTimeout(time: Int64): Void;
    function tick(): Void;
    function request(req: RawPointer<NHttpRequest>, callback: NHttpResponseCallback): Void;
    function cancelAllRequests(): Void;
}

typedef NHttpTransportPtr = RawPointer<NHttpTransportInterface>;

/**
 * Internal HTTP status codes.
 */
@:unreflective
@:include('nakama-cpp/NHttpTransportInterface.h')
@:native('::nakama::InternalStatusCodes')
extern class InternalStatusCodes {
    static var CONNECTION_ERROR: Int32;
    static var NOT_INITIALIZED_ERROR: Int32;
    static var CANCELLED_BY_USER: Int32;
    static var INTERNAL_TRANSPORT_ERROR: Int32;
}