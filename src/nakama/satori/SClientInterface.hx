package nakama.satori;

import cpp.Callable;
import cpp.RawPointer;
import cpp.ConstCharStar;
import cpp.Int32;
import nakama.types.NErrorPtr;
import nakama.types.NStringMap;
import nakama.satori.*;

typedef SClientPtr = RawPointer<SClientInterface>;

/**
 * Satori client interface.
 */
@:unreflective
@:include('nakama-cpp/satori/SClientInterface.h')
@:native('::Satori::SClientInterface')
extern class SClientInterface {
    function disconnect(): Void;
    function tick(): Void;
    
    // 认证
    function authenticate(
        id: ConstCharStar,
        defaultProperties: NStringMap,
        customProperties: NStringMap,
        successCallback: Callable<SSessionPtr->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
    
    function authenticateRefresh(
        session: SSessionPtr,
        successCallback: Callable<SSessionPtr->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
    
    function authenticateLogout(
        session: SSessionPtr,
        successCallback: Callable<Void->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
    
    function deleteIdentity(
        session: SSessionPtr,
        successCallback: Callable<Void->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
    
    // 事件
    function postEvent(
        session: SSessionPtr,
        events: RawPointer<Dynamic>,
        successCallback: Callable<Void->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
    
    function serverEvent(
        events: RawPointer<Dynamic>,
        successCallback: Callable<Void->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
    
    // 实验
    function getExperiments(
        session: SSessionPtr,
        request: RawPointer<SGetExperimentsRequest>,
        successCallback: Callable<RawPointer<SExperimentList>->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
    
    // 标志
    function getFlags(
        session: SSessionPtr,
        request: RawPointer<SGetFlagsRequest>,
        successCallback: Callable<RawPointer<SFlagList>->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
    
    function getFlagsWithHttpKey(
        httpKey: ConstCharStar,
        request: RawPointer<SGetFlagsRequest>,
        successCallback: Callable<RawPointer<SFlagList>->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
    
    // 实时事件
    function getLiveEvents(
        session: SSessionPtr,
        request: RawPointer<SGetLiveEventsRequest>,
        successCallback: Callable<RawPointer<SLiveEventList>->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
    
    function joinLiveEvent(
        session: SSessionPtr,
        id: ConstCharStar,
        successCallback: Callable<Void->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
    
    // 身份识别
    function identify(
        session: SSessionPtr,
        id: ConstCharStar,
        defaultProperties: NStringMap,
        customProperties: NStringMap,
        successCallback: Callable<SSessionPtr->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
    
    // 属性
    function listIdentityProperties(
        session: SSessionPtr,
        successCallback: Callable<RawPointer<SProperties>->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
    
    function updateProperties(
        session: SSessionPtr,
        defaultProperties: NStringMap,
        customProperties: NStringMap,
        recompute: Bool,
        successCallback: Callable<Void->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
    
    // 消息
    function getMessages(
        session: SSessionPtr,
        limit: Int32,
        forward: Bool,
        cursor: ConstCharStar,
        successCallback: Callable<RawPointer<SGetMessageListResponse>->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
    
    function updateMessage(
        session: SSessionPtr,
        messageId: ConstCharStar,
        readTime: Int64,
        consumeTime: Int64,
        successCallback: Callable<Void->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
    
    function deleteMessage(
        session: SSessionPtr,
        messageId: ConstCharStar,
        successCallback: Callable<Void->Void>,
        errorCallback: Callable<NErrorPtr->Void>
    ): Void;
}