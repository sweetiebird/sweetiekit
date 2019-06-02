//
//  NCAShapeLayer.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-25.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCAShapeLayer_h
#define NCAShapeLayer_h    

#include "NCALayer.h"

#define js_value_CAShapeLayer(x) js_value_wrapper(x, CAShapeLayer)
#define to_value_CAShapeLayer(x) to_value_wrapper(x, CAShapeLayer)
#define is_value_CAShapeLayer(x) is_value_wrapper(x, CAShapeLayer)

JS_WRAP_CLASS(CAShapeLayer, CALayer);
  JS_PROP(lineWidth);
  JS_PROP(fillColor);
  JS_PROP(strokeColor);
  JS_PROP(path);
JS_WRAP_CLASS_END(CAShapeLayer);

#endif /* NCAShapeLayer_h */
