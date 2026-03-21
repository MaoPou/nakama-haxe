package nakama.types;

import cpp.ConstCharStar;
import cpp.RawPointer;
import nakama.types.NTimestamp;

/**
 * A tournament on the server.
 */
@:unreflective
@:include('nakama-cpp/data/NTournament.h')
@:native('::nakama::NTournament')
extern class NTournament {
    var id: ConstCharStar;
    var title: ConstCharStar;
    var description: ConstCharStar;
    var category: Int32;
    var sortOrder: Int32;
    var size: Int32;
    var maxSize: Int32;
    var maxNumScore: Int32;
    var canEnter: Bool;
    var createTime: NTimestamp;
    var startTime: NTimestamp;
    var endTime: NTimestamp;
    var endActive: Int32;
    var nextReset: Int32;
    var duration: Int32;
    var startActive: Int32;
    var metadata: ConstCharStar;
}

typedef NTournamentPtr = RawPointer<NTournament>;

/**
 * A list of tournaments.
 */
@:unreflective
@:include('nakama-cpp/data/NTournamentList.h')
@:native('::nakama::NTournamentList')
extern class NTournamentList {
    var tournaments: RawPointer<Dynamic>;
    var cursor: ConstCharStar;
    
    function size(): cpp.SizeT;
    function get(index: cpp.SizeT): NTournamentPtr;
}

typedef NTournamentListPtr = RawPointer<NTournamentList>;