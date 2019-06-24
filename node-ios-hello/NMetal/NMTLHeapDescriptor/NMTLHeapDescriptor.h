//
//  NMTLHeapDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLHeapDescriptor_h
#define NMTLHeapDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLHeapDescriptor(x) js_value_wrapper(x, MTLHeapDescriptor)
#define to_value_MTLHeapDescriptor(x) to_value_wrapper(x, MTLHeapDescriptor)
#define is_value_MTLHeapDescriptor(x) is_value_wrapper(x, MTLHeapDescriptor)

JS_WRAP_CLASS(MTLHeapDescriptor, NSObject);
  JS_PROP(size);
  JS_PROP(storageMode);
  JS_PROP(cpuCacheMode);
JS_WRAP_CLASS_END(MTLHeapDescriptor);

#endif /* NMTLHeapDescriptor_h */
