//
//  NMDLVertexAttribute.h
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLVertexAttribute_h
#define NMDLVertexAttribute_h    

#include "NNSObject.h"

#define js_value_MDLVertexAttribute(x) js_value_wrapper(x, MDLVertexAttribute)
#define to_value_MDLVertexAttribute(x) to_value_wrapper(x, MDLVertexAttribute)
#define is_value_MDLVertexAttribute(x) is_value_wrapper(x, MDLVertexAttribute)

// ModelIO constants
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MDLVertexAttribute, NSObject);
  JS_STATIC_METHOD(initWithNameFormatOffsetBufferIndex);
  JS_PROP(name);
  JS_PROP(format);
  JS_PROP(offset);
  JS_PROP(bufferIndex);
  JS_PROP(time);
  JS_PROP(initializationValue);
JS_WRAP_CLASS_END(MDLVertexAttribute);

#endif /* NMDLVertexAttribute_h */
