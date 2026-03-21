package nakama.satori;

import cpp.ConstCharStar;
import cpp.RawPointer;
import cpp.Int32;
import cpp.Int64;
import nakama.types.NStringMap;
import nakama.types.NTimestamp;

/**
 * Satori authentication request.
 */
@:unreflective
@:include('nakama-cpp/satori/HardcodedLowLevelSatoriAPI.h')
@:native('::Satori::SAuthenticateRequest')
extern class SAuthenticateRequest {
    var id: ConstCharStar;
    var default_properties: NStringMap;
    var custom_properties: NStringMap;
    var no_session: Bool;
}

/**
 * Satori event.
 */
@:unreflective
@:include('nakama-cpp/satori/HardcodedLowLevelSatoriAPI.h')
@:native('::Satori::SEvent')
extern class SEvent {
    var name: ConstCharStar;
    var id: ConstCharStar;
    var metadata: NStringMap;
    var value: ConstCharStar;
    var timestamp: NTimestamp;
    var identity_id: ConstCharStar;
    var session_id: ConstCharStar;
    var session_issued_at: Int64;
    var session_expires_at: Int64;
}

/**
 * Satori experiment.
 */
@:unreflective
@:include('nakama-cpp/satori/HardcodedLowLevelSatoriAPI.h')
@:native('::Satori::SExperiment')
extern class SExperiment {
    var name: ConstCharStar;
    var value: ConstCharStar;
    var labels: RawPointer<Dynamic>;
    var phase_name: ConstCharStar;
    var phase_variant_name: ConstCharStar;
}

/**
 * Satori experiment list.
 */
@:unreflective
@:include('nakama-cpp/satori/HardcodedLowLevelSatoriAPI.h')
@:native('::Satori::SExperimentList')
extern class SExperimentList {
    var experiments: RawPointer<Dynamic>;
    
    function size(): cpp.SizeT;
    function get(index: cpp.SizeT): RawPointer<SExperiment>;
}

/**
 * Satori flag.
 */
@:unreflective
@:include('nakama-cpp/satori/HardcodedLowLevelSatoriAPI.h')
@:native('::Satori::SFlag')
extern class SFlag {
    var name: ConstCharStar;
    var value: ConstCharStar;
    var condition_changed: Bool;
    var labels: RawPointer<Dynamic>;
}

/**
 * Satori flag list.
 */
@:unreflective
@:include('nakama-cpp/satori/HardcodedLowLevelSatoriAPI.h')
@:native('::Satori::SFlagList')
extern class SFlagList {
    var flags: RawPointer<Dynamic>;
    
    function size(): cpp.SizeT;
    function get(index: cpp.SizeT): RawPointer<SFlag>;
}

/**
 * Satori live event.
 */
@:unreflective
@:include('nakama-cpp/satori/HardcodedLowLevelSatoriAPI.h')
@:native('::Satori::SLiveEvent')
extern class SLiveEvent {
    var name: ConstCharStar;
    var description: ConstCharStar;
    var value: ConstCharStar;
    var active_start_time_sec: Int64;
    var active_end_time_sec: Int64;
    var id: ConstCharStar;
    var start_time_sec: Int64;
    var end_time_sec: Int64;
    var duration_sec: Int64;
    var reset_cron: ConstCharStar;
    var status: Int32;
    var labels: RawPointer<Dynamic>;
}

/**
 * Satori live event list.
 */
@:unreflective
@:include('nakama-cpp/satori/HardcodedLowLevelSatoriAPI.h')
@:native('::Satori::SLiveEventList')
extern class SLiveEventList {
    var live_events: RawPointer<Dynamic>;
    var explicit_join_live_events: RawPointer<Dynamic>;
    
    function size(): cpp.SizeT;
    function get(index: cpp.SizeT): RawPointer<SLiveEvent>;
    function explicitJoinSize(): cpp.SizeT;
    function getExplicitJoin(index: cpp.SizeT): RawPointer<SLiveEvent>;
}

/**
 * Satori properties.
 */
@:unreflective
@:include('nakama-cpp/satori/HardcodedLowLevelSatoriAPI.h')
@:native('::Satori::SProperties')
extern class SProperties {
    var default_properties: NStringMap;
    var computed_properties: NStringMap;
    var custom_properties: NStringMap;
}

/**
 * Satori session.
 */
@:unreflective
@:include('nakama-cpp/satori/HardcodedLowLevelSatoriAPI.h')
@:native('::Satori::SSession')
extern class SSession {
    var token: ConstCharStar;
    var refresh_token: ConstCharStar;
    var properties: RawPointer<SProperties>;
}

typedef SSessionPtr = RawPointer<SSession>;

/**
 * Satori message.
 */
@:unreflective
@:include('nakama-cpp/satori/HardcodedLowLevelSatoriAPI.h')
@:native('::Satori::SMessage')
extern class SMessage {
    var schedule_id: ConstCharStar;
    var send_time: NTimestamp;
    var metadata: NStringMap;
    var create_time: NTimestamp;
    var update_time: NTimestamp;
    var read_time: NTimestamp;
    var consume_time: NTimestamp;
    var text: ConstCharStar;
    var id: ConstCharStar;
    var title: ConstCharStar;
    var image_url: ConstCharStar;
}

/**
 * Satori message list response.
 */
@:unreflective
@:include('nakama-cpp/satori/HardcodedLowLevelSatoriAPI.h')
@:native('::Satori::SGetMessageListResponse')
extern class SGetMessageListResponse {
    var messages: RawPointer<Dynamic>;
    var next_cursor: ConstCharStar;
    var prev_cursor: ConstCharStar;
    var cacheable_cursor: ConstCharStar;
    
    function size(): cpp.SizeT;
    function get(index: cpp.SizeT): RawPointer<SMessage>;
}