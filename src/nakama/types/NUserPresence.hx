package nakama.types;

import cpp.ConstCharStar;

/**
 * A user session associated to a stream, usually through a list operation or a join/leave event.
 */
@:unreflective
@:include('nakama-cpp/realtime/rtdata/NUserPresence.h')
@:native('::nakama::NUserPresence')
extern class NUserPresence {
    var userId: ConstCharStar;
    var sessionId: ConstCharStar;
    var username: ConstCharStar;
    var persistence: Bool;
    var status: ConstCharStar;
}