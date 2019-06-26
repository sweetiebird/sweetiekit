//
//  NNSMachPort.h
//
//  Created by Shawn Presser on 6/25/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSMachPort_h
#define NNSMachPort_h    

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

#include "NNSPort.h"

#define js_value_NSMachPort(x) js_value_wrapper(x, NSMachPort)
#define to_value_NSMachPort(x) to_value_wrapper(x, NSMachPort)
#define is_value_NSMachPort(x) is_value_wrapper(x, NSMachPort)

#define js_value_NSMachPortOptions(x) JS_ENUM(NSMachPortOptions, NSUInteger, x)
#define to_value_NSMachPortOptions(x) TO_ENUM(NSMachPortOptions, NSUInteger, x)
#define is_value_NSMachPortOptions(x) IS_ENUM(NSMachPortOptions, NSUInteger, x)

JS_WRAP_CLASS(NSMachPort, NSPort);
  JS_STATIC_METHOD(portWithMachPort);
  JS_STATIC_METHOD(portWithMachPortOptions);
  JS_METHOD(initWithMachPort);
  JS_METHOD(setDelegate);
  JS_METHOD(delegate);
  JS_METHOD(initWithMachPortOptions);
  JS_METHOD(scheduleInRunLoopForMode);
  JS_METHOD(removeFromRunLoopForMode);
  JS_PROP_READONLY(machPort);
JS_WRAP_CLASS_END(NSMachPort);

#endif

#endif /* NNSMachPort_h */
