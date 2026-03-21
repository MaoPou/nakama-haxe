package nakama.types;

import cpp.ConstCharStar;
import cpp.RawPointer;
import nakama.types.NTimestamp;

/**
 * A notification in the server.
 */
@:unreflective
@:include('nakama-cpp/data/NNotification.h')
@:native('::nakama::NNotification')
extern class NNotification {
    var id: ConstCharStar;
    var subject: ConstCharStar;
    var content: ConstCharStar;
    var code: Int32;
    var senderId: ConstCharStar;
    var createTime: NTimestamp;
    var persistent: Bool;
}

typedef NNotificationPtr = RawPointer<NNotification>;

/**
 * A collection of zero or more notifications.
 */
@:unreflective
@:include('nakama-cpp/data/NNotificationList.h')
@:native('::nakama::NNotificationList')
extern class NNotificationList {
    var notifications: RawPointer<Dynamic>;
    var cacheableCursor: ConstCharStar;
    
    function size(): cpp.SizeT;
    function get(index: cpp.SizeT): NNotificationPtr;
}

typedef NNotificationListPtr = RawPointer<NNotificationList>;