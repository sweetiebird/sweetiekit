//
//  hello-v8.hpp
//
//  Created by Emily Kolar on 4/9/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef hello_v8_hpp
#define hello_v8_hpp

#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

extern void hellov8(const char* program_name);
extern void hellov8async(const char* program_name);

#ifdef __cplusplus
}
#endif

#endif /* hello_v8_hpp */
