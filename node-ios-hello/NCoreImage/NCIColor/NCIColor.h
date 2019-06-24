//
//  NCIColor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCIColor_h
#define NCIColor_h    

#include "NNSObject.h"

#define js_value_CIColor(x) js_value_wrapper(x, CIColor)
#define to_value_CIColor(x) to_value_wrapper(x, CIColor)
#define is_value_CIColor(x) is_value_wrapper(x, CIColor)

JS_WRAP_CLASS(CIColor, NSObject);
  JS_STATIC_METHOD(colorWithCGColor);
  JS_STATIC_METHOD(colorWithRedGreenBlueAlpha);
  JS_STATIC_METHOD(colorWithRedGreenBlue);
  JS_STATIC_METHOD(colorWithRedGreenBlueAlphaColorSpace);
  JS_STATIC_METHOD(colorWithRedGreenBlueColorSpace);
  JS_STATIC_METHOD(colorWithString);
  JS_METHOD(initWithCGColor);
  JS_METHOD(initWithRedGreenBlueAlpha);
  JS_METHOD(initWithRedGreenBlue);
  JS_METHOD(initWithRedGreenBlueAlphaColorSpace);
  JS_METHOD(initWithRedGreenBlueColorSpace);
  JS_PROP_READONLY(numberOfComponents);
  JS_PROP_READONLY(components);
  JS_PROP_READONLY(alpha);
  JS_PROP_READONLY(colorSpace);
  JS_PROP_READONLY(red);
  JS_PROP_READONLY(green);
  JS_PROP_READONLY(blue);
  JS_PROP_READONLY(stringRepresentation);
  JS_STATIC_PROP_READONLY(blackColor);
  JS_STATIC_PROP_READONLY(whiteColor);
  JS_STATIC_PROP_READONLY(grayColor);
  JS_STATIC_PROP_READONLY(redColor);
  JS_STATIC_PROP_READONLY(greenColor);
  JS_STATIC_PROP_READONLY(blueColor);
  JS_STATIC_PROP_READONLY(cyanColor);
  JS_STATIC_PROP_READONLY(magentaColor);
  JS_STATIC_PROP_READONLY(yellowColor);
  JS_STATIC_PROP_READONLY(clearColor);
JS_WRAP_CLASS_END(CIColor);

#endif /* NCIColor_h */
