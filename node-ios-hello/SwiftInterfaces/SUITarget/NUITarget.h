//
//  NUITarget.h
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITarget_h
#define NUITarget_h

#include "NNSObject.h"

#define js_value_UITarget(x) js_value_wrapper(x, UITarget)
#define to_value_UITarget(x) to_value_wrapper(x, UITarget)
#define is_value_UITarget(x) is_value_wrapper(x, UITarget)

JS_WRAP_CLASS(UITarget, NSObject);
  sweetiekit::JSFunction _callback;
JS_WRAP_CLASS_END(UITarget);

#if __OBJC__
typedef SUITarget UITarget;
#endif

#endif /* NUITarget_h */
