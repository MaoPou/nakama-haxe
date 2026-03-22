package nakama.types;

import cpp.ConstCharStar;
import cpp.RawPointer;

// 时间戳类型
typedef NTimestamp = Int;

// 字符串映射（C++ 中是 std::unordered_map<std::string, std::string>）
@:unreflective
@:include('nakama-cpp/NTypes.h')
@:native('::nakama::NStringMap')
extern class NStringMap {

}

// 字符串映射辅助函数
class NStringMapHelper {
    public static inline function toHaxeMap(map: RawPointer<NStringMap>): Map<String, String> {
        var result = new Map<String, String>();
        if (map == null) return result;
        
        untyped __cpp__('
            for (const auto& kv : *{0}) {
                ::String key(kv.first.c_str());
                ::String value(kv.second.c_str());
                {1}->set(key, value);
            }
        ', map, result);
        
        return result;
    }
}