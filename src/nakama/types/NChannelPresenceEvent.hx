package nakama.types;

import cpp.RawPointer;
import nakama.types.NUserPresence;
import cpp.SizeT;
import cpp.ConstCharStar;

/**
 * A set of joins and leaves on a particular channel.
 */
@:unreflective
@:include('nakama-cpp/realtime/rtdata/NChannelPresenceEvent.h')
@:native('::nakama::NChannelPresenceEvent')
extern class NChannelPresenceEvent {
    var channelId: ConstCharStar;
    var joins: RawPointer<VectorNUserPresence>;
    var leaves: RawPointer<VectorNUserPresence>;
    var roomName: ConstCharStar;
    var groupId: ConstCharStar;
    var userIdOne: ConstCharStar;
    var userIdTwo: ConstCharStar;
}