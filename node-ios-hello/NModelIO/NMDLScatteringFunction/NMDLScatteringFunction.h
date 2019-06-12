//
//  NMDLScatteringFunction.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLScatteringFunction_h
#define NMDLScatteringFunction_h    

#include "NNSObject.h"

#define js_value_MDLScatteringFunction(x) js_value_wrapper(x, MDLScatteringFunction)
#define to_value_MDLScatteringFunction(x) to_value_wrapper(x, MDLScatteringFunction)
#define is_value_MDLScatteringFunction(x) is_value_wrapper(x, MDLScatteringFunction)

JS_WRAP_CLASS(MDLScatteringFunction, NSObject);
  JS_PROP(name);
  JS_PROP_READONLY(baseColor);
  JS_PROP_READONLY(emission);
  JS_PROP_READONLY(specular);
  JS_PROP_READONLY(materialIndexOfRefraction);
  JS_PROP_READONLY(interfaceIndexOfRefraction);
  JS_PROP_READONLY(normal);
  JS_PROP_READONLY(ambientOcclusion);
  JS_PROP_READONLY(ambientOcclusionScale);
JS_WRAP_CLASS_END(MDLScatteringFunction);

#endif /* NMDLScatteringFunction_h */
