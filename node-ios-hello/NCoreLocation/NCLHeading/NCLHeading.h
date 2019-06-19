//
//  NCLHeading.h
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLHeading_h
#define NCLHeading_h

#import "NNSObject.h"

#define js_value_CLHeading(x) js_value_wrapper(x, CLHeading)
#define to_value_CLHeading(x) to_value_wrapper(x, CLHeading)
#define is_value_CLHeading(x) is_value_wrapper(x, CLHeading)

#define js_value_CLHeadingComponentValue(x) js_value_double(x)
#define to_value_CLHeadingComponentValue(x) to_value_double(x)
#define is_value_CLHeadingComponentValue(x) is_value_double(x)

JS_WRAP_CLASS(CLHeading, NSObject);
  JS_PROP_READONLY(magneticHeading);
  JS_PROP_READONLY(trueHeading);
  JS_PROP_READONLY(headingAccuracy);
  JS_PROP_READONLY(x);
  JS_PROP_READONLY(y);
  JS_PROP_READONLY(z);
  JS_PROP_READONLY(timestamp);
JS_WRAP_CLASS_END(CLHeading);

#endif /* NCLHeading_h */
