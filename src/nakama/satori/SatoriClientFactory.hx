package nakama.satori;

import cpp.RawPointer;
import nakama.client.NClientParameters;
import nakama.http.NHttpTransportInterface;
import nakama.satori.SClientInterface;

@:unreflective
@:include('nakama-cpp/satori/SatoriClientFactory.h')
@:native('::Satori::')
extern class SatoriClientFactory {
    @:native('createRestClient')
    static function createRestClient(
        parameters: RawPointer<NClientParameters>,
        httpTransport: RawPointer<NHttpTransportInterface>
    ): SClientPtr;
}