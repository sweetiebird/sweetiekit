//
//  NEAGLSharegroup.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NEAGLSharegroup_h
#define NEAGLSharegroup_h    

#include "NNSObject.h"

#if TARGET_OS_IPHONE

#define js_value_EAGLSharegroup(x) js_value_wrapper(x, EAGLSharegroup)
#define to_value_EAGLSharegroup(x) to_value_wrapper(x, EAGLSharegroup)
#define is_value_EAGLSharegroup(x) is_value_wrapper(x, EAGLSharegroup)

JS_WRAP_CLASS(EAGLSharegroup, NSObject);
  JS_PROP(debugLabel);
JS_WRAP_CLASS_END(EAGLSharegroup);

#endif

#endif /* NEAGLSharegroup_h */
