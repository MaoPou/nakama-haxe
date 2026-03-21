package nakama.types;

import cpp.RawPointer;
import nakama.types.NUserGroup;
import cpp.SizeT;
import cpp.ConstCharStar;

/**
 * A list of groups belonging to a user, along with the user's role in each group.
 */
@:unreflective
@:include('nakama-cpp/data/NUserGroupList.h')
@:native('::nakama::NUserGroupList')
extern class NUserGroupList {
    var userGroups: RawPointer<VectorNUserGroup>;
    var cursor: ConstCharStar;
}

@:unreflective
@:include('nakama-cpp/data/NUserGroupList.h')
@:native('::std::vector<::nakama::NUserGroup>')
extern class VectorNUserGroup {
    function size(): SizeT;
    function at(index: SizeT): RawPointer<NUserGroup>;
}

typedef NUserGroupListPtr = RawPointer<NUserGroupList>;