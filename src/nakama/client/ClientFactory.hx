package nakama.client;

import cpp.RawPointer;
import nakama.client.NClientParameters;
import nakama.client.NClientInterface;

@:unreflective
@:include('nakama-cpp/ClientFactory.h')
@:native('::nakama::')
extern class ClientFactory {
    /**
     * Creates a default client to interact with Nakama server.
     */
    @:native('createDefaultClient')
    static function createDefaultClient(params: RawPointer<NClientParameters>): NClientPtr;
    
    /**
     * Creates the REST client (HTTP/1.1) to interact with Nakama server.
     */
    @:native('createRestClient')
    static function createRestClient(
        params: RawPointer<NClientParameters>,
        httpTransport: RawPointer<Dynamic>
    ): NClientPtr;
    
    /**
     * Creates default HTTP transport using C++ REST SDK.
     */
    #if NAKAMA_HAVE_DEFAULT_TRANSPORT
    @:native('createDefaultHttpTransport')
    static function createDefaultHttpTransport(platformParams: RawPointer<Dynamic>): RawPointer<Dynamic>;
    #end
    
    #if NAKAMA_WITH_GRPC
    /**
     * Creates the gRPC client to interact with Nakama server.
     */
    @:native('createGrpcClient')
    static function createGrpcClient(params: RawPointer<NClientParameters>): NClientPtr;
    #end
}