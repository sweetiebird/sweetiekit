//
//  NMTLSharedEventListener.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLSharedEventListener_h
#define NMTLSharedEventListener_h    

#include "NNSObject.h"

#define js_value_MTLSharedEventListener(x) js_value_wrapper(x, MTLSharedEventListener)
#define to_value_MTLSharedEventListener(x) to_value_wrapper(x, MTLSharedEventListener)
#define is_value_MTLSharedEventListener(x) is_value_wrapper(x, MTLSharedEventListener)

JS_WRAP_CLASS(MTLSharedEventListener, NSObject);
  // TODO: declare MTLSharedEventListener methods and properties
JS_WRAP_CLASS_END(MTLSharedEventListener);

#endif /* NMTLSharedEventListener_h */