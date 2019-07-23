//
//  NARVideoFormat.h
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARVideoFormat_h
#define NARVideoFormat_h    

#include "NNSObject.h"

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

#define js_value_ARVideoFormat(x) js_value_wrapper(x, ARVideoFormat)
#define to_value_ARVideoFormat(x) to_value_wrapper(x, ARVideoFormat)
#define is_value_ARVideoFormat(x) is_value_wrapper(x, ARVideoFormat)

JS_WRAP_CLASS(ARVideoFormat, NSObject);
  JS_PROP_READONLY(imageResolution);
  JS_PROP_READONLY(framesPerSecond);
JS_WRAP_CLASS_END(ARVideoFormat);

#endif

#endif /* NARVideoFormat_h */
