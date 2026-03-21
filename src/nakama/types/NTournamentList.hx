package nakama.types;

import cpp.RawPointer;
import nakama.types.NTournament;
import cpp.SizeT;
import cpp.ConstCharStar;

/**
 * A list of tournaments.
 */
@:unreflective
@:include('nakama-cpp/data/NTournamentList.h')
@:native('::nakama::NTournamentList')
extern class NTournamentList {
    var tournaments: RawPointer<VectorNTournament>;
    var cursor: ConstCharStar;
}

@:unreflective
@:include('nakama-cpp/data/NTournamentList.h')
@:native('::std::vector<::nakama::NTournament>')
extern class VectorNTournament {
    function size(): SizeT;
    function at(index: SizeT): RawPointer<NTournament>;
}

typedef NTournamentListPtr = RawPointer<NTournamentList>;