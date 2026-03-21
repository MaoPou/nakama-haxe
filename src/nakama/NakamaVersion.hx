package nakama;

import cpp.ConstCharStar;

@:unreflective
@:include('nakama-cpp/NakamaVersion.h')
@:native('::nakama::')
extern class NakamaVersion {
    @:native('getNakamaSdkVersion')
    static function getNakamaSdkVersion(): ConstCharStar;
}