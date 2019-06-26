//
//  NNSPortDelegate.h
//
//  Created by Shawn Presser on 6/25/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSPortDelegate_h
#define NNSPortDelegate_h    

#include "NNSObject.h"

#define js_value_NSPortDelegate(x) js_protocol_wrapper(x, NSPortDelegate)
#define to_value_NSPortDelegate(x) to_protocol_wrapper(x, NSPortDelegate)
#define is_value_NSPortDelegate(x) is_protocol_wrapper(x, NSPortDelegate)

JS_WRAP_PROTOCOL(NSPortDelegate, NSObject);
  JS_METHOD(handlePortMessage);

JS_WRAP_PROTOCOL_END(NSPortDelegate, NSObject);

#endif /* NNSPortDelegate_h */
