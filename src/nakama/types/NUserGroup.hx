package nakama.types;

import cpp.RawPointer;
import nakama.types.NGroup;
import nakama.types.NUserGroupState;

/**
 * A single group-role pair.
 */
@:unreflective
@:include('nakama-cpp/data/NUserGroup.h')
@:native('::nakama::NUserGroup')
extern class NUserGroup {
    var group: RawPointer<NGroup>;
    var state: NUserGroupState;
}