//
//  NMDLPhysicallyPlausibleScatteringFunction.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLPhysicallyPlausibleScatteringFunction_h
#define NMDLPhysicallyPlausibleScatteringFunction_h    

#include "NMDLScatteringFunction.h"

#define js_value_MDLPhysicallyPlausibleScatteringFunction(x) js_value_wrapper(x, MDLPhysicallyPlausibleScatteringFunction)
#define to_value_MDLPhysicallyPlausibleScatteringFunction(x) to_value_wrapper(x, MDLPhysicallyPlausibleScatteringFunction)
#define is_value_MDLPhysicallyPlausibleScatteringFunction(x) is_value_wrapper(x, MDLPhysicallyPlausibleScatteringFunction)

JS_WRAP_CLASS(MDLPhysicallyPlausibleScatteringFunction, MDLScatteringFunction);
  JS_PROP_READONLY(version);
  JS_PROP_READONLY(subsurface);
  JS_PROP_READONLY(metallic);
  JS_PROP_READONLY(specularAmount);
  JS_PROP_READONLY(specularTint);
  JS_PROP_READONLY(roughness);
  JS_PROP_READONLY(anisotropic);
  JS_PROP_READONLY(anisotropicRotation);
  JS_PROP_READONLY(sheen);
  JS_PROP_READONLY(sheenTint);
  JS_PROP_READONLY(clearcoat);
  JS_PROP_READONLY(clearcoatGloss);
JS_WRAP_CLASS_END(MDLPhysicallyPlausibleScatteringFunction);

#endif /* NMDLPhysicallyPlausibleScatteringFunction_h */
