//
//  NNSBlockOperation.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSBlockOperation_h
#define NNSBlockOperation_h    

#include "NNSOperation.h"

#define js_value_NSBlockOperation(x) js_value_wrapper(x, NSBlockOperation)
#define to_value_NSBlockOperation(x) to_value_wrapper(x, NSBlockOperation)
#define is_value_NSBlockOperation(x) is_value_wrapper(x, NSBlockOperation)

JS_WRAP_CLASS(NSBlockOperation, NSOperation);
  // TODO: declare NSBlockOperation methods and properties
JS_WRAP_CLASS_END(NSBlockOperation);

#endif /* NNSBlockOperation_h */