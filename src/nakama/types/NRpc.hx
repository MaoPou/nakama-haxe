package nakama.types;

import cpp.ConstCharStar;
import cpp.RawPointer;

/**
 * Execute an Lua function on the server.
 */
@:unreflective
@:include('nakama-cpp/data/NRpc.h')
@:native('::nakama::NRpc')
extern class NRpc {
    var id: ConstCharStar;
    var payload: ConstCharStar;
    var httpKey: ConstCharStar;
}

typedef NRpcPtr = RawPointer<NRpc>;