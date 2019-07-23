//
//  NVNSequenceRequestHandler.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNSequenceRequestHandler_h
#define NVNSequenceRequestHandler_h    

#include "NNSObject.h"

#define js_value_VNSequenceRequestHandler(x) js_value_wrapper(x, VNSequenceRequestHandler)
#define to_value_VNSequenceRequestHandler(x) to_value_wrapper(x, VNSequenceRequestHandler)
#define is_value_VNSequenceRequestHandler(x) is_value_wrapper(x, VNSequenceRequestHandler)

JS_WRAP_CLASS(VNSequenceRequestHandler, NSObject);
  JS_METHOD(performRequestsOnCVPixelBufferError);
  JS_METHOD(performRequestsOnCVPixelBufferOrientationError);
  JS_METHOD(performRequestsOnCGImageError);
  JS_METHOD(performRequestsOnCGImageOrientationError);
  JS_METHOD(performRequestsOnCIImageError);
  JS_METHOD(performRequestsOnCIImageOrientationError);
  JS_METHOD(performRequestsOnImageURLError);
  JS_METHOD(performRequestsOnImageURLOrientationError);
  JS_METHOD(performRequestsOnImageDataError);
  JS_METHOD(performRequestsOnImageDataOrientationError);
JS_WRAP_CLASS_END(VNSequenceRequestHandler);

#endif /* NVNSequenceRequestHandler_h */
