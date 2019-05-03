//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#include <stdarg.h>
#import <UIKit/UIKit.h>

extern void iOSLog0(const char* msg);
extern void iOSTrap();
extern void registerNodeDLibs();

extern void embed_start();

#include "hello-v8.hpp"
#include "hello-node.hpp"
#include "mksnapshot.hpp"
#include "libs_main.hpp"
