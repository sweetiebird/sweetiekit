//
//  NMDLSubmesh.h
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLSubmesh_h
#define NMDLSubmesh_h    

#include "NNSObject.h"

#define js_value_MDLSubmesh(x) js_value_wrapper(x, MDLSubmesh)
#define to_value_MDLSubmesh(x) to_value_wrapper(x, MDLSubmesh)
#define is_value_MDLSubmesh(x) is_value_wrapper(x, MDLSubmesh)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MDLSubmesh, NSObject);
#if TODO
  JS_STATIC_METHOD(initWithName);
  JS_STATIC_METHOD(initWithIndexBuffer);
  JS_STATIC_METHOD(initWithName);
  JS_STATIC_METHOD(initWithMDLSubmesh);
#endif
  JS_METHOD(indexBufferAsIndexType);
  JS_PROP_READONLY(indexBuffer);
  JS_PROP_READONLY(indexCount);
  JS_PROP_READONLY(indexType);
  JS_PROP_READONLY(geometryType);
  JS_PROP(material);
  JS_PROP(topology);
  JS_PROP(name);

  JS_STATIC_METHOD(submeshWithSCNGeometryElement);
  JS_STATIC_METHOD(submeshWithSCNGeometryElementBufferAllocator);
JS_WRAP_CLASS_END(MDLSubmesh);

#endif /* NMDLSubmesh_h */
