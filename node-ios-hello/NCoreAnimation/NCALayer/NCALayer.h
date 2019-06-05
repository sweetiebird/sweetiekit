//
//  NCALayer.h
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCALayer_h
#define NCALayer_h

#include "NNSObject.h"

#define js_value_CALayer(x) js_value_wrapper(x, CALayer)
#define to_value_CALayer(x) to_value_wrapper(x, CALayer)
#define is_value_CALayer(x) is_value_wrapper(x, CALayer)

JS_WRAP_CLASS(CALayer, NSObject);
  JS_METHOD(AddAnimation);
  JS_METHOD(addSublayer);
  JS_METHOD(renderInContext);
  JS_PROP(CornerRadius);
  JS_PROP(BorderWidth);
  JS_PROP(BorderColor);
  JS_PROP(ShadowOffset);
  JS_PROP(ShadowColor);
  JS_PROP(ShadowRadius);
  JS_PROP(Position);
  JS_PROP(MasksToBounds);
  JS_PROP(shadowOpacity);
  JS_PROP(frame);
JS_WRAP_CLASS_END(CALayer);


#endif /* NCALayer_h */
