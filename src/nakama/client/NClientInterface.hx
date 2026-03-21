package nakama.client;

import cpp.Callable;
import cpp.RawPointer;
import cpp.ConstCharStar;
import cpp.Int32;
import cpp.Int64;
import nakama.types.*;
import nakama.session.NSessionInterface;
import nakama.rt.NRtClientInterface;

typedef NSessionPtr = RawPointer<NSessionInterface>;
typedef NClientPtr = RawPointer<NClientInterface>;
typedef ErrorCallback = Callable<NErrorPtr->Void>;

@:unreflective
@:include('nakama-cpp/NClientInterface.h')
@:native('::nakama::NClientInterface')
extern class NClientInterface {
    // 设置错误回调
    function setErrorCallback(callback: ErrorCallback): Void;
    
    // 用户数据
    function setUserData(userData: RawPointer<Dynamic>): Void;
    function getUserData(): RawPointer<Dynamic>;
    
    // 连接管理
    function disconnect(): Void;
    function tick(): Void;
    
    // 创建实时客户端
    function createRtClient(transport: RawPointer<Dynamic>): NRtClientPtr;
    
    // 认证方法
    function authenticateDevice(
        id: ConstCharStar,
        username: ConstCharStar,
        create: Bool,
        vars: NStringMap,
        successCallback: Callable<NSessionPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function authenticateEmail(
        email: ConstCharStar,
        password: ConstCharStar,
        username: ConstCharStar,
        create: Bool,
        vars: NStringMap,
        successCallback: Callable<NSessionPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function authenticateFacebook(
        accessToken: ConstCharStar,
        username: ConstCharStar,
        create: Bool,
        importFriends: Bool,
        vars: NStringMap,
        successCallback: Callable<NSessionPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function authenticateGoogle(
        accessToken: ConstCharStar,
        username: ConstCharStar,
        create: Bool,
        vars: NStringMap,
        successCallback: Callable<NSessionPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function authenticateGameCenter(
        playerId: ConstCharStar,
        bundleId: ConstCharStar,
        timestampSeconds: NTimestamp,
        salt: ConstCharStar,
        signature: ConstCharStar,
        publicKeyUrl: ConstCharStar,
        username: ConstCharStar,
        create: Bool,
        vars: NStringMap,
        successCallback: Callable<NSessionPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function authenticateApple(
        token: ConstCharStar,
        username: ConstCharStar,
        create: Bool,
        vars: NStringMap,
        successCallback: Callable<NSessionPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function authenticateCustom(
        id: ConstCharStar,
        username: ConstCharStar,
        create: Bool,
        vars: NStringMap,
        successCallback: Callable<NSessionPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function authenticateSteam(
        token: ConstCharStar,
        username: ConstCharStar,
        create: Bool,
        vars: NStringMap,
        successCallback: Callable<NSessionPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function authenticateRefresh(
        session: NSessionPtr,
        vars: NStringMap,
        successCallback: Callable<NSessionPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function sessionLogout(
        session: NSessionPtr,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    // 账户管理
    function getAccount(
        session: NSessionPtr,
        successCallback: Callable<NAccountPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function deleteAccount(
        session: NSessionPtr,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function updateAccount(
        session: NSessionPtr,
        username: ConstCharStar,
        displayName: ConstCharStar,
        avatarUrl: ConstCharStar,
        langTag: ConstCharStar,
        location: ConstCharStar,
        timezone: ConstCharStar,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    // 用户信息
    function getUsers(
        session: NSessionPtr,
        ids: RawPointer<Dynamic>,
        usernames: RawPointer<Dynamic>,
        facebookIds: RawPointer<Dynamic>,
        successCallback: Callable<NUsersPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    // 好友管理
    function addFriends(
        session: NSessionPtr,
        ids: RawPointer<Dynamic>,
        usernames: RawPointer<Dynamic>,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function deleteFriends(
        session: NSessionPtr,
        ids: RawPointer<Dynamic>,
        usernames: RawPointer<Dynamic>,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function blockFriends(
        session: NSessionPtr,
        ids: RawPointer<Dynamic>,
        usernames: RawPointer<Dynamic>,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function listFriends(
        session: NSessionPtr,
        limit: Int32,
        state: Int32,
        cursor: ConstCharStar,
        successCallback: Callable<NFriendListPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    // 群组管理
    function createGroup(
        session: NSessionPtr,
        name: ConstCharStar,
        description: ConstCharStar,
        avatarUrl: ConstCharStar,
        langTag: ConstCharStar,
        open: Bool,
        maxCount: Int32,
        successCallback: Callable<NGroupPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function deleteGroup(
        session: NSessionPtr,
        groupId: ConstCharStar,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function addGroupUsers(
        session: NSessionPtr,
        groupId: ConstCharStar,
        ids: RawPointer<Dynamic>,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function listGroupUsers(
        session: NSessionPtr,
        groupId: ConstCharStar,
        limit: Int32,
        state: NUserGroupState,
        cursor: ConstCharStar,
        successCallback: Callable<NGroupUserListPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function kickGroupUsers(
        session: NSessionPtr,
        groupId: ConstCharStar,
        ids: RawPointer<Dynamic>,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function joinGroup(
        session: NSessionPtr,
        groupId: ConstCharStar,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function leaveGroup(
        session: NSessionPtr,
        groupId: ConstCharStar,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function listGroups(
        session: NSessionPtr,
        name: ConstCharStar,
        limit: Int32,
        cursor: ConstCharStar,
        successCallback: Callable<NGroupListPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function listUserGroups(
        session: NSessionPtr,
        limit: Int32,
        state: NUserGroupState,
        cursor: ConstCharStar,
        successCallback: Callable<NUserGroupListPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function promoteGroupUsers(
        session: NSessionPtr,
        groupId: ConstCharStar,
        ids: RawPointer<Dynamic>,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function demoteGroupUsers(
        session: NSessionPtr,
        groupId: ConstCharStar,
        ids: RawPointer<Dynamic>,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function updateGroup(
        session: NSessionPtr,
        groupId: ConstCharStar,
        name: ConstCharStar,
        description: ConstCharStar,
        avatarUrl: ConstCharStar,
        langTag: ConstCharStar,
        open: Bool,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    // 排行榜
    function listLeaderboardRecords(
        session: NSessionPtr,
        leaderboardId: ConstCharStar,
        ownerIds: RawPointer<Dynamic>,
        limit: Int32,
        cursor: ConstCharStar,
        successCallback: Callable<NLeaderboardRecordListPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function listLeaderboardRecordsAroundOwner(
        session: NSessionPtr,
        leaderboardId: ConstCharStar,
        ownerId: ConstCharStar,
        limit: Int32,
        successCallback: Callable<NLeaderboardRecordListPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function writeLeaderboardRecord(
        session: NSessionPtr,
        leaderboardId: ConstCharStar,
        score: Int64,
        subscore: Int64,
        metadata: ConstCharStar,
        successCallback: Callable<NLeaderboardRecordPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function deleteLeaderboardRecord(
        session: NSessionPtr,
        leaderboardId: ConstCharStar,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    // 锦标赛
    function writeTournamentRecord(
        session: NSessionPtr,
        tournamentId: ConstCharStar,
        score: Int64,
        subscore: Int64,
        metadata: ConstCharStar,
        successCallback: Callable<NLeaderboardRecordPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function listTournaments(
        session: NSessionPtr,
        categoryStart: Int32,
        categoryEnd: Int32,
        startTime: Int32,
        endTime: Int32,
        limit: Int32,
        cursor: ConstCharStar,
        successCallback: Callable<NTournamentListPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function listTournamentRecords(
        session: NSessionPtr,
        tournamentId: ConstCharStar,
        limit: Int32,
        cursor: ConstCharStar,
        ownerIds: RawPointer<Dynamic>,
        successCallback: Callable<NTournamentRecordListPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function listTournamentRecordsAroundOwner(
        session: NSessionPtr,
        tournamentId: ConstCharStar,
        ownerId: ConstCharStar,
        limit: Int32,
        successCallback: Callable<NTournamentRecordListPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function joinTournament(
        session: NSessionPtr,
        tournamentId: ConstCharStar,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    // 匹配
    function listMatches(
        session: NSessionPtr,
        minSize: Int32,
        maxSize: Int32,
        limit: Int32,
        label: ConstCharStar,
        query: ConstCharStar,
        authoritative: Bool,
        successCallback: Callable<NMatchListPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    // 通知
    function listNotifications(
        session: NSessionPtr,
        limit: Int32,
        cacheableCursor: ConstCharStar,
        successCallback: Callable<NNotificationListPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function deleteNotifications(
        session: NSessionPtr,
        notificationIds: RawPointer<Dynamic>,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    // 频道消息
    function listChannelMessages(
        session: NSessionPtr,
        channelId: ConstCharStar,
        limit: Int32,
        cursor: ConstCharStar,
        forward: Bool,
        successCallback: Callable<NChannelMessageListPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    // 存储
    function listStorageObjects(
        session: NSessionPtr,
        collection: ConstCharStar,
        limit: Int32,
        cursor: ConstCharStar,
        successCallback: Callable<NStorageObjectListPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function listUsersStorageObjects(
        session: NSessionPtr,
        collection: ConstCharStar,
        userId: ConstCharStar,
        limit: Int32,
        cursor: ConstCharStar,
        successCallback: Callable<NStorageObjectListPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function writeStorageObjects(
        session: NSessionPtr,
        objects: RawPointer<Dynamic>,
        successCallback: Callable<NStorageObjectAcksPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function readStorageObjects(
        session: NSessionPtr,
        objectIds: RawPointer<Dynamic>,
        successCallback: Callable<NStorageObjectsPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function deleteStorageObjects(
        session: NSessionPtr,
        objectIds: RawPointer<Dynamic>,
        successCallback: Callable<Void->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    // RPC
    function rpc(
        session: NSessionPtr,
        id: ConstCharStar,
        payload: ConstCharStar,
        successCallback: Callable<NRpcPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
    
    function rpcWithHttpKey(
        httpKey: ConstCharStar,
        id: ConstCharStar,
        payload: ConstCharStar,
        successCallback: Callable<NRpcPtr->Void>,
        errorCallback: ErrorCallback
    ): Void;
}