package nakama.types;

import cpp.RawPointer;
import nakama.types.NUser;
import nakama.types.NUserGroupState;

/**
 * A single user-role pair.
 */
@:unreflective
@:include('nakama-cpp/data/NGroupUser.h')
@:native('::nakama::NGroupUser')
extern class NGroupUser {
    var user: RawPointer<NUser>;
    var state: NUserGroupState;
}