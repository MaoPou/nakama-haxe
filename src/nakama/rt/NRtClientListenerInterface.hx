package nakama.rt;

import cpp.Callable;
import cpp.RawPointer;
import nakama.types.*;
import nakama.rt.NRtError;
import nakama.rt.NRtClientDisconnectInfo;

@:unreflective
@:include('nakama-cpp/realtime/NRtClientListenerInterface.h')
@:native('::nakama::NRtClientListenerInterface')
extern class NRtClientListenerInterface {
    function onConnect(): Void;
    function onDisconnect(info: RawPointer<NRtClientDisconnectInfo>): Void;
    function onError(error: RawPointer<NRtError>): Void;
    function onChannelMessage(message: RawPointer<NChannelMessage>): Void;
    function onChannelPresence(presence: RawPointer<NChannelPresenceEvent>): Void;
    function onMatchmakerMatched(matched: RawPointer<NMatchmakerMatched>): Void;
    function onMatchData(matchData: RawPointer<NMatchData>): Void;
    function onMatchPresence(matchPresence: RawPointer<NMatchPresenceEvent>): Void;
    function onNotifications(notifications: RawPointer<NNotificationList>): Void;
    function onStatusPresence(presence: RawPointer<NStatusPresenceEvent>): Void;
    function onStreamPresence(presence: RawPointer<NStreamPresenceEvent>): Void;
    function onStreamData(data: RawPointer<NStreamData>): Void;
}

typedef NRtClientListenerPtr = RawPointer<NRtClientListenerInterface>;