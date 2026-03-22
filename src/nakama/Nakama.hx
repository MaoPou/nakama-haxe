package nakama;

import cpp.Lib;

@:include('nakama_wrapper.h')
@:buildXml('
    <include name="${haxelib:nakama-sdk}/include/nakama_wrapper.h" />
')
extern class Nakama {
    static function client_create(serverKey:String, host:String, port:Int, ssl:Bool):Dynamic;
    static function client_destroy(client:Dynamic):Void;
    static function client_tick(client:Dynamic):Void;
    static function authenticate_device(
        client:Dynamic,
        deviceId:String,
        username:String,
        create:Bool,
        onSuccess:SessionCallback,
        onError:ErrorCallback,
        userData:Dynamic
    ):Void;
}

typedef SessionCallback = (token:String, refreshToken:String, userData:Dynamic) -> Void;
typedef ErrorCallback = (message:String, code:Int, userData:Dynamic) -> Void;