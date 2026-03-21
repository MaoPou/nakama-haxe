package nakama.types;

import cpp.RawPointer;
import cpp.ConstCharStar;
import cpp.Int32;
import cpp.UInt64;
import cpp.Int64;

/**
 * UNIX time in milliseconds.
 */
typedef NTimestamp = UInt64;

/**
 * Array of bytes (std::string in C++).
 */
typedef NBytes = String;

/**
 * String to string map.
 */
@:unreflective
@:include('nakama-cpp/NTypes.h')
@:native('::std::map<::std::string, ::std::string>')
extern class NStringMap {
    function size(): cpp.SizeT;
    function empty(): Bool;
    function clear(): Void;
    function insert(key: ConstCharStar, value: ConstCharStar): Void;
    function find(key: ConstCharStar): RawPointer<Dynamic>;
    @:arrayAccess function get(key: ConstCharStar): ConstCharStar;
    @:arrayAccess function set(key: ConstCharStar, value: ConstCharStar): Void;
}

/**
 * String to double map.
 */
@:unreflective
@:include('nakama-cpp/NTypes.h')
@:native('::std::map<::std::string, double>')
extern class NStringDoubleMap {
    function size(): cpp.SizeT;
    function empty(): Bool;
    function clear(): Void;
    function insert(key: ConstCharStar, value: Float): Void;
    function find(key: ConstCharStar): RawPointer<Dynamic>;
    @:arrayAccess function get(key: ConstCharStar): Float;
    @:arrayAccess function set(key: ConstCharStar, value: Float): Void;
}

/**
 * The group role status.
 */
@:unreflective
@:include('nakama-cpp/NTypes.h')
@:native('::nakama::NUserGroupState')
extern enum NUserGroupState {
    SUPERADMIN;
    ADMIN;
    MEMBER;
    JOIN_REQUEST;
}

/**
 * The available channel types on the server.
 */
@:unreflective
@:include('nakama-cpp/NTypes.h')
@:native('::nakama::NChannelType')
extern enum NChannelType {
    TYPE_UNSPECIFIED;
    ROOM;
    DIRECT_MESSAGE;
    GROUP;
}

/**
 * Constant for default port.
 */
@:unreflective
@:include('nakama-cpp/NTypes.h')
@:native('::nakama::DEFAULT_PORT')
extern var DEFAULT_PORT: Int32;