package nakama.types;

import cpp.ConstCharStar;
import cpp.RawPointer;
import nakama.types.NTimestamp;
import nakama.types.NStringMap;
import nakama.types.NStringDoubleMap;

/**
 * A user session associated to a stream.
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

/**
 * A message sent on a channel.
 */
@:unreflective
@:include('nakama-cpp/data/NChannelMessage.h')
@:native('::nakama::NChannelMessage')
extern class NChannelMessage {
    var channelId: ConstCharStar;
    var messageId: ConstCharStar;
    var code: Int32;
    var senderId: ConstCharStar;
    var username: ConstCharStar;
    var content: ConstCharStar;
    var createTime: NTimestamp;
    var updateTime: NTimestamp;
    var persistent: Bool;
    var roomName: ConstCharStar;
    var groupId: ConstCharStar;
    var userIdOne: ConstCharStar;
    var userIdTwo: ConstCharStar;
}

typedef NChannelMessagePtr = RawPointer<NChannelMessage>;

/**
 * A list of channel messages.
 */
@:unreflective
@:include('nakama-cpp/data/NChannelMessageList.h')
@:native('::nakama::NChannelMessageList')
extern class NChannelMessageList {
    var messages: RawPointer<Dynamic>;
    var nextCursor: ConstCharStar;
    var prevCursor: ConstCharStar;
    
    function size(): cpp.SizeT;
    function get(index: cpp.SizeT): NChannelMessagePtr;
}

typedef NChannelMessageListPtr = RawPointer<NChannelMessageList>;

/**
 * A set of joins and leaves on a particular channel.
 */
@:unreflective
@:include('nakama-cpp/realtime/rtdata/NChannelPresenceEvent.h')
@:native('::nakama::NChannelPresenceEvent')
extern class NChannelPresenceEvent {
    var channelId: ConstCharStar;
    var joins: RawPointer<Dynamic>;
    var leaves: RawPointer<Dynamic>;
    var roomName: ConstCharStar;
    var groupId: ConstCharStar;
    var userIdOne: ConstCharStar;
    var userIdTwo: ConstCharStar;
}

typedef NChannelPresenceEventPtr = RawPointer<NChannelPresenceEvent>;

/**
 * Realtime match data received from the server.
 */
@:unreflective
@:include('nakama-cpp/realtime/rtdata/NMatchData.h')
@:native('::nakama::NMatchData')
extern class NMatchData {
    var matchId: ConstCharStar;
    var presence: RawPointer<NUserPresence>;
    var opCode: Int64;
    var data: NBytes;
}

typedef NMatchDataPtr = RawPointer<NMatchData>;

/**
 * A successful matchmaking result.
 */
@:unreflective
@:include('nakama-cpp/realtime/rtdata/NMatchmakerMatched.h')
@:native('::nakama::NMatchmakerMatched')
extern class NMatchmakerMatched {
    var ticket: ConstCharStar;
    var matchId: ConstCharStar;
    var token: ConstCharStar;
    var users: RawPointer<Dynamic>;
    var self: RawPointer<Dynamic>;
}

typedef NMatchmakerMatchedPtr = RawPointer<NMatchmakerMatched>;

/**
 * A ticket representing a new matchmaking process.
 */
@:unreflective
@:include('nakama-cpp/realtime/rtdata/NMatchmakerTicket.h')
@:native('::nakama::NMatchmakerTicket')
extern class NMatchmakerTicket {
    var ticket: ConstCharStar;
}

typedef NMatchmakerTicketPtr = RawPointer<NMatchmakerTicket>;

/**
 * A set of joins and leaves on a particular realtime match.
 */
@:unreflective
@:include('nakama-cpp/realtime/rtdata/NMatchPresenceEvent.h')
@:native('::nakama::NMatchPresenceEvent')
extern class NMatchPresenceEvent {
    var matchId: ConstCharStar;
    var joins: RawPointer<Dynamic>;
    var leaves: RawPointer<Dynamic>;
}

typedef NMatchPresenceEventPtr = RawPointer<NMatchPresenceEvent>;

/**
 * A snapshot of statuses for some set of users.
 */
@:unreflective
@:include('nakama-cpp/realtime/rtdata/NStatus.h')
@:native('::nakama::NStatus')
extern class NStatus {
    var presences: RawPointer<Dynamic>;
}

typedef NStatusPtr = RawPointer<NStatus>;

/**
 * A batch of status updates for a given user.
 */
@:unreflective
@:include('nakama-cpp/realtime/rtdata/NStatusPresenceEvent.h')
@:native('::nakama::NStatusPresenceEvent')
extern class NStatusPresenceEvent {
    var joins: RawPointer<Dynamic>;
    var leaves: RawPointer<Dynamic>;
}

typedef NStatusPresenceEventPtr = RawPointer<NStatusPresenceEvent>;

/**
 * Represents identifying information for a stream.
 */
@:unreflective
@:include('nakama-cpp/realtime/rtdata/NStream.h')
@:native('::nakama::NStream')
extern class NStream {
    var mode: Int32;
    var subject: ConstCharStar;
    var subcontext: ConstCharStar;
    var label: ConstCharStar;
}

/**
 * A data message delivered over a stream.
 */
@:unreflective
@:include('nakama-cpp/realtime/rtdata/NStreamData.h')
@:native('::nakama::NStreamData')
extern class NStreamData {
    var stream: RawPointer<NStream>;
    var sender: RawPointer<NUserPresence>;
    var data: ConstCharStar;
}

typedef NStreamDataPtr = RawPointer<NStreamData>;

/**
 * A set of joins and leaves on a particular stream.
 */
@:unreflective
@:include('nakama-cpp/realtime/rtdata/NStreamPresenceEvent.h')
@:native('::nakama::NStreamPresenceEvent')
extern class NStreamPresenceEvent {
    var stream: RawPointer<NStream>;
    var joins: RawPointer<Dynamic>;
    var leaves: RawPointer<Dynamic>;
}

typedef NStreamPresenceEventPtr = RawPointer<NStreamPresenceEvent>;