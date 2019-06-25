//
//  NCAMetalDrawable.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCAMetalDrawable_h
#define NCAMetalDrawable_h 

#if !TARGET_OS_SIMULATOR   

#include "NMTLDrawable.h"

#define js_value_CAMetalDrawable(x) js_protocol_wrapper(x, CAMetalDrawable)
#define to_value_CAMetalDrawable(x) to_protocol_wrapper(x, CAMetalDrawable)
#define is_value_CAMetalDrawable(x) is_protocol_wrapper(x, CAMetalDrawable)

JS_WRAP_PROTOCOL(CAMetalDrawable, NSObject);
  JS_PROP_READONLY(texture);
  JS_PROP_READONLY(layer);
JS_WRAP_PROTOCOL_END(CAMetalDrawable, NSObject);

#endif

#endif /* NCAMetalDrawable_h */
