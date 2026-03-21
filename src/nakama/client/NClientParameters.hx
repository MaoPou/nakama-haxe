package nakama.client;

import cpp.ConstCharStar;
import cpp.Int32;
import cpp.RawPointer;
import nakama.types.NTimestamp;

@:unreflective
@:include('nakama-cpp/ClientFactory.h')
@:native('::nakama::NClientParameters')
extern class NClientParameters {
    var serverKey: ConstCharStar;
    var host: ConstCharStar;
    var port: Int32;
    var ssl: Bool;
    var timeout: Int64;
    
    @:native('new nakama::NClientParameters')
    static function create(): RawPointer<NClientParameters>;
    
    @:native('serverKey')
    function setServerKey(key: ConstCharStar): Void;
    
    @:native('host')
    function setHost(h: ConstCharStar): Void;
    
    @:native('port')
    function setPort(p: Int32): Void;
    
    @:native('ssl')
    function setSSL(enable: Bool): Void;
    
    @:native('timeout')
    function setTimeout(ms: Int64): Void;
}