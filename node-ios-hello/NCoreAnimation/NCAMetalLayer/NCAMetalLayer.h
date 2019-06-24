//
//  NCAMetalLayer.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCAMetalLayer_h
#define NCAMetalLayer_h    

#include "NCALayer.h"

#define js_value_CAMetalLayer(x) js_value_wrapper(x, CAMetalLayer)
#define to_value_CAMetalLayer(x) to_value_wrapper(x, CAMetalLayer)
#define is_value_CAMetalLayer(x) is_value_wrapper(x, CAMetalLayer)

JS_WRAP_CLASS(CAMetalLayer, CALayer);
  JS_METHOD(nextDrawable);
  JS_PROP(device);
  JS_PROP(pixelFormat);
  JS_PROP(framebufferOnly);
  JS_PROP(drawableSize);
  JS_PROP(maximumDrawableCount);
  JS_PROP(presentsWithTransaction);
  JS_PROP(allowsNextDrawableTimeout);
JS_WRAP_CLASS_END(CAMetalLayer);

#define js_value_CAMetalDrawable(x) js_protocol_wrapper(x, CAMetalDrawable)
#define to_value_CAMetalDrawable(x) to_protocol_wrapper(x, CAMetalDrawable)
#define is_value_CAMetalDrawable(x) is_protocol_wrapper(x, CAMetalDrawable)

JS_WRAP_PROTOCOL(CAMetalDrawable, NSObject);
  JS_PROP_READONLY(texture);
  JS_PROP_READONLY(layer);
JS_WRAP_PROTOCOL_END(CAMetalDrawable, NSObject);

#endif /* NCAMetalLayer_h */
