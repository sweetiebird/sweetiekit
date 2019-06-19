//
//  NNSUUID.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSUUID_h
#define NNSUUID_h    

#include "NNSObject.h"

#define js_value_NSUUID(x) js_value_wrapper(x, NSUUID)
#define to_value_NSUUID(x) to_value_wrapper(x, NSUUID)
#define is_value_NSUUID(x) is_value_wrapper(x, NSUUID)

JS_WRAP_CLASS(NSUUID, NSObject);
  JS_STATIC_METHOD(UUID);
  JS_STATIC_METHOD(init);
  JS_METHOD(initWithUUIDString);
  JS_METHOD(initWithUUIDBytes);
  JS_METHOD(getUUIDBytes);
  JS_PROP_READONLY(UUIDString);
JS_WRAP_CLASS_END(NSUUID);

#endif /* NNSUUID_h */
