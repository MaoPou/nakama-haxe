package nakama.types;

import cpp.ConstCharStar;
import cpp.RawPointer;
import nakama.types.NTimestamp;

/**
 * Represents a complete leaderboard record.
 */
@:unreflective
@:include('nakama-cpp/data/NLeaderboardRecord.h')
@:native('::nakama::NLeaderboardRecord')
extern class NLeaderboardRecord {
    var leaderboardId: ConstCharStar;
    var ownerId: ConstCharStar;
    var username: ConstCharStar;
    var score: Int64;
    var subscore: Int64;
    var numScore: Int32;
    var maxNumScore: Int32;
    var metadata: ConstCharStar;
    var createTime: NTimestamp;
    var updateTime: NTimestamp;
    var expiryTime: NTimestamp;
    var rank: Int64;
}

typedef NLeaderboardRecordPtr = RawPointer<NLeaderboardRecord>;

/**
 * A set of leaderboard records.
 */
@:unreflective
@:include('nakama-cpp/data/NLeaderboardRecordList.h')
@:native('::nakama::NLeaderboardRecordList')
extern class NLeaderboardRecordList {
    var records: RawPointer<Dynamic>;
    var ownerRecords: RawPointer<Dynamic>;
    var nextCursor: ConstCharStar;
    var prevCursor: ConstCharStar;
    
    function recordsSize(): cpp.SizeT;
    function getRecord(index: cpp.SizeT): NLeaderboardRecordPtr;
    function ownerRecordsSize(): cpp.SizeT;
    function getOwnerRecord(index: cpp.SizeT): NLeaderboardRecordPtr;
}

typedef NLeaderboardRecordListPtr = RawPointer<NLeaderboardRecordList>;