/*
 * Copyright 2019 The Nakama Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once

// ============================================================
// 平台检测和导出宏
// ============================================================

#if defined(_WIN32) || defined(__CYGWIN__)
    #ifdef NAKAMA_SHARED_LIBRARY_EXPORTS
        #define NAKAMA_API __declspec(dllexport)
    #else
        #define NAKAMA_API __declspec(dllimport)
    #endif
#elif __GNUC__ >= 4
    #ifdef NAKAMA_SHARED_LIBRARY_EXPORTS
        #define NAKAMA_API __attribute__((visibility("default")))
    #else
        #define NAKAMA_API
    #endif
#else
    #define NAKAMA_API
#endif

// ============================================================
// 命名空间宏
// ============================================================

#ifndef NAKAMA_NAMESPACE
    #define NAKAMA_NAMESPACE        Nakama
    #define NAKAMA_NAMESPACE_BEGIN  namespace NAKAMA_NAMESPACE {
    #define NAKAMA_NAMESPACE_END    }
#endif

// ============================================================
// 功能宏（根据实际支持的库设置）
// ============================================================

// 是否支持 gRPC 客户端
// #define WITH_GRPC_CLIENT

// 是否支持默认 HTTP 传输工厂
#define HAVE_DEFAULT_TRANSPORT_FACTORY

// 是否支持默认实时传输工厂
#define HAVE_DEFAULT_RT_TRANSPORT_FACTORY

// 强制 DLL 导入导出（在特定平台上可能需要）
// #define FORCE_DLL_IMPORT_EXPORT
// #define FORCE_DLL_VISIBILITY