package nakama.types;

import cpp.RawPointer;
import nakama.types.NNotification;
import cpp.SizeT;
import cpp.ConstCharStar;

/**
 * A collection of zero or more notifications.
 */
@:unreflective
@:include('nakama-cpp/data/NNotificationList.h')
@:native('::nakama::NNotificationList')
extern class NNotificationList {
    var notifications: RawPointer<VectorNNotification>;
    var cacheableCursor: ConstCharStar;
}

@:unreflective
@:include('nakama-cpp/data/NNotificationList.h')
@:native('::std::vector<::nakama::NNotification>')
extern class VectorNNotification {
    function size(): SizeT;
    function at(index: SizeT): RawPointer<NNotification>;
}

typedef NNotificationListPtr = RawPointer<NNotificationList>;