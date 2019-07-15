//
//  NEAGLContext.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NEAGLContext_h
#define NEAGLContext_h    

#include "NNSObject.h"

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

#define js_value_EAGLContext(x) js_value_wrapper(x, EAGLContext)
#define to_value_EAGLContext(x) to_value_wrapper(x, EAGLContext)
#define is_value_EAGLContext(x) is_value_wrapper(x, EAGLContext)

#define js_value_EAGLRenderingAPI(x) JS_ENUM(EAGLRenderingAPI, NSUInteger, x)
#define to_value_EAGLRenderingAPI(x) TO_ENUM(EAGLRenderingAPI, NSUInteger, x)
#define is_value_EAGLRenderingAPI(x) IS_ENUM(EAGLRenderingAPI, NSUInteger, x)

JS_WRAP_CLASS(EAGLContext, NSObject);
  JS_STATIC_METHOD(setCurrentContext);
  JS_STATIC_METHOD(currentContext);
  JS_METHOD(init);
  JS_METHOD(initWithAPI);
  JS_METHOD(initWithAPISharegroup);
  JS_PROP_READONLY(API);
  JS_PROP_READONLY(sharegroup);
  JS_PROP(debugLabel);
  JS_PROP(isMultiThreaded);

JS_WRAP_CLASS_END(EAGLContext);

#endif

#endif /* NEAGLContext_h */
