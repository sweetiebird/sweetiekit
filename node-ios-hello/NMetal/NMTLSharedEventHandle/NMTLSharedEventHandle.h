//
//  NMTLSharedEventHandle.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLSharedEventHandle_h
#define NMTLSharedEventHandle_h    

#include "NNSObject.h"

#define js_value_MTLSharedEventHandle(x) js_value_wrapper(x, MTLSharedEventHandle)
#define to_value_MTLSharedEventHandle(x) to_value_wrapper(x, MTLSharedEventHandle)
#define is_value_MTLSharedEventHandle(x) is_value_wrapper(x, MTLSharedEventHandle)

JS_WRAP_CLASS(MTLSharedEventHandle, NSObject);
  // TODO: declare MTLSharedEventHandle methods and properties
JS_WRAP_CLASS_END(MTLSharedEventHandle);

#endif /* NMTLSharedEventHandle_h */