package nakama.session;

import cpp.ConstCharStar;
import cpp.RawPointer;
import nakama.types.NTimestamp;

@:unreflective
@:include('nakama-cpp/NSessionInterface.h')
@:native('::nakama::NSessionInterface')
extern class NSessionInterface_ {
    // 空声明
}

typedef NSessionPtr = RawPointer<NSessionInterface_>;

class NSession {
    var _ptr: NSessionPtr;
    
    public function new(ptr: NSessionPtr) {
        _ptr = ptr;
    }
    
    public function getAuthToken(): String {
        if (_ptr == null) return null;
        return untyped __cpp__('::String({0}->getAuthToken().c_str())', _ptr);
    }
    
    public function getRefreshToken(): String {
        if (_ptr == null) return null;
        return untyped __cpp__('::String({0}->getRefreshToken().c_str())', _ptr);
    }
    
    public function isCreated(): Bool {
        if (_ptr == null) return false;
        return untyped __cpp__('{0}->isCreated()', _ptr);
    }
    
    public function getUsername(): String {
        if (_ptr == null) return null;
        return untyped __cpp__('::String({0}->getUsername().c_str())', _ptr);
    }
    
    public function getUserId(): String {
        if (_ptr == null) return null;
        return untyped __cpp__('::String({0}->getUserId().c_str())', _ptr);
    }
    
    public function getCreateTime(): NTimestamp {
        if (_ptr == null) return 0;
        return untyped __cpp__('{0}->getCreateTime()', _ptr);
    }
    
    public function getExpireTime(): NTimestamp {
        if (_ptr == null) return 0;
        return untyped __cpp__('{0}->getExpireTime()', _ptr);
    }
    
    public function isExpired(): Bool {
        if (_ptr == null) return true;
        return untyped __cpp__('{0}->isExpired()', _ptr);
    }
    
    public function isExpiredAt(now: NTimestamp): Bool {
        if (_ptr == null) return true;
        return untyped __cpp__('{0}->isExpired({1})', _ptr, now);
    }
}