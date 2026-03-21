package nakama.types;

import cpp.RawPointer;
import nakama.types.NLeaderboardRecord;
import cpp.SizeT;
import cpp.ConstCharStar;

/**
 * A set of tournament records.
 */
@:unreflective
@:include('nakama-cpp/data/NTournamentRecordList.h')
@:native('::nakama::NTournamentRecordList')
extern class NTournamentRecordList {
    var records: RawPointer<VectorNLeaderboardRecord>;
    var ownerRecords: RawPointer<VectorNLeaderboardRecord>;
    var nextCursor: ConstCharStar;
    var prevCursor: ConstCharStar;
}

typedef NTournamentRecordListPtr = RawPointer<NTournamentRecordList>;