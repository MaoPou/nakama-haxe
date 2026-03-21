package nakama.types;

import cpp.RawPointer;
import nakama.types.NLeaderboardRecord;
import cpp.SizeT;
import cpp.ConstCharStar;

/**
 * A set of leaderboard records.
 */
@:unreflective
@:include('nakama-cpp/data/NLeaderboardRecordList.h')
@:native('::nakama::NLeaderboardRecordList')
extern class NLeaderboardRecordList {
    var records: RawPointer<VectorNLeaderboardRecord>;
    var ownerRecords: RawPointer<VectorNLeaderboardRecord>;
    var nextCursor: ConstCharStar;
    var prevCursor: ConstCharStar;
}

@:unreflective
@:include('nakama-cpp/data/NLeaderboardRecordList.h')
@:native('::std::vector<::nakama::NLeaderboardRecord>')
extern class VectorNLeaderboardRecord {
    function size(): SizeT;
    function at(index: SizeT): RawPointer<NLeaderboardRecord>;
}

typedef NLeaderboardRecordListPtr = RawPointer<NLeaderboardRecordList>;