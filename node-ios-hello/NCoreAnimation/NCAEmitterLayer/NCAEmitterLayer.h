//
//  NCAEmitterLayer.h
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCAEmitterLayer_h
#define NCAEmitterLayer_h    

#include "NCALayer.h"

#define js_value_CAEmitterLayer(x) js_value_wrapper(x, CAEmitterLayer)
#define to_value_CAEmitterLayer(x) to_value_wrapper(x, CAEmitterLayer)
#define is_value_CAEmitterLayer(x) is_value_wrapper(x, CAEmitterLayer)

JS_WRAP_CLASS(CAEmitterLayer, CALayer);
  JS_PROP(emitterCells);
  JS_PROP(emitterPosition);
JS_WRAP_CLASS_END(CAEmitterLayer);

#endif /* NCAEmitterLayer_h */
