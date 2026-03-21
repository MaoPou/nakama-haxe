package nakama.log;

import cpp.ConstCharStar;
import cpp.RawPointer;

/**
 * Log levels.
 */
@:unreflective
@:include('nakama-cpp/log/NLogSinkInterface.h')
@:native('::nakama::NLogLevel')
extern enum NLogLevel {
    Debug;
    Info;
    Warn;
    Error;
    Fatal;
}

/**
 * Log sink interface.
 */
@:unreflective
@:include('nakama-cpp/log/NLogSinkInterface.h')
@:native('::nakama::NLogSinkInterface')
extern class NLogSinkInterface {
    function log(level: NLogLevel, message: ConstCharStar, func: ConstCharStar): Void;
    function flush(): Void;
    function setLevel(level: NLogLevel): Void;
    function getLevel(): NLogLevel;
}

typedef NLogSinkPtr = RawPointer<NLogSinkInterface>;