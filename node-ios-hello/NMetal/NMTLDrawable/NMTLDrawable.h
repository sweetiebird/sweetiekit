//
//  NMTLDrawable.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLDrawable_h
#define NMTLDrawable_h    

#include "NNSObject.h"

#define js_value_MTLDrawable(x) js_protocol_wrapper(x, MTLDrawable)
#define to_value_MTLDrawable(x) to_protocol_wrapper(x, MTLDrawable)
#define is_value_MTLDrawable(x) is_protocol_wrapper(x, MTLDrawable)

JS_WRAP_PROTOCOL(MTLDrawable, NSObject);
  JS_METHOD(present);
  JS_METHOD(presentAtTime);
  JS_METHOD(presentAfterMinimumDuration);
  JS_METHOD(addPresentedHandler);
  JS_PROP_READONLY(presentedTime);
  JS_PROP_READONLY(drawableID);
JS_WRAP_PROTOCOL_END(MTLDrawable, NSObject);

#endif /* NMTLDrawable_h */
