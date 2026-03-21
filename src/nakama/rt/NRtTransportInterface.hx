package nakama.rt;

import cpp.Callable;
import cpp.RawPointer;
import cpp.ConstCharStar;
import cpp.UInt32;
import nakama.types.NBytes;
import nakama.rt.NRtClientDisconnectInfo;

@:unreflective
@:include('nakama-cpp/realtime/NRtTransportInterface.h')
@:native('::nakama::NRtTransportInterface')
extern class NRtTransportInterface {
    function setConnectCallback(callback: Callable<Void->Void>): Void;
    function setDisconnectCallback(callback: Callable<RawPointer<NRtClientDisconnectInfo>->Void>): Void;
    function setErrorCallback(callback: Callable<ConstCharStar->Void>): Void;
    function setMessageCallback(callback: Callable<NBytes->Void>): Void;
    
    function setActivityTimeout(timeoutMs: UInt32): Void;
    function getActivityTimeout(): UInt32;
    
    function tick(): Void;
    function connect(url: ConstCharStar, type: Int32): Void;
    function isConnected(): Bool;
    function isConnecting(): Bool;
    function disconnect(): Void;
    function send(data: NBytes): Bool;
}

typedef NRtTransportPtr = RawPointer<NRtTransportInterface>;