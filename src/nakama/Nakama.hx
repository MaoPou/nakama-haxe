// src/nakama/Nakama.hx
package nakama;

#if cpp
import cpp.ConstCharStar;

@:include('nakama-cpp/NakamaVersion.h')
@:include('nakama-cpp/NUtils.h')
@:buildXml("
    <include name='${haxelib:nakama-haxe}/Build.xml' />
")

@:keep
@:unreflective
extern class NativeNakama {
    @:native('::Nakama::getNakamaSdkVersion')
    static function getSdkVersion(): ConstCharStar;
    
    @:native('::Nakama::getUnixTimestampMs')
    static function getUnixTimestampMs(): cpp.UInt64;
}

class Nakama {
    public static function getVersion():String {
        try {
            var versionPtr = NativeNakama.getSdkVersion();
            if (versionPtr != null) {
                return cast versionPtr;
            }
            return "unknown";
        } catch (e:Dynamic) {
            return "error: " + e;
        }
    }
    
    public static function getUnixTimestamp():Int {
        return NativeNakama.getUnixTimestampMs();
    }
}
#else
class Nakama {
    public static function getVersion():String {
        return "Nakama SDK not available (non-CPP target)";
    }
    
    public static function getUnixTimestamp():Int {
        return 0;
    }
}
#end