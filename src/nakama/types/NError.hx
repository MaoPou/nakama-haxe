package nakama.types;

import cpp.ConstCharStar;
import cpp.RawPointer;

/**
 * Error codes.
 */
@:unreflective
@:include('nakama-cpp/NError.h')
@:native('::nakama::ErrorCode')
extern enum ErrorCode {
    Unknown;
    NotFound;
    AlreadyExists;
    InvalidArgument;
    Unauthenticated;
    PermissionDenied;
    ConnectionError;
    InternalError;
    CancelledByUser;
}

/**
 * Error structure.
 */
@:unreflective
@:include('nakama-cpp/NError.h')
@:native('::nakama::NError')
extern class NError {
    var message: ConstCharStar;
    var code: ErrorCode;
    
    @:native('new nakama::NError')
    static function create(message: ConstCharStar, code: ErrorCode): RawPointer<NError>;
}

typedef NErrorPtr = RawPointer<NError>;