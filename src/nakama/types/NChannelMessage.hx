package nakama.types;

import cpp.ConstCharStar;
import nakama.types.NTimestamp;

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