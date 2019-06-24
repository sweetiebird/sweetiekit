//
//  NMTLRenderPipelineReflection.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLRenderPipelineReflection_h
#define NMTLRenderPipelineReflection_h    

#include "NNSObject.h"

#define js_value_MTLRenderPipelineReflection(x) js_value_wrapper(x, MTLRenderPipelineReflection)
#define to_value_MTLRenderPipelineReflection(x) to_value_wrapper(x, MTLRenderPipelineReflection)
#define is_value_MTLRenderPipelineReflection(x) is_value_wrapper(x, MTLRenderPipelineReflection)

JS_WRAP_CLASS(MTLRenderPipelineReflection, NSObject);
  JS_PROP_READONLY(vertexArguments);
  JS_PROP_READONLY(fragmentArguments);
  JS_PROP_READONLY(tileArguments);
JS_WRAP_CLASS_END(MTLRenderPipelineReflection);

#endif /* NMTLRenderPipelineReflection_h */
