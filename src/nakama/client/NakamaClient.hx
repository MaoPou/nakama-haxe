package nakama.client;

import cpp.RawPointer;
import nakama.client.NClientParameters;
import nakama.client.NClientInterface;
import nakama.client.ClientFactory;
import nakama.types.*;
import nakama.session.NSessionInterface;
import nakama.NakamaHelper;

class NakamaClient {
    var clientPtr: NClientPtr;
    var session: NSessionPtr;
    
    public function new(serverKey:String, host:String = "127.0.0.1", port:Int = 7350, ssl:Bool = false) {
        var params = NClientParameters.create();
        params.setServerKey(serverKey);
        params.setHost(host);
        params.setPort(port);
        params.setSSL(ssl);
        clientPtr = ClientFactory.createDefaultClient(cast params);
    }
    
    // 认证方法
    public function authenticateEmail(
        email:String, 
        password:String,
        onSuccess:NSessionPtr->Void,
        onError:NErrorPtr->Void
    ):Void {
        if (clientPtr == null) {
            trace("Client not initialized");
            return;
        }
        
        var successCallback = NakamaHelper.wrapCallback(onSuccess);
        var errorCallback = NakamaHelper.wrapErrorCallback(onError);
        
        clientPtr.authenticateEmail(
            email, password, null, true, null,
            cast successCallback, cast errorCallback
        );
    }
    
    public function authenticateDevice(
        deviceId:String,
        onSuccess:NSessionPtr->Void,
        onError:NErrorPtr->Void
    ):Void {
        if (clientPtr == null) return;
        
        var successCallback = NakamaHelper.wrapCallback(onSuccess);
        var errorCallback = NakamaHelper.wrapErrorCallback(onError);
        
        clientPtr.authenticateDevice(
            deviceId, null, true, null,
            cast successCallback, cast errorCallback
        );
    }
    
    public function getAccount(onSuccess:NAccountPtr->Void, onError:NErrorPtr->Void):Void {
        if (clientPtr == null || session == null) return;
        
        var successCallback = NakamaHelper.wrapCallback(onSuccess);
        var errorCallback = NakamaHelper.wrapErrorCallback(onError);
        
        clientPtr.getAccount(session, cast successCallback, cast errorCallback);
    }
    
    public function setSession(s:NSessionPtr):Void {
        session = s;
    }
    
    public function getSession():NSessionPtr {
        return session;
    }
    
    public function disconnect():Void {
        if (clientPtr != null) {
            clientPtr.disconnect();
        }
    }
    
    public function tick():Void {
        if (clientPtr != null) {
            clientPtr.tick();
        }
    }
}