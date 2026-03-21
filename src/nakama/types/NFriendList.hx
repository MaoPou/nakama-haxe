package nakama.types;

import cpp.RawPointer;
import nakama.types.NFriend;
import cpp.SizeT;
import cpp.ConstCharStar;

/**
 * A collection of zero or more friends of the user.
 */
@:unreflective
@:include('nakama-cpp/data/NFriendList.h')
@:native('::nakama::NFriendList')
extern class NFriendList {
    var friends: RawPointer<VectorNFriend>;
    var cursor: ConstCharStar;
}

@:unreflective
@:include('nakama-cpp/data/NFriendList.h')
@:native('::std::vector<::nakama::NFriend>')
extern class VectorNFriend {
    function size(): SizeT;
    function at(index: SizeT): RawPointer<NFriend>;
}

typedef NFriendListPtr = RawPointer<NFriendList>;