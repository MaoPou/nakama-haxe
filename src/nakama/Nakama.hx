package nakama;

@:cppFileCode('
#include "nakama-cpp/Nakama.h"
#include "nakama-cpp/ClientFactory.h"

using namespace Nakama;
')

@:native("Nakama::NClientParameters")
extern class NClientParameters {
    public function new();
    public var host:String;
    public var port:Int;
    public var serverKey:String;
    public var scheme:String;
}

@:native("Nakama::NClientInterface")
extern class NClient {
    public function tick():Void;
}

@:native("Nakama::createDefaultClient")
extern function createDefaultClient(params:NClientParameters):NClient;

class NakamaClient {
    public var native:NClient;

    public function new(host:String, port:Int, serverKey:String, scheme:String = "http") {
        var p = new NClientParameters();
        p.host = host;
        p.port = port;
        p.serverKey = serverKey;
        p.scheme = scheme;

        native = createDefaultClient(p);
    }

    public function tick():Void {
        native.tick();
    }

    #if lime
    public function autoTick():Void {
        lime.app.Application.current.addUpdateFunc(_ -> tick());
    }
    #end
}
