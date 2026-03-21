package nakama.rt;

import cpp.Callable;
import cpp.RawPointer;
import cpp.ConstCharStar;
import cpp.Int32;
import cpp.Int64;
import nakama.types.*;
import nakama.session.NSessionInterface;
import nakama.rt.NRtClientListenerInterface;
import nakama.rt.NRtClientDisconnectInfo;
import nakama.rt.NRtError;

typedef NRtClientPtr = RawPointer<NRtClientInterface>;

@:unreflective
@:include('nakama-cpp/realtime/NRtClientInterface.h')
@:native('::nakama::NRtClientInterface')
extern class NRtClientInterface {
    /**
     * Pumps requests queue in your thread.
     */
    function tick(): Void;
    
    /**
     * Set events listener.
     */
    function setListener(listener: RawPointer<NRtClientListenerInterface>): Void;
    
    /**
     * Connect to the server.
     */
    function connect(session: RawPointer<NSessionInterface>, createStatus: Bool, protocol: Int32): Void;
    
    /**
     * @return True if connected to server.
     */
    function isConnected(): Bool;
    
    /**
     * Close the connection with the server.
     */
    function disconnect(): Void;
    
    /**
     * Join a chat channel on the server.
     */
    function joinChat(
        target: ConstCharStar,
        type: NChannelType,
        persistence: Bool,
        hidden: Bool,
        successCallback: Callable<RawPointer<NChannel>->Void>,
        errorCallback: Callable<RawPointer<NRtError>->Void>
    ): Void;
    
    /**
     * Leave a chat channel on the server.
     */
    function leaveChat(
        channelId: ConstCharStar,
        successCallback: Callable<Void->Void>,
        errorCallback: Callable<RawPointer<NRtError>->Void>
    ): Void;
    
    /**
     * Send a chat message to a channel on the server.
     */
    function writeChatMessage(
        channelId: ConstCharStar,
        content: ConstCharStar,
        successCallback: Callable<RawPointer<NChannelMessageAck>->Void>,
        errorCallback: Callable<RawPointer<NRtError>->Void>
    ): Void;
    
    /**
     * Update a chat message on the server.
     */
    function updateChatMessage(
        channelId: ConstCharStar,
        messageId: ConstCharStar,
        content: ConstCharStar,
        successCallback: Callable<RawPointer<NChannelMessageAck>->Void>,
        errorCallback: Callable<RawPointer<NRtError>->Void>
    ): Void;
    
    /**
     * Remove a chat message from a channel.
     */
    function removeChatMessage(
        channelId: ConstCharStar,
        messageId: ConstCharStar,
        successCallback: Callable<RawPointer<NChannelMessageAck>->Void>,
        errorCallback: Callable<RawPointer<NRtError>->Void>
    ): Void;
    
    /**
     * Create a multiplayer match on the server.
     */
    function createMatch(
        successCallback: Callable<RawPointer<NMatch>->Void>,
        errorCallback: Callable<RawPointer<NRtError>->Void>
    ): Void;
    
    /**
     * Join a multiplayer match by ID.
     */
    function joinMatch(
        matchId: ConstCharStar,
        metadata: NStringMap,
        successCallback: Callable<RawPointer<NMatch>->Void>,
        errorCallback: Callable<RawPointer<NRtError>->Void>
    ): Void;
    
    /**
     * Join a multiplayer match with a matchmaker token.
     */
    function joinMatchByToken(
        token: ConstCharStar,
        successCallback: Callable<RawPointer<NMatch>->Void>,
        errorCallback: Callable<RawPointer<NRtError>->Void>
    ): Void;
    
    /**
     * Leave a match on the server.
     */
    function leaveMatch(
        matchId: ConstCharStar,
        successCallback: Callable<Void->Void>,
        errorCallback: Callable<RawPointer<NRtError>->Void>
    ): Void;
    
    /**
     * Join the matchmaker pool.
     */
    function addMatchmaker(
        minCount: Int32,
        maxCount: Int32,
        query: ConstCharStar,
        stringProperties: NStringMap,
        numericProperties: NStringDoubleMap,
        countMultiple: Int32,
        successCallback: Callable<RawPointer<NMatchmakerTicket>->Void>,
        errorCallback: Callable<RawPointer<NRtError>->Void>
    ): Void;
    
    /**
     * Leave the matchmaker pool.
     */
    function removeMatchmaker(
        ticket: ConstCharStar,
        successCallback: Callable<Void->Void>,
        errorCallback: Callable<RawPointer<NRtError>->Void>
    ): Void;
    
    /**
     * Send a state change to a match on the server.
     */
    function sendMatchData(
        matchId: ConstCharStar,
        opCode: Int64,
        data: ConstCharStar,
        dataSize: cpp.SizeT
    ): Void;
    
    /**
     * Follow one or more users for status updates.
     */
    function followUsers(
        userIds: RawPointer<Dynamic>,
        successCallback: Callable<RawPointer<NStatus>->Void>,
        errorCallback: Callable<RawPointer<NRtError>->Void>
    ): Void;
    
    /**
     * Unfollow status updates for one or more users.
     */
    function unfollowUsers(
        userIds: RawPointer<Dynamic>,
        successCallback: Callable<Void->Void>,
        errorCallback: Callable<RawPointer<NRtError>->Void>
    ): Void;
    
    /**
     * Update the user's status online.
     */
    function updateStatus(
        status: ConstCharStar,
        successCallback: Callable<Void->Void>,
        errorCallback: Callable<RawPointer<NRtError>->Void>
    ): Void;
    
    /**
     * Send an RPC message to the server.
     */
    function rpc(
        id: ConstCharStar,
        payload: ConstCharStar,
        successCallback: Callable<RawPointer<NRpc>->Void>,
        errorCallback: Callable<RawPointer<NRtError>->Void>
    ): Void;
}