//
//  NMDLSubmeshTopology.h
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLSubmeshTopology_h
#define NMDLSubmeshTopology_h    

#include "NNSObject.h"

#define js_value_MDLSubmeshTopology(x) js_value_wrapper(x, MDLSubmeshTopology)
#define to_value_MDLSubmeshTopology(x) to_value_wrapper(x, MDLSubmeshTopology)
#define is_value_MDLSubmeshTopology(x) is_value_wrapper(x, MDLSubmeshTopology)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MDLSubmeshTopology, NSObject);
  JS_METHOD(initWithSubmesh);
  JS_PROP(faceTopology);
  JS_PROP(faceCount);
  JS_PROP(vertexCreaseIndices);
  JS_PROP(vertexCreases);
  JS_PROP(vertexCreaseCount);
  JS_PROP(edgeCreaseIndices);
  JS_PROP(edgeCreases);
  JS_PROP(edgeCreaseCount);
  JS_PROP(holes);
  JS_PROP(holeCount);
JS_WRAP_CLASS_END(MDLSubmeshTopology);

#endif /* NMDLSubmeshTopology_h */
