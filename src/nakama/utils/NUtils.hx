package nakama.utils;

import nakama.types.NTimestamp;

@:unreflective
@:include('nakama-cpp/NUtils.h')
@:native('::nakama::')
extern class NUtils {
    /**
     * Get current UNIX time in milliseconds.
     */
    @:native('getUnixTimestampMs')
    static function getUnixTimestampMs(): NTimestamp;
}