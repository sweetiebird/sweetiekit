//
//  NUIStoryboardUnwindSegueSource.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIStoryboardUnwindSegueSource_h
#define NUIStoryboardUnwindSegueSource_h    

#include "NNSObject.h"

#define js_value_UIStoryboardUnwindSegueSource(x) js_value_wrapper(x, UIStoryboardUnwindSegueSource)
#define to_value_UIStoryboardUnwindSegueSource(x) to_value_wrapper(x, UIStoryboardUnwindSegueSource)
#define is_value_UIStoryboardUnwindSegueSource(x) is_value_wrapper(x, UIStoryboardUnwindSegueSource)

JS_WRAP_CLASS(UIStoryboardUnwindSegueSource, NSObject);
  JS_PROP_READONLY(sourceViewController);
  JS_PROP_READONLY(unwindAction);
  JS_PROP_READONLY(sender);
JS_WRAP_CLASS_END(UIStoryboardUnwindSegueSource);

#endif /* NUIStoryboardUnwindSegueSource_h */
