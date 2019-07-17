//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#include <stdarg.h>
#ifdef __cplusplus
extern "C" {
#endif


extern void iOSLog0(const char* msg);
extern void iOSTrap();
extern void OnStartup();

extern void embed_start();

#ifdef __cplusplus
} // extern "C"
#endif

#include "hello-v8.hpp"
#include "hello-node.hpp"
#include "mksnapshot.hpp"
#include "libs_main.hpp"
#include "main.h"
#include <uv.h>
