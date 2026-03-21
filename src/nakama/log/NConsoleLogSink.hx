package nakama.log;

import cpp.ConstCharStar;
import cpp.RawPointer;
import nakama.log.NLogSinkInterface;
import nakama.log.NLogLevel;

/**
 * Console log sink.
 */
@:unreflective
@:include('nakama-cpp/log/NConsoleLogSink.h')
@:native('::nakama::NConsoleLogSink')
extern class NConsoleLogSink extends NLogSinkInterface {
    @:native('new nakama::NConsoleLogSink')
    static function create(): RawPointer<NConsoleLogSink>;
    
    override function log(level: NLogLevel, message: ConstCharStar, func: ConstCharStar): Void;
    override function flush(): Void;
}