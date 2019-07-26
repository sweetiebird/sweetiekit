//
//  NUITouch.h
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITouch_h
#define NUITouch_h    

#include "NNSObject.h"

#define js_value_UITouch(x) js_value_wrapper(x, UITouch)
#define to_value_UITouch(x) to_value_wrapper(x, UITouch)
#define is_value_UITouch(x) is_value_wrapper(x, UITouch)

#define js_value_UITouchPhase(x) JS_ENUM(UITouchPhase, NSInteger, x)
#define to_value_UITouchPhase(x) TO_ENUM(UITouchPhase, NSInteger, x)
#define is_value_UITouchPhase(x) IS_ENUM(UITouchPhase, NSInteger, x)

#define js_value_UIForceTouchCapability(x) JS_ENUM(UIForceTouchCapability, NSInteger, x)
#define to_value_UIForceTouchCapability(x) TO_ENUM(UIForceTouchCapability, NSInteger, x)
#define is_value_UIForceTouchCapability(x) IS_ENUM(UIForceTouchCapability, NSInteger, x)

#define js_value_UITouchType(x) JS_ENUM(UITouchType, NSInteger, x)
#define to_value_UITouchType(x) TO_ENUM(UITouchType, NSInteger, x)
#define is_value_UITouchType(x) IS_ENUM(UITouchType, NSInteger, x)

#define js_value_UITouchProperties(x) JS_OPTS(UITouchProperties, NSInteger, x)
#define to_value_UITouchProperties(x) TO_OPTS(UITouchProperties, NSInteger, x)
#define is_value_UITouchProperties(x) IS_OPTS(UITouchProperties, NSInteger, x)

JS_WRAP_CLASS(UITouch, NSObject);
  JS_METHOD(locationInView);
  JS_METHOD(previousLocationInView);
  JS_METHOD(preciseLocationInView);
  JS_METHOD(precisePreviousLocationInView);
  JS_METHOD(azimuthAngleInView);
  JS_METHOD(azimuthUnitVectorInView);
  JS_PROP_READONLY(timestamp);
  JS_PROP_READONLY(phase);
  JS_PROP_READONLY(tapCount);
  JS_PROP_READONLY(type);
  JS_PROP_READONLY(majorRadius);
  JS_PROP_READONLY(majorRadiusTolerance);
  JS_PROP_READONLY(window);
  JS_PROP_READONLY(view);
  JS_PROP_READONLY(gestureRecognizers);
  JS_PROP_READONLY(force);
  JS_PROP_READONLY(maximumPossibleForce);
  JS_PROP_READONLY(altitudeAngle);
  JS_PROP_READONLY(estimationUpdateIndex);
  JS_PROP_READONLY(estimatedProperties);
  JS_PROP_READONLY(estimatedPropertiesExpectingUpdates);
JS_WRAP_CLASS_END(UITouch);

#endif /* NUITouch_h */
