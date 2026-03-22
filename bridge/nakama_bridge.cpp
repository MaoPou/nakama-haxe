#include "../include/nakama_bridge.h"
#include <nakama-cpp/ClientFactory.h>
#include <nakama-cpp/NClientInterface.h>
#include <nakama-cpp/NSessionInterface.h>
#include <memory>
#include <string>

using namespace Nakama;

// 客户端持有者
struct ClientHolder {
    NClientPtr client;
};

// 回调上下文
struct CallbackContext {
    SessionCallback onSuccess;
    ErrorCallback onError;
    void* userData;
};

// 辅助函数：将 C 字符串转为 std::string
static inline std::string to_string(const char* s) {
    return s ? s : "";
}

// 创建客户端
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
    } catch (const std::exception& e) {
        return nullptr;
    }
}

// 销毁客户端
extern "C" void nakama_client_destroy(NakamaClient client) {
    if (client) {
        delete static_cast<ClientHolder*>(client);
    }
}

// 驱动网络请求
extern "C" void nakama_client_tick(NakamaClient client) {
    ClientHolder* holder = static_cast<ClientHolder*>(client);
    if (holder && holder->client) {
        holder->client->tick();
    }
}

// 异步认证
extern "C" void nakama_authenticate_device(
    NakamaClient client,
    const char* deviceId,
    const char* username,
    int create,
    SessionCallback onSuccess,
    ErrorCallback onError,
    void* userData
) {
    ClientHolder* holder = static_cast<ClientHolder*>(client);
    if (!holder || !holder->client) return;

    // 创建回调上下文（使用 shared_ptr 保证生命周期）
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