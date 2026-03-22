package nakama.types;

import cpp.RawPointer;

@:unreflective
@:include('nakama-cpp/data/NAccountDevice.h')
@:native('::nakama::NAccountDevice')
extern class NAccountDevice_ {
    // 空声明
}

class NAccountDevice {
    var _ptr: RawPointer<NAccountDevice_>;
    
    public function new(ptr: RawPointer<NAccountDevice_>) {
        _ptr = ptr;
    }
    
    public function getId(): String {
        if (_ptr == null) return null;
        return untyped __cpp__('::String({0}->id.c_str())', _ptr);
    }
}