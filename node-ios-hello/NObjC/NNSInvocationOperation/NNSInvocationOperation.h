//
//  NNSInvocationOperation.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSInvocationOperation_h
#define NNSInvocationOperation_h    

#include "NNSOperation.h"

#define js_value_NSInvocationOperation(x) js_value_wrapper(x, NSInvocationOperation)
#define to_value_NSInvocationOperation(x) to_value_wrapper(x, NSInvocationOperation)
#define is_value_NSInvocationOperation(x) is_value_wrapper(x, NSInvocationOperation)

JS_WRAP_CLASS(NSInvocationOperation, NSOperation);
  // TODO: declare NSInvocationOperation methods and properties
JS_WRAP_CLASS_END(NSInvocationOperation);

#endif /* NNSInvocationOperation_h */