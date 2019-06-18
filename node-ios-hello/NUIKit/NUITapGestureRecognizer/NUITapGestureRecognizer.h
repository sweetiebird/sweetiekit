//
//  NUITapGestureRecognizer.h
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITapGestureRecognizer_h
#define NUITapGestureRecognizer_h    

#include "NUIGestureRecognizer.h"

#define js_value_UITapGestureRecognizer(x) js_value_wrapper(x, UITapGestureRecognizer)
#define to_value_UITapGestureRecognizer(x) to_value_wrapper(x, UITapGestureRecognizer)
#define is_value_UITapGestureRecognizer(x) is_value_wrapper(x, UITapGestureRecognizer)

JS_WRAP_CLASS(UITapGestureRecognizer, UIGestureRecognizer);
  JS_PROP(numberOfTapsRequired);
  JS_PROP(numberOfTouchesRequired);
JS_WRAP_CLASS_END(UITapGestureRecognizer);

#define js_value_UIPinchGestureRecognizer(x) js_value_wrapper(x, UIPinchGestureRecognizer)
#define to_value_UIPinchGestureRecognizer(x) to_value_wrapper(x, UIPinchGestureRecognizer)
#define is_value_UIPinchGestureRecognizer(x) is_value_wrapper(x, UIPinchGestureRecognizer)

JS_WRAP_CLASS(UIPinchGestureRecognizer, UIGestureRecognizer);
  JS_PROP(scale);
  JS_PROP_READONLY(velocity);
JS_WRAP_CLASS_END(UIPinchGestureRecognizer);

#define js_value_UIRotationGestureRecognizer(x) js_value_wrapper(x, UIRotationGestureRecognizer)
#define to_value_UIRotationGestureRecognizer(x) to_value_wrapper(x, UIRotationGestureRecognizer)
#define is_value_UIRotationGestureRecognizer(x) is_value_wrapper(x, UIRotationGestureRecognizer)

JS_WRAP_CLASS(UIRotationGestureRecognizer, UIGestureRecognizer);
  JS_PROP(rotation);
  JS_PROP_READONLY(velocity);
JS_WRAP_CLASS_END(UIRotationGestureRecognizer);

#define js_value_UISwipeGestureRecognizer(x) js_value_wrapper(x, UISwipeGestureRecognizer)
#define to_value_UISwipeGestureRecognizer(x) to_value_wrapper(x, UISwipeGestureRecognizer)
#define is_value_UISwipeGestureRecognizer(x) is_value_wrapper(x, UISwipeGestureRecognizer)

#define js_value_UISwipeGestureRecognizerDirection(x) JS_OPTS(UISwipeGestureRecognizerDirection, NSUInteger, x)
#define to_value_UISwipeGestureRecognizerDirection(x) TO_OPTS(UISwipeGestureRecognizerDirection, NSUInteger, x)
#define is_value_UISwipeGestureRecognizerDirection(x) IS_OPTS(UISwipeGestureRecognizerDirection, NSUInteger, x)

JS_WRAP_CLASS(UISwipeGestureRecognizer, UIGestureRecognizer);
  JS_PROP(numberOfTouchesRequired);
  JS_PROP(direction);
JS_WRAP_CLASS_END(UISwipeGestureRecognizer);

#define js_value_UIPanGestureRecognizer(x) js_value_wrapper(x, UIPanGestureRecognizer)
#define to_value_UIPanGestureRecognizer(x) to_value_wrapper(x, UIPanGestureRecognizer)
#define is_value_UIPanGestureRecognizer(x) is_value_wrapper(x, UIPanGestureRecognizer)

JS_WRAP_CLASS(UIPanGestureRecognizer, UIGestureRecognizer);
  JS_METHOD(translationInView);
  JS_METHOD(setTranslationInView);
  JS_METHOD(velocityInView);
  JS_PROP(minimumNumberOfTouches);
  JS_PROP(maximumNumberOfTouches);
JS_WRAP_CLASS_END(UIPanGestureRecognizer);

#define js_value_UIScreenEdgePanGestureRecognizer(x) js_value_wrapper(x, UIScreenEdgePanGestureRecognizer)
#define to_value_UIScreenEdgePanGestureRecognizer(x) to_value_wrapper(x, UIScreenEdgePanGestureRecognizer)
#define is_value_UIScreenEdgePanGestureRecognizer(x) is_value_wrapper(x, UIScreenEdgePanGestureRecognizer)

JS_WRAP_CLASS(UIScreenEdgePanGestureRecognizer, UIPanGestureRecognizer);
  JS_PROP(edges);
JS_WRAP_CLASS_END(UIScreenEdgePanGestureRecognizer);

#define js_value_UILongPressGestureRecognizer(x) js_value_wrapper(x, UILongPressGestureRecognizer)
#define to_value_UILongPressGestureRecognizer(x) to_value_wrapper(x, UILongPressGestureRecognizer)
#define is_value_UILongPressGestureRecognizer(x) is_value_wrapper(x, UILongPressGestureRecognizer)

JS_WRAP_CLASS(UILongPressGestureRecognizer, UIGestureRecognizer);
  JS_PROP(numberOfTapsRequired);
  JS_PROP(numberOfTouchesRequired);
  JS_PROP(minimumPressDuration);
  JS_PROP(allowableMovement);
JS_WRAP_CLASS_END(UILongPressGestureRecognizer);

#endif /* NUITapGestureRecognizer_h */
