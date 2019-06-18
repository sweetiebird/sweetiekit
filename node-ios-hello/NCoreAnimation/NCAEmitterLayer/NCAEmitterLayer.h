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

#define js_value_CAEmitterLayerEmitterShape(x) JS_ENUM(CAEmitterLayerEmitterShape, NSString, x)
#define to_value_CAEmitterLayerEmitterShape(x) TO_ENUM(CAEmitterLayerEmitterShape, NSString, x)
#define is_value_CAEmitterLayerEmitterShape(x) IS_ENUM(CAEmitterLayerEmitterShape, NSString, x)

#define js_value_CAEmitterLayerEmitterMode(x) JS_ENUM(CAEmitterLayerEmitterMode, NSString, x)
#define to_value_CAEmitterLayerEmitterMode(x) TO_ENUM(CAEmitterLayerEmitterMode, NSString, x)
#define is_value_CAEmitterLayerEmitterMode(x) IS_ENUM(CAEmitterLayerEmitterMode, NSString, x)

#define js_value_CAEmitterLayerRenderMode(x) JS_ENUM(CAEmitterLayerRenderMode, NSString, x)
#define to_value_CAEmitterLayerRenderMode(x) TO_ENUM(CAEmitterLayerRenderMode, NSString, x)
#define is_value_CAEmitterLayerRenderMode(x) IS_ENUM(CAEmitterLayerRenderMode, NSString, x)

JS_WRAP_CLASS(CAEmitterLayer, CALayer);
  JS_PROP(emitterCells);
  JS_PROP(birthRate);
  JS_PROP(lifetime);
  JS_PROP(emitterPosition);
  JS_PROP(emitterZPosition);
  JS_PROP(emitterSize);
  JS_PROP(emitterDepth);
  JS_PROP(emitterShape);
  JS_PROP(emitterMode);
  JS_PROP(renderMode);
  JS_PROP(preservesDepth);
  JS_PROP(velocity);
  JS_PROP(scale);
  JS_PROP(spin);
  JS_PROP(seed);

JS_WRAP_CLASS_END(CAEmitterLayer);

#endif /* NCAEmitterLayer_h */
