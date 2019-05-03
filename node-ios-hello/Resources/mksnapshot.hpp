//
//  mksnapshot.hpp
//  node-ios-hello
//
//  Created by Emily Kolar on 4/9/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef mksnapshot_hpp
#define mksnapshot_hpp

#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

extern void run_mksnapshot();
extern void run_mksnapshot_with_args(const char* args);
extern void gen_snapshot();

#ifdef __cplusplus
}
#endif

#endif /* mksnapshot_hpp */
