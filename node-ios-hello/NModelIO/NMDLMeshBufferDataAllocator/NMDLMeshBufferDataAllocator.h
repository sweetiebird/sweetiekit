//
//  NMDLMeshBufferDataAllocator.h
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLMeshBufferDataAllocator_h
#define NMDLMeshBufferDataAllocator_h    

#include "NNSObject.h"

#define js_value_MDLMeshBufferDataAllocator(x) js_value_wrapper(x, MDLMeshBufferDataAllocator)
#define to_value_MDLMeshBufferDataAllocator(x) to_value_wrapper(x, MDLMeshBufferDataAllocator)
#define is_value_MDLMeshBufferDataAllocator(x) is_value_wrapper(x, MDLMeshBufferDataAllocator)

JS_WRAP_CLASS(MDLMeshBufferDataAllocator, NSObject);
JS_WRAP_CLASS_END(MDLMeshBufferDataAllocator);

#endif /* NMDLMeshBufferDataAllocator_h */
