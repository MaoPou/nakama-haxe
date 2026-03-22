#include "../include/nakama_bridge.h"
#include <nakama-cpp/ClientFactory.h>
#include <nakama-cpp/NClientInterface.h>
#include <nakama-cpp/NSessionInterface.h>
#include <memory>
#include <string>

using namespace Nakama;

struct ClientHolder {
    NClientPtr client;
};

struct CallbackContext {
    BridgeSessionCallback onSuccess;
    BridgeErrorCallback onError;
    void* userData;
};

static inline std::string to_string(const char* s) {
    return s ? s : "";
}

extern "C" NakamaClient nakama_client_create(const char* serverKey, const char* host, int port, int ssl) {
    try {
        NClientParameters params;
        params.serverKey = to_string(serverKey);
        params.host = to_string(host);
        params.port = (port <= 0) ? DEFAULT_PORT : port;
        params.ssl = (ssl != 0);
        
        NClientPtr client = createRestClient(params);
        if (!client) return nullptr;
        
        ClientHolder* holder = new ClientHolder{client};
        return holder;
    } catch (const std::exception&) {
        return nullptr;
    }
}

extern "C" void nakama_client_destroy(NakamaClient client) {
    if (client) delete static_cast<ClientHolder*>(client);
}

extern "C" void nakama_client_tick(NakamaClient client) {
    ClientHolder* holder = static_cast<ClientHolder*>(client);
    if (holder && holder->client) holder->client->tick();
}

extern "C" void nakama_authenticate_device(
    NakamaClient client,
    const char* deviceId,
    const char* username,
    int create,
    BridgeSessionCallback onSuccess,
    BridgeErrorCallback onError,
    void* userData
) {
    ClientHolder* holder = static_cast<ClientHolder*>(client);
    if (!holder || !holder->client) return;

    auto ctx = std::make_shared<CallbackContext>(CallbackContext{onSuccess, onError, userData});

    holder->client->authenticateDevice(
        to_string(deviceId),
        username ? std::optional<std::string>(username) : std::nullopt,
        create != 0,
        {},
        [ctx](NSessionPtr session) {
            if (ctx->onSuccess && session) {
                std::string token = session->getAuthToken();
                std::string refresh = session->getRefreshToken();
                ctx->onSuccess(token.c_str(), refresh.c_str(), ctx->userData);
            }
        },
        [ctx](const NError& error) {
            if (ctx->onError) {
                ctx->onError(error.message.c_str(), static_cast<int>(error.code), ctx->userData);
            }
        }
    );
}