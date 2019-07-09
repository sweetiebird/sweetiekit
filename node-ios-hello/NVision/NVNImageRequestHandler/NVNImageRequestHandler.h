//
//  NVNImageRequestHandler.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNImageRequestHandler_h
#define NVNImageRequestHandler_h    

#include "NNSObject.h"

#define js_value_VNImageOption(x) JS_ENUM(VNImageOption, NSString, x)
#define to_value_VNImageOption(x) TO_ENUM(VNImageOption, NSString, x)
#define is_value_VNImageOption(x) IS_ENUM(VNImageOption, NSString, x)

#define js_value_VNImageRequestHandler(x) js_value_wrapper(x, VNImageRequestHandler)
#define to_value_VNImageRequestHandler(x) to_value_wrapper(x, VNImageRequestHandler)
#define is_value_VNImageRequestHandler(x) is_value_wrapper(x, VNImageRequestHandler)

JS_WRAP_CLASS(VNImageRequestHandler, NSObject);
  JS_METHOD(initWithCVPixelBufferOptions);
  JS_METHOD(initWithCVPixelBufferOrientationOptions);
  JS_METHOD(initWithCGImageOptions);
  JS_METHOD(initWithCGImageOrientationOptions);
  JS_METHOD(initWithCIImageOptions);
  JS_METHOD(initWithCIImageOrientationOptions);
  JS_METHOD(initWithURLOptions);
  JS_METHOD(initWithURLOrientationOptions);
  JS_METHOD(initWithDataOptions);
  JS_METHOD(initWithDataOrientationOptions);
  JS_METHOD(performRequestsError);
JS_WRAP_CLASS_END(VNImageRequestHandler);

#endif /* NVNImageRequestHandler_h */
