//
//  NMDLMeshBufferMap.h
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLMeshBufferMap_h
#define NMDLMeshBufferMap_h    

#include "NNSObject.h"

#define js_value_MDLMeshBufferMap(x) js_value_wrapper(x, MDLMeshBufferMap)
#define to_value_MDLMeshBufferMap(x) to_value_wrapper(x, MDLMeshBufferMap)
#define is_value_MDLMeshBufferMap(x) is_value_wrapper(x, MDLMeshBufferMap)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MDLMeshBufferMap, NSObject);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(MDLMeshBufferMap);

#endif /* NMDLMeshBufferMap_h */