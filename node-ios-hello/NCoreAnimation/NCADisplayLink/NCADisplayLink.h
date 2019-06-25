//
//  NCADisplayLink.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCADisplayLink_h
#define NCADisplayLink_h    

#include "NNSObject.h"

#define js_value_CADisplayLink(x) js_value_wrapper(x, CADisplayLink)
#define to_value_CADisplayLink(x) to_value_wrapper(x, CADisplayLink)
#define is_value_CADisplayLink(x) is_value_wrapper(x, CADisplayLink)

JS_WRAP_CLASS(CADisplayLink, NSObject);
  JS_STATIC_METHOD(displayLinkWithTargetSelector);
  JS_METHOD(addToRunLoopForMode);
  JS_METHOD(removeFromRunLoopForMode);
  JS_METHOD(invalidate);
  JS_PROP_READONLY(timestamp);
  JS_PROP_READONLY(duration);
  JS_PROP_READONLY(targetTimestamp);
  JS_PROP(isPaused);
  JS_PROP(frameInterval);
  JS_PROP(preferredFramesPerSecond);
JS_WRAP_CLASS_END(CADisplayLink);

#endif /* NCADisplayLink_h */
