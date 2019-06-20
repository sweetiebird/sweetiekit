//
//  NNSOperation.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSOperation_h
#define NNSOperation_h    

#include "NNSObject.h"

#define js_value_NSOperation(x) js_value_wrapper(x, NSOperation)
#define to_value_NSOperation(x) to_value_wrapper(x, NSOperation)
#define is_value_NSOperation(x) is_value_wrapper(x, NSOperation)

JS_WRAP_CLASS(NSOperation, NSObject);
  // TODO: declare NSOperation methods and properties
JS_WRAP_CLASS_END(NSOperation);

#endif /* NNSOperation_h */
