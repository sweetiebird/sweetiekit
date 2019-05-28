//
//  NSCNMaterial.h
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNMaterial_h
#define NSCNMaterial_h    

#include "NNSObject.h"

#define js_value_SCNMaterial(x) js_value_wrapper(x, SCNMaterial)
#define to_value_SCNMaterial(x) to_value_wrapper(x, SCNMaterial)

#define js_value_SCNLightingModel js_value_NSString
#define to_value_SCNLightingModel to_value_NSString

// SceneKit enums
#define js_value_SCNTransparencyMode(x) JS_ENUM(SCNTransparencyMode, NSInteger, x)
#define to_value_SCNTransparencyMode(x) TO_ENUM(SCNTransparencyMode, NSInteger, x)
#define js_value_SCNBlendMode(x) JS_ENUM(SCNBlendMode, NSInteger, x)
#define to_value_SCNBlendMode(x) TO_ENUM(SCNBlendMode, NSInteger, x)
#define js_value_SCNColorMask(x) JS_ENUM(SCNColorMask, NSInteger, x)
#define to_value_SCNColorMask(x) TO_ENUM(SCNColorMask, NSInteger, x)
#define js_value_SCNCullMode(x) JS_ENUM(SCNCullMode, NSInteger, x)
#define to_value_SCNCullMode(x) TO_ENUM(SCNCullMode, NSInteger, x)
#define js_value_SCNFillMode(x) JS_ENUM(SCNFillMode, NSInteger, x)
#define to_value_SCNFillMode(x) TO_ENUM(SCNFillMode, NSInteger, x)

JS_WRAP_CLASS(SCNMaterial, NSObject);
  JS_PROP(name);
  JS_PROP(diffuse);
  JS_PROP(ambient);
  JS_PROP(specular);
  JS_PROP(emission);
  JS_PROP(transparent);
  JS_PROP(reflective);
  JS_PROP(multiply);
  JS_PROP(normal);
  JS_PROP(displacement);
  JS_PROP(ambientOcclusion);
  JS_PROP(selfIllumination);
  JS_PROP(metalness);
  JS_PROP(roughness);
  JS_PROP(shininess);
  JS_PROP(transparency);
  JS_PROP(lightingModelName);
  JS_PROP(litPerPixel);
  JS_PROP(doubleSided);
  JS_PROP(fillMode);
  JS_PROP(cullMode);
  JS_PROP(transparencyMode);
  JS_PROP(locksAmbientWithDiffuse);
  JS_PROP(writesToDepthBuffer);
  JS_PROP(colorBufferWriteMask);
  JS_PROP(readsFromDepthBuffer);
  JS_PROP(fresnelExponent);
  JS_PROP(blendMode);
JS_WRAP_CLASS_END(SCNMaterial);

#endif /* NSCNMaterial_h */
