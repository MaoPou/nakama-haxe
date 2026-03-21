package nakama.platform;

import cpp.RawPointer;

/**
 * Platform specific parameters.
 */
@:unreflective
@:include('nakama-cpp/NPlatformParams.h')
@:native('::nakama::NPlatformParameters')
extern class NPlatformParameters {
    @:native('new nakama::NPlatformParameters')
    static function create(): RawPointer<NPlatformParameters>;
}

typedef NPlatformParamsPtr = RawPointer<NPlatformParameters>;