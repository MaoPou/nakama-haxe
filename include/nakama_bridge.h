#ifndef NAKAMA_BRIDGE_H
#define NAKAMA_BRIDGE_H

#ifdef __cplusplus
extern "C" {
#endif

typedef void* NakamaClient;

typedef void (*BridgeSessionCallback)(const char* token, const char* refresh_token, void* userData);
typedef void (*BridgeErrorCallback)(const char* message, int code, void* userData);

NakamaClient nakama_client_create(const char* serverKey, const char* host, int port, int ssl);
void nakama_client_destroy(NakamaClient client);
void nakama_client_tick(NakamaClient client);

void nakama_authenticate_device(
    NakamaClient client,
    const char* deviceId,
    const char* username,
    int create,
    BridgeSessionCallback onSuccess,
    BridgeErrorCallback onError,
    void* userData
);

#ifdef __cplusplus
}
#endif

#endif