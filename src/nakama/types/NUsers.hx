package nakama.types;

import cpp.RawPointer;
import nakama.types.NUser;
import cpp.SizeT;

/**
 * A collection of zero or more users.
 */
@:unreflective
@:include('nakama-cpp/data/NUsers.h')
@:native('::nakama::NUsers')
extern class NUsers {
    var users: RawPointer<VectorNUser>;

    @:native('users')
    function getUsers(): RawPointer<VectorNUser>;
}

@:unreflective
@:include('nakama-cpp/data/NUsers.h')
@:native('::std::vector<::nakama::NUser>')
extern class VectorNUser {
    function size(): SizeT;
    function at(index: SizeT): RawPointer<NUser>;
}