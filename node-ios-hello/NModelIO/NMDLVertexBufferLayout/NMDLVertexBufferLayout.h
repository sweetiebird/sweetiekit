//
//  NMDLVertexBufferLayout.h
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLVertexBufferLayout_h
#define NMDLVertexBufferLayout_h    

#include "NNSObject.h"

#define js_value_MDLVertexBufferLayout(x) js_value_wrapper(x, MDLVertexBufferLayout)
#define to_value_MDLVertexBufferLayout(x) to_value_wrapper(x, MDLVertexBufferLayout)
#define is_value_MDLVertexBufferLayout(x) is_value_wrapper(x, MDLVertexBufferLayout)

// ModelIO constants
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MDLVertexBufferLayout, NSObject);
  JS_STATIC_METHOD(initWithStride);
  JS_PROP(stride);
JS_WRAP_CLASS_END(MDLVertexBufferLayout);

#endif /* NMDLVertexBufferLayout_h */
