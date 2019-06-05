//
//  NUIBezierPath.h
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIBezierPath_h
#define NUIBezierPath_h    

#include "NNSObject.h"

#define js_value_UIBezierPath(x) js_value_wrapper(x, UIBezierPath)
#define to_value_UIBezierPath(x) to_value_wrapper(x, UIBezierPath)
#define is_value_UIBezierPath(x) is_value_wrapper(x, UIBezierPath)

JS_WRAP_CLASS(UIBezierPath, NSObject);
  JS_METHOD(bezierPath);
  JS_METHOD(bezierPathWithRect);
  JS_METHOD(bezierPathWithOvalInRect);
  JS_METHOD(bezierPathWithArcCenter);
  JS_METHOD(moveToPoint);
  JS_PROP(lineWidth);
JS_WRAP_CLASS_END(UIBezierPath);

#endif /* NUIBezierPath_h */
