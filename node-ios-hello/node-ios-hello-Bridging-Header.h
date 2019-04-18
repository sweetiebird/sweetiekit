//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#include <stdarg.h>


extern void iOSLog0(const char* msg);
extern void iOSTrap();

#include "hello-v8.hpp"
#include "hello-node.hpp"
#include "mksnapshot.hpp"
