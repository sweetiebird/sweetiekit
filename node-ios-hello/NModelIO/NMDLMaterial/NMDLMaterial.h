//
//  NMDLMaterial.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLMaterial_h
#define NMDLMaterial_h    

#include "NNSObject.h"

#define js_value_MDLMaterial(x) js_value_wrapper(x, MDLMaterial)
#define to_value_MDLMaterial(x) to_value_wrapper(x, MDLMaterial)
#define is_value_MDLMaterial(x) is_value_wrapper(x, MDLMaterial)

// ModelIO constants

#define js_value_MDLMaterialSemantic(x) JS_ENUM(MDLMaterialSemantic, NSUInteger, x)
#define to_value_MDLMaterialSemantic(x) TO_ENUM(MDLMaterialSemantic, NSUInteger, x)
#define is_value_MDLMaterialSemantic(x) IS_ENUM(MDLMaterialSemantic, NSUInteger, x)

#define js_value_MDLMaterialPropertyType(x) JS_ENUM(MDLMaterialPropertyType, NSUInteger, x)
#define to_value_MDLMaterialPropertyType(x) TO_ENUM(MDLMaterialPropertyType, NSUInteger, x)
#define is_value_MDLMaterialPropertyType(x) IS_ENUM(MDLMaterialPropertyType, NSUInteger, x)

#define js_value_MDLMaterialFace(x) JS_ENUM(MDLMaterialFace, NSUInteger, x)
#define to_value_MDLMaterialFace(x) TO_ENUM(MDLMaterialFace, NSUInteger, x)
#define is_value_MDLMaterialFace(x) IS_ENUM(MDLMaterialFace, NSUInteger, x)

JS_WRAP_CLASS(MDLMaterial, NSObject);
#if TODO
// MDLMaterialPropertyConnection
  JS_STATIC_METHOD(init);
  JS_METHOD(initWithOutput);
// MDLMaterialPropertyNode
  JS_STATIC_METHOD(init);
  JS_METHOD(initWithInputs);
// MDLMaterialPropertyGraph
  JS_STATIC_METHOD(init);
  JS_METHOD(initWithNodes);
  JS_METHOD(evaluate);
#endif
// MDLMaterial
  JS_METHOD(initWithNameScatteringFunction);
  JS_METHOD(setProperty);
  JS_METHOD(removeProperty);
  JS_METHOD(propertyNamed);
  JS_METHOD(propertyWithSemantic);
  JS_METHOD(propertiesWithSemantic);
  JS_METHOD(removeAllProperties);
  JS_METHOD(resolveTexturesWithResolver);
  JS_METHOD(loadTexturesUsingResolver);
  JS_METHOD(objectAtIndexedSubscript);
  JS_METHOD(objectForKeyedSubscript);
#if TODO
// MDLMaterialPropertyConnection
  JS_PROP_READONLY(output);
  JS_PROP_READONLY(input);
// MDLMaterialPropertyNode
  JS_PROP(MDLMaterialPropertyNode());
  JS_PROP_READONLY(inputs);
  JS_PROP_READONLY(outputs);
// MDLMaterialPropertyGraph
  JS_PROP_READONLY(nodes);
  JS_PROP_READONLY(connections);
#endif
// MDLMaterial
  JS_PROP_READONLY(scatteringFunction);
  JS_PROP(name);
  JS_PROP(baseMaterial);
  JS_PROP_READONLY(count);
  JS_PROP(materialFace);

  JS_STATIC_METHOD(materialWithSCNMaterial);
JS_WRAP_CLASS_END(MDLMaterial);

#endif /* NMDLMaterial_h */
