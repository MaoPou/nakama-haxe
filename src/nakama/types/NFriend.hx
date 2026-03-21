package nakama.types;

import cpp.ConstCharStar;
import cpp.RawPointer;
import nakama.types.NUser;
import nakama.types.NTimestamp;

/**
 * A friend of a user.
 */
@:unreflective
@:include('nakama-cpp/data/NFriend.h')
@:native('::nakama::NFriend')
extern class NFriend {
    var user: NUser;
    var state: Int32; // NFriend::State enum
    var updateTime: NTimestamp;
}

typedef NFriendPtr = RawPointer<NFriend>;

/**
 * A collection of zero or more friends of the user.
 */
@:unreflective
@:include('nakama-cpp/data/NFriendList.h')
@:native('::nakama::NFriendList')
extern class NFriendList {
    var friends: RawPointer<Dynamic>;
    var cursor: ConstCharStar;
    
    function size(): cpp.SizeT;
    function get(index: cpp.SizeT): NFriendPtr;
}

typedef NFriendListPtr = RawPointer<NFriendList>;