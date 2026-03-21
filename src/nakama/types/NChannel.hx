package src.nakama.types;

package nakama.types;

import cpp.ConstCharStar;
import cpp.RawPointer;
import nakama.types.NUserPresence;

/**
 * A realtime chat channel.
 */
@:unreflective
@:include('nakama-cpp/realtime/rtdata/NChannel.h')
@:native('::nakama::NChannel')
extern class NChannel {
    var id: ConstCharStar;
    var presences: RawPointer<Dynamic>;
    var self: RawPointer<NUserPresence>;
    var roomName: ConstCharStar;
    var groupId: ConstCharStar;
    var userIdOne: ConstCharStar;
    var userIdTwo: ConstCharStar;
}

typedef NChannelPtr = RawPointer<NChannel>;

/**
 * A receipt reply from a channel message send operation.
 */
@:unreflective
@:include('nakama-cpp/realtime/rtdata/NChannelMessageAck.h')
@:native('::nakama::NChannelMessageAck')
extern class NChannelMessageAck {
    var channelId: ConstCharStar;
    var messageId: ConstCharStar;
    var username: ConstCharStar;
    var code: Int32;
    var createTime: NTimestamp;
    var updateTime: NTimestamp;
    var persistent: Bool;
    var roomName: ConstCharStar;
    var groupId: ConstCharStar;
    var userIdOne: ConstCharStar;
    var userIdTwo: ConstCharStar;
}

typedef NChannelMessageAckPtr = RawPointer<NChannelMessageAck>;