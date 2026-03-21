package nakama.types;

import cpp.RawPointer;
import nakama.types.NMatch;
import cpp.SizeT;

/**
 * A list of realtime matches.
 */
@:unreflective
@:include('nakama-cpp/data/NMatchList.h')
@:native('::nakama::NMatchList')
extern class NMatchList {
    var matches: RawPointer<VectorNMatch>;
}

@:unreflective
@:include('nakama-cpp/data/NMatchList.h')
@:native('::std::vector<::nakama::NMatch>')
extern class VectorNMatch {
    function size(): SizeT;
    function at(index: SizeT): RawPointer<NMatch>;
}

typedef NMatchListPtr = RawPointer<NMatchList>;