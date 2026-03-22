package nakama.types;

import cpp.RawPointer;

@:unreflective
@:include('nakama-cpp/data/NUser.h')
@:native('::nakama::NUser')
extern class NUser_ {
    // 空声明
}

class NUser {
    var _ptr: RawPointer<NUser_>;
    
    public function new(ptr: RawPointer<NUser_>) {
        _ptr = ptr;
    }
    
    public function getId(): String {
        if (_ptr == null) return null;
        return untyped __cpp__('::String({0}->id.c_str())', _ptr);
    }
    
    public function getUsername(): String {
        if (_ptr == null) return null;
        return untyped __cpp__('::String({0}->username.c_str())', _ptr);
    }
    
    public function getDisplayName(): String {
        if (_ptr == null) return null;
        return untyped __cpp__('::String({0}->displayName.c_str())', _ptr);
    }
    
    public function getAvatarUrl(): String {
        if (_ptr == null) return null;
        return untyped __cpp__('::String({0}->avatarUrl.c_str())', _ptr);
    }
    
    public function getLanguage(): String {
        if (_ptr == null) return null;
        return untyped __cpp__('::String({0}->lang.c_str())', _ptr);
    }
}