package nakama;

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
}

class NakamaVersion {

    /**
     * 获取本地namaka-cpp SDK版本号
     * Get the local namaka-cpp SDK version number
     * 
     * @return SDK version / SDK 版本号  --eg: '2.8.5 git:27322aa'
     */
    public static function getVersion():String {
        return cast NativeNakama.getSdkVersion();
    }
}