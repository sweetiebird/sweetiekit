//
//  NCAGradientLayer.h
//
//  Created by Shawn Presser on 6/12/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCAGradientLayer_h
#define NCAGradientLayer_h    

#include "NCALayer.h"

#define js_value_CAGradientLayer(x) js_value_wrapper(x, CAGradientLayer)
#define to_value_CAGradientLayer(x) to_value_wrapper(x, CAGradientLayer)
#define is_value_CAGradientLayer(x) is_value_wrapper(x, CAGradientLayer)

#define js_value_CAGradientLayerType(x) JS_ENUM(CAGradientLayerType, NSString, x)
#define to_value_CAGradientLayerType(x) TO_ENUM(CAGradientLayerType, NSString, x)
#define is_value_CAGradientLayerType(x) IS_ENUM(CAGradientLayerType, NSString, x)

JS_WRAP_CLASS(CAGradientLayer, CALayer);
  JS_PROP(colors);
  JS_PROP(locations);
  JS_PROP(startPoint);
  JS_PROP(endPoint);
  JS_PROP(type);
JS_WRAP_CLASS_END(CAGradientLayer);

#endif /* NCAGradientLayer_h */
