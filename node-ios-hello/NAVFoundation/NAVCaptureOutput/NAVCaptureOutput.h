//
//  NAVCaptureOutput.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureOutput_h
#define NAVCaptureOutput_h    

#include "NNSObject.h"

#define js_value_AVCaptureOutput(x) js_value_wrapper(x, AVCaptureOutput)
#define to_value_AVCaptureOutput(x) to_value_wrapper(x, AVCaptureOutput)
#define is_value_AVCaptureOutput(x) is_value_wrapper(x, AVCaptureOutput)

#define js_value_AVCaptureOutputDataDroppedReason(x) JS_ENUM(AVCaptureOutputDataDroppedReason, NSInteger, x)
#define to_value_AVCaptureOutputDataDroppedReason(x) TO_ENUM(AVCaptureOutputDataDroppedReason, NSInteger, x)
#define is_value_AVCaptureOutputDataDroppedReason(x) IS_ENUM(AVCaptureOutputDataDroppedReason, NSInteger, x)

JS_WRAP_CLASS(AVCaptureOutput, NSObject);
  JS_METHOD(connectionWithMediaType);
  JS_METHOD(transformedMetadataObjectForMetadataObjectConnection);
  JS_METHOD(metadataOutputRectOfInterestForRect);
  JS_METHOD(rectForMetadataOutputRectOfInterest);
  JS_PROP_READONLY(connections);
JS_WRAP_CLASS_END(AVCaptureOutput);

#endif /* NAVCaptureOutput_h */
