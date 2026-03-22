#ifndef NAKAMA_BRIDGE_H
#define NAKAMA_BRIDGE_H

#ifdef __cplusplus
extern "C" {
#endif

// 不透明类型，代表 NClientInterface*
typedef void* NakamaClient;

// 回调类型
typedef void (*SessionCallback)(const char* token, const char* refresh_token, void* userData);
typedef void (*ErrorCallback)(const char* message, int code, void* userData);

// 客户端生命周期
NakamaClient nakama_client_create(const char* serverKey, const char* host, int port, int ssl);
void nakama_client_destroy(NakamaClient client);
void nakama_client_tick(NakamaClient client);

// 异步认证
void nakama_authenticate_device(
    NakamaClient client,
    const char* deviceId,
    const char* username,
    int create,
    SessionCallback onSuccess,
    ErrorCallback onError,
    void* userData
);

#ifdef __cplusplus
}
#endif

#endif