#pragma once

#ifdef _WIN32
    #define FORCE_DLL_IMPORT_EXPORT
#endif

#ifdef __linux__
    #define FORCE_DLL_VISIBILITY
#endif

#define HAVE_DEFAULT_TRANSPORT_FACTORY
#define HAVE_DEFAULT_RT_TRANSPORT_FACTORY
