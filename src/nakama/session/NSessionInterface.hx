package nakama.session;

import cpp.ConstCharStar;
import cpp.RawPointer;
import nakama.types.NStringMap;
import nakama.types.NTimestamp;

@:unreflective
@:include('nakama-cpp/NSessionInterface.h')
@:native('::nakama::NSessionInterface')
extern class NSessionInterface {
    /**
     * @return The authentication token used to construct this session.
     */
    function getAuthToken(): ConstCharStar;
    
    /**
     * @return The refresh token used to construct this session.
     */
    function getRefreshToken(): ConstCharStar;
    
    /**
     * @return True if the user account for this session was just created.
     */
    function isCreated(): Bool;
    
    /**
     * @return The username of the user who owns this session.
     */
    function getUsername(): ConstCharStar;
    
    /**
     * @return The ID of the user who owns this session.
     */
    function getUserId(): ConstCharStar;
    
    /**
     * @return The timestamp in milliseconds when this session object was created.
     */
    function getCreateTime(): NTimestamp;
    
    /**
     * @return The timestamp in milliseconds when this session will expire.
     */
    function getExpireTime(): NTimestamp;
    
    /**
     * @return True if the session has expired against the current time.
     */
    function isExpired(): Bool;
    
    /**
     * Check if the session's token has expired against the input time.
     * @param now The time to compare against the session.
     */
    function isExpiredAt(now: NTimestamp): Bool;
    
    /**
     * @return True if the refresh token has expired against the current time.
     */
    function isRefreshExpired(): Bool;
    
    /**
     * Check if the session's refresh token has expired against the input time.
     * @param now The time to compare against the session.
     */
    function isRefreshExpiredAt(now: NTimestamp): Bool;
    
    /**
     * Get session variables.
     */
    function getVariables(): NStringMap;
    
    /**
     * Get session variable value by name.
     */
    function getVariable(name: ConstCharStar): ConstCharStar;
}

typedef NSessionPtr = RawPointer<NSessionInterface>;

@:unreflective
@:include('nakama-cpp/NSessionInterface.h')
@:native('::nakama::')
extern class SessionHelper {
    /**
     * Restore a session from an authentication token.
     */
    @:native('restoreSession')
    static function restoreSession(token: ConstCharStar, refreshToken: ConstCharStar): NSessionPtr;
}