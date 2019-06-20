//
//  NNSOutputStream.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSOutputStream_h
#define NNSOutputStream_h    

#include "NNSStream.h"

#define js_value_NSOutputStream(x) js_value_wrapper(x, NSOutputStream)
#define to_value_NSOutputStream(x) to_value_wrapper(x, NSOutputStream)
#define is_value_NSOutputStream(x) is_value_wrapper(x, NSOutputStream)

JS_WRAP_CLASS(NSOutputStream, NSStream);
  // TODO: declare NSOutputStream methods and properties
JS_WRAP_CLASS_END(NSOutputStream);

#endif /* NNSOutputStream_h */