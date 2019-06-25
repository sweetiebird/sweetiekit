//
//  NNSInvocation.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSInvocation_h
#define NNSInvocation_h    

#include "NNSObject.h"

#define js_value_NSInvocation(x) js_value_wrapper(x, NSInvocation)
#define to_value_NSInvocation(x) to_value_wrapper(x, NSInvocation)
#define is_value_NSInvocation(x) is_value_wrapper(x, NSInvocation)

JS_WRAP_CLASS(NSInvocation, NSObject);
  // TODO: declare NSInvocation methods and properties
JS_WRAP_CLASS_END(NSInvocation);

#endif /* NNSInvocation_h */