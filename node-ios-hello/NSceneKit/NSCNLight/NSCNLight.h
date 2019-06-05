//
//  NSCNLight.h
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNLight_h
#define NSCNLight_h

#include "NNSObject.h"

#define js_value_SCNLight(x) js_value_wrapper(x, SCNLight)
#define to_value_SCNLight(x) to_value_wrapper(x, SCNLight)
#define is_value_SCNLight(x) is_value_wrapper(x, SCNLight)

JS_WRAP_CLASS(SCNLight, NSObject);
  JS_PROP(type);
  JS_PROP(color);
  JS_PROP(spotInnerAngle);
  JS_PROP(spotOuterAngle);
  JS_PROP(temperature);
  JS_PROP(intensity);
  JS_PROP(zNear);
  JS_PROP(zFar);
  JS_PROP(attenuationStartDistance);
  JS_PROP(attenuationEndDistance);
  JS_PROP(attenuationFalloffExponent);
JS_WRAP_CLASS_END(SCNLight);

#endif /* NSCNLight_h */
