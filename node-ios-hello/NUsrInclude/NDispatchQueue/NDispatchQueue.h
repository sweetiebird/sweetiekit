//
//  NDispatchQueue.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NDispatchQueue_h
#define NDispatchQueue_h    

#include "NNSObject.h"

Local<Value> js_value_dispatch_queue_t(dispatch_queue_t value);
bool is_value_dispatch_queue_t(Local<Value> value);
dispatch_queue_t to_value_dispatch_queue_t(Local<Value> value, bool* failed = nullptr);

JS_WRAP_GLOBALS(DispatchQueue);
JS_WRAP_GLOBALS_END(DispatchQueue);

#endif /* NDispatchQueue_h */
