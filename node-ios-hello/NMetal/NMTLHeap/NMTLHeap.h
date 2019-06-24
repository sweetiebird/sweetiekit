//
//  NMTLHeap.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLHeap_h
#define NMTLHeap_h    

#include "NNSObject.h"

#define js_value_MTLHeap(x) js_protocol_wrapper(x, MTLHeap)
#define to_value_MTLHeap(x) to_protocol_wrapper(x, MTLHeap)
#define is_value_MTLHeap(x) is_protocol_wrapper(x, MTLHeap)

JS_WRAP_PROTOCOL(MTLHeap, NSObject);
  JS_METHOD(maxAvailableSizeWithAlignment);
  JS_METHOD(newBufferWithLengthOptions);
  JS_METHOD(newTextureWithDescriptor);
  JS_METHOD(setPurgeableState);
  JS_PROP(label);
  JS_PROP_READONLY(device);
  JS_PROP_READONLY(storageMode);
  JS_PROP_READONLY(cpuCacheMode);
  JS_PROP_READONLY(size);
  JS_PROP_READONLY(usedSize);
  JS_PROP_READONLY(currentAllocatedSize);
JS_WRAP_PROTOCOL_END(MTLHeap, NSObject);

#endif /* NMTLHeap_h */
