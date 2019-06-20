//
//  NUIEvent.h
//
//  Created by Emily Kolar on 2019-5-29.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIEvent_h
#define NUIEvent_h    

#include "NNSObject.h"

#define js_value_UIEvent(x) js_value_wrapper(x, UIEvent)
#define to_value_UIEvent(x) to_value_wrapper(x, UIEvent)
#define is_value_UIEvent(x) is_value_wrapper(x, UIEvent)

// UIKit enums
#define js_value_UIEventType(x) JS_ENUM(UIEventType, NSInteger, x)
#define to_value_UIEventType(x) TO_ENUM(UIEventType, NSInteger, x)
#define is_value_UIEventType(x) IS_ENUM(UIEventType, NSInteger, x)

#define js_value_UIEventSubtype(x) JS_ENUM(UIEventSubtype, NSInteger, x)
#define to_value_UIEventSubtype(x) TO_ENUM(UIEventSubtype, NSInteger, x)
#define is_value_UIEventSubtype(x) IS_ENUM(UIEventSubtype, NSInteger, x)

JS_WRAP_CLASS(UIEvent, NSObject);
#if UIKIT_DEFINE_AS_PROPERTIES
  JS_PROP_READONLY(allTouches);
#else
  JS_METHOD(allTouches);
#endif
  JS_METHOD(touchesForWindow);
  JS_METHOD(touchesForView);
  JS_METHOD(touchesForGestureRecognizer);
  JS_METHOD(coalescedTouchesForTouch);
  JS_METHOD(predictedTouchesForTouch);
  JS_PROP_READONLY(type);
  JS_PROP_READONLY(subtype);
  JS_PROP_READONLY(timestamp);
JS_WRAP_CLASS_END(UIEvent);

#endif /* NUIEvent_h */
