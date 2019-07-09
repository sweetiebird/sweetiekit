//
//  NAVFrameRateRange.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVFrameRateRange_h
#define NAVFrameRateRange_h    

#include "NNSObject.h"

#define js_value_AVFrameRateRange(x) js_value_wrapper(x, AVFrameRateRange)
#define to_value_AVFrameRateRange(x) to_value_wrapper(x, AVFrameRateRange)
#define is_value_AVFrameRateRange(x) is_value_wrapper(x, AVFrameRateRange)

JS_WRAP_CLASS(AVFrameRateRange, NSObject);
  JS_PROP_READONLY(minFrameRate);
  JS_PROP_READONLY(maxFrameRate);
  JS_PROP_READONLY(maxFrameDuration);
  JS_PROP_READONLY(minFrameDuration);
JS_WRAP_CLASS_END(AVFrameRateRange);

#endif /* NAVFrameRateRange_h */
