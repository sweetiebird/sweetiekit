//
//  NAVCaptureVideoPreviewLayer.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureVideoPreviewLayer_h
#define NAVCaptureVideoPreviewLayer_h    

#include "NCALayer.h"

#define js_value_AVCaptureVideoPreviewLayer(x) js_value_wrapper(x, AVCaptureVideoPreviewLayer)
#define to_value_AVCaptureVideoPreviewLayer(x) to_value_wrapper(x, AVCaptureVideoPreviewLayer)
#define is_value_AVCaptureVideoPreviewLayer(x) is_value_wrapper(x, AVCaptureVideoPreviewLayer)

JS_WRAP_CLASS(AVCaptureVideoPreviewLayer, CALayer);
  JS_STATIC_METHOD(layerWithSession);
  JS_STATIC_METHOD(layerWithSessionWithNoConnection);
  JS_METHOD(initWithSession);
  JS_METHOD(initWithSessionWithNoConnection);
  JS_METHOD(setSessionWithNoConnection);
  JS_METHOD(captureDevicePointOfInterestForPoint);
  JS_METHOD(pointForCaptureDevicePointOfInterest);
  JS_METHOD(metadataOutputRectOfInterestForRect);
  JS_METHOD(rectForMetadataOutputRectOfInterest);
  JS_METHOD(transformedMetadataObjectForMetadataObject);
  JS_PROP(session);
  JS_PROP_READONLY(connection);
  JS_PROP(videoGravity);
  #if TARGET_OS_IPHONE_13_0
    JS_PROP_READONLY(isPreviewing);
  #endif
  JS_PROP_READONLY(isOrientationSupported);
  JS_PROP(orientation);
  JS_PROP_READONLY(isMirroringSupported);
  JS_PROP(automaticallyAdjustsMirroring);
  JS_PROP(isMirrored);
JS_WRAP_CLASS_END(AVCaptureVideoPreviewLayer);

#endif /* NAVCaptureVideoPreviewLayer_h */
