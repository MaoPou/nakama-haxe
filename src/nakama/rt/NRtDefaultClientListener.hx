package nakama.rt;

import cpp.Callable;
import cpp.RawPointer;
import nakama.types.*;
import nakama.rt.NRtError;
import nakama.rt.NRtClientDisconnectInfo;

@:unreflective
@:include('nakama-cpp/realtime/NRtDefaultClientListener.h')
@:native('::nakama::NRtDefaultClientListener')
extern class NRtDefaultClientListener {
    @:native('new nakama::NRtDefaultClientListener')
    static function create(): RawPointer<NRtDefaultClientListener>;
    
    function setConnectCallback(callback: Callable<Void->Void>): Void;
    function setDisconnectCallback(callback: Callable<RawPointer<NRtClientDisconnectInfo>->Void>): Void;
    function setErrorCallback(callback: Callable<RawPointer<NRtError>->Void>): Void;
    function setChannelMessageCallback(callback: Callable<RawPointer<NChannelMessage>->Void>): Void;
    function setChannelPresenceCallback(callback: Callable<RawPointer<NChannelPresenceEvent>->Void>): Void;
    function setMatchmakerMatchedCallback(callback: Callable<RawPointer<NMatchmakerMatched>->Void>): Void;
    function setMatchDataCallback(callback: Callable<RawPointer<NMatchData>->Void>): Void;
    function setMatchPresenceCallback(callback: Callable<RawPointer<NMatchPresenceEvent>->Void>): Void;
    function setNotificationsCallback(callback: Callable<RawPointer<NNotificationList>->Void>): Void;
    function setStatusPresenceCallback(callback: Callable<RawPointer<NStatusPresenceEvent>->Void>): Void;
    function setStreamPresenceCallback(callback: Callable<RawPointer<NStreamPresenceEvent>->Void>): Void;
    function setStreamDataCallback(callback: Callable<RawPointer<NStreamData>->Void>): Void;
}