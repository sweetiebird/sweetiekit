//
//  NUISpringTimingParameters.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUISpringTimingParameters_h
#define NUISpringTimingParameters_h    

#include "NUITimingCurveProvider.h"

#define js_value_UISpringTimingParameters(x) js_value_wrapper(x, UISpringTimingParameters)
#define to_value_UISpringTimingParameters(x) to_value_wrapper(x, UISpringTimingParameters)
#define is_value_UISpringTimingParameters(x) is_value_wrapper(x, UISpringTimingParameters)

JS_WRAP_CLASS(UISpringTimingParameters, UITimingCurveProvider);
  JS_METHOD(initWithCoder);
  JS_METHOD(initWithDampingRatioInitialVelocity);
  JS_METHOD(initWithMassStiffnessDampingInitialVelocity);
  JS_METHOD(initWithDampingRatio);
  JS_PROP_READONLY(initialVelocity);
JS_WRAP_CLASS_END(UISpringTimingParameters);

#endif /* NUISpringTimingParameters_h */
