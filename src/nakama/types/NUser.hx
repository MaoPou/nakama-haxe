package nakama.types;

import cpp.ConstCharStar;
import cpp.RawPointer;
import nakama.types.NTimestamp;

/**
 * A user in the server.
 */
@:unreflective
@:include('nakama-cpp/data/NUser.h')
@:native('::nakama::NUser')
extern class NUser {
    var id: ConstCharStar;
    var username: ConstCharStar;
    var displayName: ConstCharStar;
    var avatarUrl: ConstCharStar;
    var lang: ConstCharStar;
    var location: ConstCharStar;
    var timeZone: ConstCharStar;
    var metadata: ConstCharStar;
    var facebookId: ConstCharStar;
    var googleId: ConstCharStar;
    var gameCenterId: ConstCharStar;
    var appleId: ConstCharStar;
    var steamId: ConstCharStar;
    var online: Bool;
    var edgeCount: Int32;
    var createdAt: NTimestamp;
    var updatedAt: NTimestamp;
}

typedef NUserPtr = RawPointer<NUser>;

/**
 * A collection of zero or more users.
 */
@:unreflective
@:include('nakama-cpp/data/NUsers.h')
@:native('::nakama::NUsers')
extern class NUsers {
    var users: RawPointer<Dynamic>; // std::vector<NUser>
    
    function size(): cpp.SizeT;
    function get(index: cpp.SizeT): NUserPtr;
}

typedef NUsersPtr = RawPointer<NUsers>;