package nakama.types;

import cpp.ConstCharStar;
import nakama.types.NTimestamp;

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