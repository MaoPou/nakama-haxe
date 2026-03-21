package nakama.rt;

import cpp.ConstCharStar;
import cpp.UInt16;

@:unreflective
@:include('nakama-cpp/realtime/NRtClientDisconnectInfo.h')
@:native('::nakama::NRtClientDisconnectInfo')
extern class NRtClientDisconnectInfo {
    var code: UInt16;
    var reason: ConstCharStar;
    var remote: Bool;
}