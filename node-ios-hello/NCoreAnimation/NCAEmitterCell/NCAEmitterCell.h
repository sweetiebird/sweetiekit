//
//  NCAEmitterCell.h
//  node-ios-hello
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
  JS_METHOD(emitterCell);
  JS_PROP(contents);
  JS_PROP(birthrate);
  JS_PROP(lifetime);
  JS_PROP(velocity);
  JS_PROP(scale);
  JS_PROP(emissionRange);
JS_WRAP_CLASS_END(CAEmitterCell);

#endif /* NCAEmitterCell_h */
