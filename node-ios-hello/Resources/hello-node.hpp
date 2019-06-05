//
//  hello-node.hpp
//
//  Created by Emily Kolar on 4/9/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef hello_node_hpp
#define hello_node_hpp

#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif
    
extern void hello_node(const char* program_name);
extern void hello_node_async(const char* program_name);
    
#ifdef __cplusplus
}
#endif


#endif /* hello_node_hpp */
