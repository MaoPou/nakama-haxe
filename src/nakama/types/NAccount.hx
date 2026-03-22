package nakama.types;

import cpp.RawPointer;
import nakama.types.NUser;
import nakama.types.NAccountDevice;

@:unreflective
@:include('nakama-cpp/data/NAccount.h')
@:native('::nakama::NAccount')
extern class NAccount_ {
    // 空声明
}

class NAccount {
    var _ptr: RawPointer<NAccount_>;
    
    public function new(ptr: RawPointer<NAccount_>) {
        _ptr = ptr;
    }
    
    public function getUser(): NUser {
        if (_ptr == null) return null;
        var userPtr = untyped __cpp__('&{0}->user', _ptr);
        return new NUser(cast userPtr);
    }
    
    public function getUserId(): String {
        if (_ptr == null) return null;
        return untyped __cpp__('::String({0}->user.id.c_str())', _ptr);
    }
    
    public function getUsername(): String {
        if (_ptr == null) return null;
        return untyped __cpp__('::String({0}->user.username.c_str())', _ptr);
    }
    
    public function getWallet(): String {
        if (_ptr == null) return null;
        return untyped __cpp__('::String({0}->wallet.c_str())', _ptr);
    }
    
    public function getEmail(): String {
        if (_ptr == null) return null;
        return untyped __cpp__('::String({0}->email.c_str())', _ptr);
    }
    
    public function getCustomId(): String {
        if (_ptr == null) return null;
        return untyped __cpp__('::String({0}->customId.c_str())', _ptr);
    }
    
    public function getVerifyTime(): NTimestamp {
        if (_ptr == null) return 0;
        return untyped __cpp__('{0}->verifyTime', _ptr);
    }
    
    public function getDisableTime(): NTimestamp {
        if (_ptr == null) return 0;
        return untyped __cpp__('{0}->disableTime', _ptr);
    }
}