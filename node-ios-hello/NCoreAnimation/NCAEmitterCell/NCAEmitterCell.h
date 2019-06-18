//
//  NCAEmitterCell.h
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCAEmitterCell_h
#define NCAEmitterCell_h    

#include "NNSObject.h"

#define js_value_CAEmitterCell(x) js_value_wrapper(x, CAEmitterCell)
#define to_value_CAEmitterCell(x) to_value_wrapper(x, CAEmitterCell)
#define is_value_CAEmitterCell(x) is_value_wrapper(x, CAEmitterCell)

JS_WRAP_CLASS(CAEmitterCell, NSObject);
  JS_STATIC_METHOD(emitterCell);
  JS_STATIC_METHOD(defaultValueForKey);
  JS_METHOD(shouldArchiveValueForKey);
  JS_PROP(name);
  JS_PROP(isEnabled);
  JS_PROP(birthRate);
  JS_PROP(lifetime);
  JS_PROP(lifetimeRange);
  JS_PROP(emissionLatitude);
  JS_PROP(emissionLongitude);
  JS_PROP(emissionRange);
  JS_PROP(velocity);
  JS_PROP(velocityRange);
  JS_PROP(xAcceleration);
  JS_PROP(yAcceleration);
  JS_PROP(zAcceleration);
  JS_PROP(scale);
  JS_PROP(scaleRange);
  JS_PROP(scaleSpeed);
  JS_PROP(spin);
  JS_PROP(spinRange);
  JS_PROP(color);
  JS_PROP(redRange);
  JS_PROP(greenRange);
  JS_PROP(blueRange);
  JS_PROP(alphaRange);
  JS_PROP(redSpeed);
  JS_PROP(greenSpeed);
  JS_PROP(blueSpeed);
  JS_PROP(alphaSpeed);
  JS_PROP(contents);
  JS_PROP(contentsRect);
  JS_PROP(contentsScale);
  JS_PROP(minificationFilter);
  JS_PROP(magnificationFilter);
  JS_PROP(minificationFilterBias);
  JS_PROP(emitterCells);
  JS_PROP(style);
JS_WRAP_CLASS_END(CAEmitterCell);

#endif /* NCAEmitterCell_h */
