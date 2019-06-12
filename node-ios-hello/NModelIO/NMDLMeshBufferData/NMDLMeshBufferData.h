//
//  NMDLMeshBufferData.h
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLMeshBufferData_h
#define NMDLMeshBufferData_h    

#include "NNSObject.h"

#define js_value_MDLMeshBufferData(x) js_value_wrapper(x, MDLMeshBufferData)
#define to_value_MDLMeshBufferData(x) to_value_wrapper(x, MDLMeshBufferData)
#define is_value_MDLMeshBufferData(x) is_value_wrapper(x, MDLMeshBufferData)

JS_WRAP_CLASS(MDLMeshBufferData, NSObject);
  JS_STATIC_METHOD(initWithTypeLength);
  JS_STATIC_METHOD(initWithTypeData);
  JS_PROP_READONLY(data);
// MDLMeshBuffer
  JS_METHOD(fillDataOffset);
  JS_METHOD(map);
JS_WRAP_CLASS_END(MDLMeshBufferData);

#endif /* NMDLMeshBufferData_h */
