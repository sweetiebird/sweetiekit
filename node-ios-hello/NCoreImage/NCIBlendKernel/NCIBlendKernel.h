//
//  NCIBlendKernel.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCIBlendKernel_h
#define NCIBlendKernel_h    

#include "NCIColorKernel.h"

#define js_value_CIBlendKernel(x) js_value_wrapper(x, CIBlendKernel)
#define to_value_CIBlendKernel(x) to_value_wrapper(x, CIBlendKernel)
#define is_value_CIBlendKernel(x) is_value_wrapper(x, CIBlendKernel)

JS_WRAP_CLASS(CIBlendKernel, CIColorKernel);
  JS_STATIC_METHOD(kernelWithString);
  JS_METHOD(applyWithForegroundBackground);
  JS_STATIC_PROP_READONLY(componentAdd);
  JS_STATIC_PROP_READONLY(componentMultiply);
  JS_STATIC_PROP_READONLY(componentMin);
  JS_STATIC_PROP_READONLY(componentMax);
  JS_STATIC_PROP_READONLY(clear);
  JS_STATIC_PROP_READONLY(source);
  JS_STATIC_PROP_READONLY(destination);
  JS_STATIC_PROP_READONLY(sourceOver);
  JS_STATIC_PROP_READONLY(destinationOver);
  JS_STATIC_PROP_READONLY(sourceIn);
  JS_STATIC_PROP_READONLY(destinationIn);
  JS_STATIC_PROP_READONLY(sourceOut);
  JS_STATIC_PROP_READONLY(destinationOut);
  JS_STATIC_PROP_READONLY(sourceAtop);
  JS_STATIC_PROP_READONLY(destinationAtop);
  JS_STATIC_PROP_READONLY(exclusiveOr);
  JS_STATIC_PROP_READONLY(multiply);
  JS_STATIC_PROP_READONLY(screen);
  JS_STATIC_PROP_READONLY(overlay);
  JS_STATIC_PROP_READONLY(darken);
  JS_STATIC_PROP_READONLY(lighten);
  JS_STATIC_PROP_READONLY(colorDodge);
  JS_STATIC_PROP_READONLY(colorBurn);
  JS_STATIC_PROP_READONLY(hardLight);
  JS_STATIC_PROP_READONLY(softLight);
  JS_STATIC_PROP_READONLY(difference);
  JS_STATIC_PROP_READONLY(exclusion);
  JS_STATIC_PROP_READONLY(hue);
  JS_STATIC_PROP_READONLY(saturation);
  JS_STATIC_PROP_READONLY(color);
  JS_STATIC_PROP_READONLY(luminosity);
  JS_STATIC_PROP_READONLY(subtract);
  JS_STATIC_PROP_READONLY(divide);
  JS_STATIC_PROP_READONLY(linearBurn);
  JS_STATIC_PROP_READONLY(linearDodge);
  JS_STATIC_PROP_READONLY(vividLight);
  JS_STATIC_PROP_READONLY(linearLight);
  JS_STATIC_PROP_READONLY(pinLight);
  JS_STATIC_PROP_READONLY(hardMix);
  JS_STATIC_PROP_READONLY(darkerColor);
  JS_STATIC_PROP_READONLY(lighterColor);
JS_WRAP_CLASS_END(CIBlendKernel);

#endif /* NCIBlendKernel_h */
