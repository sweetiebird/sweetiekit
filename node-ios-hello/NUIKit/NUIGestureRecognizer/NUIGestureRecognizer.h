//
//  NUIGestureRecognizer.h
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIGestureRecognizer_h
#define NUIGestureRecognizer_h    

#include "NNSObject.h"

#define js_value_UIGestureRecognizer(x) js_value_wrapper(x, UIGestureRecognizer)
#define to_value_UIGestureRecognizer(x) to_value_wrapper(x, UIGestureRecognizer)
#define is_value_UIGestureRecognizer(x) is_value_wrapper(x, UIGestureRecognizer)

// UIKit constants
#define js_value_UIGestureRecognizerState(x) js_enum_wrapper(x, UIGestureRecognizerState)
#define to_value_UIGestureRecognizerState(x) to_enum_wrapper(x, UIGestureRecognizerState)
#define is_value_UIGestureRecognizerState(x) is_enum_wrapper(x, UIGestureRecognizerState)

JS_WRAP_CLASS(UIGestureRecognizer, NSObject);
  JS_METHOD(addTarget);
  JS_METHOD(initWithTargetAction);
  JS_METHOD(addTargetAction);
  JS_METHOD(removeTargetAction);
  JS_METHOD(requireGestureRecognizerToFail);
  JS_METHOD(locationInView);
  JS_METHOD(locationOfTouchInView);
//  // UIGestureRecognizerDelegate
//  JS_METHOD(gestureRecognizerShouldBegin);
//  JS_METHOD(gestureRecognizerShouldRecognizeSimultaneouslyWithGestureRecognizer);
//  JS_METHOD(gestureRecognizerShouldRequireFailureOfGestureRecognizer);
//  JS_METHOD(gestureRecognizerShouldBeRequiredToFailByGestureRecognizer);
//  JS_METHOD(gestureRecognizerShouldReceiveTouch);
//  JS_METHOD(gestureRecognizerShouldReceivePress);
  // UIGestureRecognizer
  JS_PROP_READONLY(state);
  JS_PROP(delegate);
  JS_PROP(enabled);
  JS_PROP_READONLY(view);
  JS_PROP(cancelsTouchesInView);
  JS_PROP(delaysTouchesBegan);
  JS_PROP(delaysTouchesEnded);
  JS_PROP(allowedTouchTypes);
  JS_PROP(allowedPressTypes);
  JS_PROP(requiresExclusiveTouchType);
  JS_PROP_READONLY(numberOfTouches);
  JS_PROP(name);

JS_WRAP_CLASS_END(UIGestureRecognizer);

#endif /* NUIGestureRecognizer_h */
