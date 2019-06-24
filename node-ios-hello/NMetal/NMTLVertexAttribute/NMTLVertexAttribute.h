//
//  NMTLVertexAttribute.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLVertexAttribute_h
#define NMTLVertexAttribute_h    

#include "NNSObject.h"

#define js_value_MTLVertexAttribute(x) js_value_wrapper(x, MTLVertexAttribute)
#define to_value_MTLVertexAttribute(x) to_value_wrapper(x, MTLVertexAttribute)
#define is_value_MTLVertexAttribute(x) is_value_wrapper(x, MTLVertexAttribute)

JS_WRAP_CLASS(MTLVertexAttribute, NSObject);
  // TODO: declare MTLVertexAttribute methods and properties
JS_WRAP_CLASS_END(MTLVertexAttribute);

#endif /* NMTLVertexAttribute_h */