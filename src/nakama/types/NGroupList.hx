package nakama.types;

import cpp.RawPointer;
import nakama.types.NGroup;
import cpp.SizeT;
import cpp.ConstCharStar;

/**
 * One or more groups returned from a listing operation.
 */
@:unreflective
@:include('nakama-cpp/data/NGroupList.h')
@:native('::nakama::NGroupList')
extern class NGroupList {
    var groups: RawPointer<VectorNGroup>;
    var cursor: ConstCharStar;
}

@:unreflective
@:include('nakama-cpp/data/NGroupList.h')
@:native('::std::vector<::nakama::NGroup>')
extern class VectorNGroup {
    function size(): SizeT;
    function at(index: SizeT): RawPointer<NGroup>;
}

typedef NGroupListPtr = RawPointer<NGroupList>;