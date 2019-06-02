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

JS_WRAP_CLASS(UIEvent, NSObject);
  JS_PROP(type);
  JS_PROP(subtype);
  JS_PROP(timestamp);
  JS_PROP(allTouches);
JS_WRAP_CLASS_END(UIEvent);

#endif /* NUIEvent_h */
