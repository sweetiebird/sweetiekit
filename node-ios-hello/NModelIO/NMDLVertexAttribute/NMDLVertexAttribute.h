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

JS_WRAP_CLASS(MDLVertexAttribute, NSObject);
  JS_METHOD(initWithNameFormatOffsetBufferIndex);
  JS_PROP(name);
  JS_PROP(format);
  JS_PROP(offset);
  JS_PROP(bufferIndex);
  JS_PROP(time);
  JS_PROP(initializationValue);
JS_WRAP_CLASS_END(MDLVertexAttribute);

#endif /* NMDLVertexAttribute_h */
