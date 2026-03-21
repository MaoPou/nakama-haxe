package nakama.url;

import cpp.ConstCharStar;

/**
 * URL parts structure.
 */
@:unreflective
@:include('nakama-cpp/URLParts.h')
@:native('::nakama::URLParts')
extern class URLParts {
    var scheme: ConstCharStar;
    var host: ConstCharStar;
    var port: Int32; // std::optional<uint16_t> - 0 means not set
    var pathAndArgs: ConstCharStar;
    var url: ConstCharStar;
}