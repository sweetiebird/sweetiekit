//
//  NMDLObject.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLObject_h
#define NMDLObject_h    

#include "NNSObject.h"

#define js_value_MDLObject(x) js_value_wrapper(x, MDLObject)
#define to_value_MDLObject(x) to_value_wrapper(x, MDLObject)
#define is_value_MDLObject(x) is_value_wrapper(x, MDLObject)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MDLObject, NSObject);
  JS_METHOD(setComponentForProtocol);
  JS_METHOD(componentConformingToProtocol);
  JS_METHOD(objectForKeyedSubscript);
  JS_METHOD(setObjectForKeyedSubscript);
  JS_METHOD(objectAtPath);
  JS_METHOD(enumerateChildObjectsOfClass);
  JS_METHOD(addChild);
  JS_METHOD(boundingBoxAtTime);
  JS_PROP_READONLY(components);
  JS_PROP(parent);
  JS_PROP(instance);
  JS_PROP_READONLY(path);
  JS_PROP(transform);
  JS_PROP(children);
  JS_PROP(hidden);

  JS_STATIC_METHOD(objectWithSCNNode);
  JS_STATIC_METHOD(objectWithSCNNodeBufferAllocator);
JS_WRAP_CLASS_END(MDLObject);

#endif /* NMDLObject_h */
