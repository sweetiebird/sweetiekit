//
//  NUIStoryboardSegue.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIStoryboardSegue_h
#define NUIStoryboardSegue_h    

#include "NNSObject.h"

#define js_value_UIStoryboardSegue(x) js_value_wrapper(x, UIStoryboardSegue)
#define to_value_UIStoryboardSegue(x) to_value_wrapper(x, UIStoryboardSegue)
#define is_value_UIStoryboardSegue(x) is_value_wrapper(x, UIStoryboardSegue)

JS_WRAP_CLASS(UIStoryboardSegue, NSObject);
  JS_STATIC_METHOD(segueWithIdentifierSourceDestinationPerformHandler);
  JS_STATIC_METHOD(initWithIdentifierSourceDestination);
  JS_METHOD(perform);
  JS_PROP_READONLY(identifier);
  JS_PROP_READONLY(sourceViewController);
  JS_PROP_READONLY(destinationViewController);
JS_WRAP_CLASS_END(UIStoryboardSegue);

#endif /* NUIStoryboardSegue_h */
