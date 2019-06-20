//
//  NNSStream.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSStream_h
#define NNSStream_h    

#include "NNSObject.h"

#define js_value_NSStream(x) js_value_wrapper(x, NSStream)
#define to_value_NSStream(x) to_value_wrapper(x, NSStream)
#define is_value_NSStream(x) is_value_wrapper(x, NSStream)

JS_WRAP_CLASS(NSStream, NSObject);
JS_WRAP_CLASS_END(NSStream);

#endif /* NNSStream_h */
