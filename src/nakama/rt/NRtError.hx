package nakama.rt;

import cpp.ConstCharStar;
import cpp.RawPointer;
import nakama.types.NStringMap;

/**
 * Real-time error codes.
 */
@:unreflective
@:include('nakama-cpp/realtime/rtdata/NRtError.h')
@:native('::nakama::RtErrorCode')
extern enum RtErrorCode {
    UNKNOWN;
    CONNECT_ERROR;
    TRANSPORT_ERROR;
    DISCONNECTED;
    RUNTIME_EXCEPTION;
    UNRECOGNIZED_PAYLOAD;
    MISSING_PAYLOAD;
    BAD_INPUT;
    MATCH_NOT_FOUND;
    MATCH_JOIN_REJECTED;
    RUNTIME_FUNCTION_NOT_FOUND;
    RUNTIME_FUNCTION_EXCEPTION;
}

/**
 * Real-time error structure.
 */
@:unreflective
@:include('nakama-cpp/realtime/rtdata/NRtError.h')
@:native('::nakama::NRtError')
extern class NRtError {
    var code: RtErrorCode;
    var message: ConstCharStar;
    var context: NStringMap;
}

typedef NRtErrorPtr = RawPointer<NRtError>;