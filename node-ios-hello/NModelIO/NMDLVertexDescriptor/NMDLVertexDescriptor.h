//
//  NMDLVertexDescriptor.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLVertexDescriptor_h
#define NMDLVertexDescriptor_h    

#include "NNSObject.h"

#define js_value_MDLVertexDescriptor(x) js_value_wrapper(x, MDLVertexDescriptor)
#define to_value_MDLVertexDescriptor(x) to_value_wrapper(x, MDLVertexDescriptor)
#define is_value_MDLVertexDescriptor(x) is_value_wrapper(x, MDLVertexDescriptor)

// ModelIO constants
#define js_value_MDLVertexFormat(x) JS_ENUM(MDLVertexFormat, NSInteger, x)
#define to_value_MDLVertexFormat(x) TO_ENUM(MDLVertexFormat, NSInteger, x)
#define is_value_MDLVertexFormat(x) IS_ENUM(MDLVertexFormat, NSInteger, x)

JS_WRAP_CLASS(MDLVertexDescriptor, NSObject);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(MDLVertexDescriptor);

#endif /* NMDLVertexDescriptor_h */
