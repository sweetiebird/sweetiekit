//
//  NUIPressesEvent.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPressesEvent_h
#define NUIPressesEvent_h    

#include "NUIEvent.h"

#define js_value_UIPressesEvent(x) js_value_wrapper(x, UIPressesEvent)
#define to_value_UIPressesEvent(x) to_value_wrapper(x, UIPressesEvent)
#define is_value_UIPressesEvent(x) is_value_wrapper(x, UIPressesEvent)

JS_WRAP_CLASS(UIPressesEvent, UIEvent);
#if UIKIT_DEFINE_AS_PROPERTIES
  JS_PROP_READONLY(allPresses);
#else
  JS_METHOD(allPresses);
#endif
  JS_METHOD(pressesForGestureRecognizer);
JS_WRAP_CLASS_END(UIPressesEvent);

#endif /* NUIPressesEvent_h */
