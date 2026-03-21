package nakama.rt;

import cpp.RawPointer;
import nakama.rt.NRtTransportInterface;

@:unreflective
@:include('nakama-cpp/realtime/NWebsocketsFactory.h')
@:native('::nakama::')
extern class NWebsocketsFactory {
    #if NAKAMA_HAVE_DEFAULT_RT_TRANSPORT
    @:native('createDefaultWebsocket')
    static function createDefaultWebsocket(platformParams: RawPointer<Dynamic>): NRtTransportPtr;
    #end
}