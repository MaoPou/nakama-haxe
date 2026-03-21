package nakama.types;

import cpp.ConstCharStar;
import cpp.RawPointer;
import nakama.types.NTimestamp;

/**
 * A group in the server.
 */
@:unreflective
@:include('nakama-cpp/data/NGroup.h')
@:native('::nakama::NGroup')
extern class NGroup {
    var id: ConstCharStar;
    var creatorId: ConstCharStar;
    var name: ConstCharStar;
    var description: ConstCharStar;
    var lang: ConstCharStar;
    var metadata: ConstCharStar;
    var avatarUrl: ConstCharStar;
    var open: Bool;
    var edgeCount: Int32;
    var maxCount: Int32;
    var createTime: NTimestamp;
    var updateTime: NTimestamp;
}

typedef NGroupPtr = RawPointer<NGroup>;

/**
 * One or more groups returned from a listing operation.
 */
@:unreflective
@:include('nakama-cpp/data/NGroupList.h')
@:native('::nakama::NGroupList')
extern class NGroupList {
    var groups: RawPointer<Dynamic>;
    var cursor: ConstCharStar;
    
    function size(): cpp.SizeT;
    function get(index: cpp.SizeT): NGroupPtr;
}

typedef NGroupListPtr = RawPointer<NGroupList>;