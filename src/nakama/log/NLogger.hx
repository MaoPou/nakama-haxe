package nakama.log;

import cpp.ConstCharStar;
import cpp.RawPointer;
import nakama.log.NLogLevel;
import nakama.log.NLogSinkInterface;
import nakama.types.NError;
import nakama.rt.NRtError;

/**
 * Logger static class.
 */
@:unreflective
@:include('nakama-cpp/log/NLogger.h')
@:native('::nakama::NLogger')
extern class NLogger {
    @:native('initWithConsoleSink')
    static function initWithConsoleSink(level: NLogLevel): Void;
    
    @:native('init')
    static function init(sink: NLogSinkPtr, level: NLogLevel): Void;
    
    @:native('getSink')
    static function getSink(): NLogSinkPtr;
    
    @:native('setSink')
    static function setSink(sink: NLogSinkPtr): Void;
    
    @:native('setLevel')
    static function setLevel(level: NLogLevel): Void;
    
    @:native('Debug')
    static function debug(message: ConstCharStar, moduleName: ConstCharStar, func: ConstCharStar): Void;
    
    @:native('Info')
    static function info(message: ConstCharStar, moduleName: ConstCharStar, func: ConstCharStar): Void;
    
    @:native('Warn')
    static function warn(message: ConstCharStar, moduleName: ConstCharStar, func: ConstCharStar): Void;
    
    @:native('Error')
    static function error(message: ConstCharStar, moduleName: ConstCharStar, func: ConstCharStar): Void;
    
    @:native('Fatal')
    static function fatal(message: ConstCharStar, moduleName: ConstCharStar, func: ConstCharStar): Void;
    
    @:native('Error')
    static function errorFromNError(error: RawPointer<NError>, moduleName: ConstCharStar, func: ConstCharStar): Void;
    
    @:native('Error')
    static function errorFromRtError(error: RawPointer<NRtError>, moduleName: ConstCharStar, func: ConstCharStar): Void;
}