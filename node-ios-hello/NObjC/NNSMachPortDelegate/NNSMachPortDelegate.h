//
//  NNSMachPortDelegate.h
//
//  Created by Shawn Presser on 6/25/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSMachPortDelegate_h
#define NNSMachPortDelegate_h    

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

#include "NNSPortDelegate.h"

#define js_value_NSMachPortDelegate(x) js_protocol_wrapper(x, NSMachPortDelegate)
#define to_value_NSMachPortDelegate(x) to_protocol_wrapper(x, NSMachPortDelegate)
#define is_value_NSMachPortDelegate(x) is_protocol_wrapper(x, NSMachPortDelegate)

JS_WRAP_PROTOCOL(NSMachPortDelegate, NSPortDelegate);
  JS_METHOD(handleMachMessage);
JS_WRAP_PROTOCOL_END(NSMachPortDelegate, NSPortDelegate);

#endif

#endif /* NNSMachPortDelegate_h */
