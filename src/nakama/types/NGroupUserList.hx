package nakama.types;

import cpp.RawPointer;
import nakama.types.NGroupUser;
import cpp.SizeT;
import cpp.ConstCharStar;

/**
 * A list of users belonging to a group, along with their role.
 */
@:unreflective
@:include('nakama-cpp/data/NGroupUserList.h')
@:native('::nakama::NGroupUserList')
extern class NGroupUserList {
    var groupUsers: RawPointer<VectorNGroupUser>;
    var cursor: ConstCharStar;
}

@:unreflective
@:include('nakama-cpp/data/NGroupUserList.h')
@:native('::std::vector<::nakama::NGroupUser>')
extern class VectorNGroupUser {
    function size(): SizeT;
    function at(index: SizeT): RawPointer<NGroupUser>;
}

typedef NGroupUserListPtr = RawPointer<NGroupUserList>;