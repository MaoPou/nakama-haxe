package nakama;

@:enum
abstract ErrorCode(Int) from Int to Int {
    var Unknown = 0;
    var NotFound = 1;
    var AlreadyExists = 2;
    var InvalidArgument = 3;
    var Unauthenticated = 4;
    var PermissionDenied = 5;
    var ConnectionError = -1;
    var InternalError = -2;
    var CancelledByUser = -3;
}

class NError {
    public var message:String;
    public var code:ErrorCode;
    
    public function new(message:String, code:ErrorCode = Unknown) {
        this.message = message;
        this.code = code;
    }
}