//
//  NMDLVertexAttributeData.h
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLVertexAttributeData_h
#define NMDLVertexAttributeData_h    

#include "NNSObject.h"

#define js_value_MDLVertexAttributeData(x) js_value_wrapper(x, MDLVertexAttributeData)
#define to_value_MDLVertexAttributeData(x) to_value_wrapper(x, MDLVertexAttributeData)
#define is_value_MDLVertexAttributeData(x) is_value_wrapper(x, MDLVertexAttributeData)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MDLVertexAttributeData, NSObject);
  JS_PROP(map);
  JS_PROP(dataStart);
  JS_PROP(stride);
  JS_PROP(format);
  JS_PROP(bufferSize);
JS_WRAP_CLASS_END(MDLVertexAttributeData);

#endif /* NMDLVertexAttributeData_h */
