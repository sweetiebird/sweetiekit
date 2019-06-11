//
//  NMDLMaterialProperty.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLMaterialProperty_h
#define NMDLMaterialProperty_h    

#include "NNSObject.h"

#define js_value_MDLMaterialProperty(x) js_value_wrapper(x, MDLMaterialProperty)
#define to_value_MDLMaterialProperty(x) to_value_wrapper(x, MDLMaterialProperty)
#define is_value_MDLMaterialProperty(x) is_value_wrapper(x, MDLMaterialProperty)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MDLMaterialProperty, NSObject);
// MDLMaterialProperty
  JS_STATIC_METHOD(initWithNameSemantic);
  JS_STATIC_METHOD(initWithNameSemanticFloat);
  JS_STATIC_METHOD(initWithNameSemanticFloat2);
  JS_STATIC_METHOD(initWithNameSemanticFloat3);
  JS_STATIC_METHOD(initWithNameSemanticFloat4);
  JS_STATIC_METHOD(initWithNameSemanticMatrix4x4);
  JS_STATIC_METHOD(initWithNameSemanticURL);
  JS_STATIC_METHOD(initWithNameSemanticString);
  JS_STATIC_METHOD(initWithNameSemanticTextureSampler);
  JS_STATIC_METHOD(initWithNameSemanticColor);
  JS_METHOD(setProperties);
  JS_PROP(semantic);
  JS_PROP(type);
  JS_PROP(name);
  JS_PROP(stringValue);
  JS_PROP(URLValue);
  JS_PROP(textureSamplerValue);
  JS_PROP(color);
  JS_PROP(floatValue);
  JS_PROP(float2Value);
  JS_PROP(float3Value);
  JS_PROP(float4Value);
  JS_PROP(matrix4x4);
  JS_PROP(luminance);
JS_WRAP_CLASS_END(MDLMaterialProperty);

#endif /* NMDLMaterialProperty_h */
