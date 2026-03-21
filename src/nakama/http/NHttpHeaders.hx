package nakama.http;

import cpp.ConstCharStar;
import cpp.RawPointer;

/**
 * HTTP headers map (std::map<std::string, std::string>).
 */
@:unreflective
@:include('nakama-cpp/NHttpTransportInterface.h')
@:native('::std::map<::std::string, ::std::string>')
extern class NHttpHeaders {
    function size(): cpp.SizeT;
    function empty(): Bool;
    function clear(): Void;
    function insert(key: ConstCharStar, value: ConstCharStar): Void;
    function find(key: ConstCharStar): RawPointer<Dynamic>;
    @:arrayAccess function get(key: ConstCharStar): ConstCharStar;
    @:arrayAccess function set(key: ConstCharStar, value: ConstCharStar): Void;
}

/**
 * HTTP query arguments map (std::multimap<std::string, std::string>).
 */
@:unreflective
@:include('nakama-cpp/NHttpTransportInterface.h')
@:native('::std::multimap<::std::string, ::std::string>')
extern class NHttpQueryArgs {
    function size(): cpp.SizeT;
    function empty(): Bool;
    function clear(): Void;
    function insert(key: ConstCharStar, value: ConstCharStar): Void;
    function count(key: ConstCharStar): cpp.SizeT;
    function equalRange(key: ConstCharStar): RawPointer<Dynamic>;
}