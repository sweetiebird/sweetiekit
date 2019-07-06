//
//  NUICubicTimingParameters.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICubicTimingParameters_h
#define NUICubicTimingParameters_h    

#include "NUITimingCurveProvider.h"

#define js_value_UICubicTimingParameters(x) js_value_wrapper(x, UICubicTimingParameters)
#define to_value_UICubicTimingParameters(x) to_value_wrapper(x, UICubicTimingParameters)
#define is_value_UICubicTimingParameters(x) is_value_wrapper(x, UICubicTimingParameters)

JS_WRAP_CLASS(UICubicTimingParameters, UITimingCurveProvider);
  JS_METHOD(initWithCoder);
  JS_METHOD(initWithAnimationCurve);
  JS_METHOD(initWithControlPoint1ControlPoint2);
  JS_PROP_READONLY(animationCurve);
  JS_PROP_READONLY(controlPoint1);
  JS_PROP_READONLY(controlPoint2);
JS_WRAP_CLASS_END(UICubicTimingParameters);

#endif /* NUICubicTimingParameters_h */
