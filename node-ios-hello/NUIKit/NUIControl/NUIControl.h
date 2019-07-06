//
//  NUIControl.h
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIControl_h
#define NUIControl_h

#include "NUIView.h"

#define js_value_UIControl(x) js_value_wrapper(x, UIControl)
#define to_value_UIControl(x) to_value_wrapper(x, UIControl)
#define is_value_UIControl(x) is_value_wrapper(x, UIControl)

#define js_value_UIControlEvents(x) JS_OPTS(UIControlEvents, NSUInteger, x)
#define to_value_UIControlEvents(x) TO_OPTS(UIControlEvents, NSUInteger, x)
#define is_value_UIControlEvents(x) IS_OPTS(UIControlEvents, NSUInteger, x)

#define js_value_UIControlContentVerticalAlignment(x) JS_ENUM(UIControlContentVerticalAlignment, NSInteger, x)
#define to_value_UIControlContentVerticalAlignment(x) TO_ENUM(UIControlContentVerticalAlignment, NSInteger, x)
#define is_value_UIControlContentVerticalAlignment(x) IS_ENUM(UIControlContentVerticalAlignment, NSInteger, x)

#define js_value_UIControlContentHorizontalAlignment(x) JS_ENUM(UIControlContentHorizontalAlignment, NSInteger, x)
#define to_value_UIControlContentHorizontalAlignment(x) TO_ENUM(UIControlContentHorizontalAlignment, NSInteger, x)
#define is_value_UIControlContentHorizontalAlignment(x) IS_ENUM(UIControlContentHorizontalAlignment, NSInteger, x)

#define js_value_UIControlState(x) JS_OPTS(UIControlState, NSUInteger, x)
#define to_value_UIControlState(x) TO_OPTS(UIControlState, NSUInteger, x)
#define is_value_UIControlState(x) IS_OPTS(UIControlState, NSUInteger, x)

JS_WRAP_CLASS(UIControl, UIView);
  JS_METHOD(beginTrackingWithTouchWithEvent);
  JS_METHOD(continueTrackingWithTouchWithEvent);
  JS_METHOD(endTrackingWithTouchWithEvent);
  JS_METHOD(cancelTrackingWithEvent);
  JS_METHOD(addTargetActionForControlEvents);
  JS_METHOD(removeTargetActionForControlEvents);
  JS_METHOD(addTargetForControlEvents);
  JS_METHOD(removeTargetForControlEvents);
  JS_METHOD(allTargets);
  JS_METHOD(allControlEvents);
  JS_METHOD(actionsForTargetForControlEvent);
  JS_METHOD(sendActionToForEvent);
  JS_METHOD(sendActionsForControlEvents);
  JS_PROP(isEnabled);
  JS_PROP(isSelected);
  JS_PROP(isHighlighted);
  JS_PROP(contentVerticalAlignment);
  JS_PROP(contentHorizontalAlignment);
  JS_PROP_READONLY(effectiveContentHorizontalAlignment);
  JS_PROP_READONLY(state);
  JS_PROP_READONLY(isTracking);
  JS_PROP_READONLY(isTouchInside);
  JS_PROP_READONLY(allTargets);
  JS_PROP_READONLY(allControlEvents);

JS_WRAP_CLASS_END(UIControl);

#endif /* NUIControl_h */
