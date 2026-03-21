package nakama.types;

import cpp.ConstCharStar;
import cpp.RawPointer;
import nakama.types.NUserPresence;

/**
 * Represents a realtime match.
 */
@:unreflective
@:include('nakama-cpp/data/NMatch.h')
@:native('::nakama::NMatch')
extern class NMatch {
    var matchId: ConstCharStar;
    var authoritative: Bool;
    var label: ConstCharStar;
    var size: Int32;
    var presences: RawPointer<Dynamic>;
    var self: RawPointer<NUserPresence>;
}

typedef NMatchPtr = RawPointer<NMatch>;

/**
 * A list of realtime matches.
 */
@:unreflective
@:include('nakama-cpp/data/NMatchList.h')
@:native('::nakama::NMatchList')
extern class NMatchList {
    var matches: RawPointer<Dynamic>;
    
    function size(): cpp.SizeT;
    function get(index: cpp.SizeT): NMatchPtr;
}

typedef NMatchListPtr = RawPointer<NMatchList>;