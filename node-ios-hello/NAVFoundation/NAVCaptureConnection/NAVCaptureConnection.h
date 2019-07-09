//
//  NAVCaptureConnection.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureConnection_h
#define NAVCaptureConnection_h    

#include "NNSObject.h"

#define js_value_AVCaptureConnection(x) js_value_wrapper(x, AVCaptureConnection)
#define to_value_AVCaptureConnection(x) to_value_wrapper(x, AVCaptureConnection)
#define is_value_AVCaptureConnection(x) is_value_wrapper(x, AVCaptureConnection)

JS_WRAP_CLASS(AVCaptureConnection, NSObject);
  JS_STATIC_METHOD(connectionWithInputPortsOutput);
  JS_STATIC_METHOD(connectionWithInputPortVideoPreviewLayer);
  JS_METHOD(initWithInputPortsOutput);
  JS_METHOD(initWithInputPortVideoPreviewLayer);
  JS_PROP_READONLY(inputPorts);
  JS_PROP_READONLY(output);
  JS_PROP_READONLY(videoPreviewLayer);
  JS_PROP(isEnabled);
  JS_PROP_READONLY(isActive);
  JS_PROP_READONLY(audioChannels);
  JS_PROP_READONLY(isVideoMirroringSupported);
  JS_PROP(isVideoMirrored);
  JS_PROP(automaticallyAdjustsVideoMirroring);
  JS_PROP_READONLY(isVideoOrientationSupported);
  JS_PROP(videoOrientation);
  JS_PROP_READONLY(isVideoFieldModeSupported);
  JS_PROP(videoFieldMode);
  JS_PROP_READONLY(isVideoMinFrameDurationSupported);
  JS_PROP(videoMinFrameDuration);
  JS_PROP_READONLY(isVideoMaxFrameDurationSupported);
  JS_PROP(videoMaxFrameDuration);
  JS_PROP_READONLY(videoMaxScaleAndCropFactor);
  JS_PROP(videoScaleAndCropFactor);
  JS_PROP(preferredVideoStabilizationMode);
  JS_PROP_READONLY(activeVideoStabilizationMode);
  JS_PROP_READONLY(isVideoStabilizationSupported);
  JS_PROP_READONLY(isVideoStabilizationEnabled);
  JS_PROP(enablesVideoStabilizationWhenAvailable);
  JS_PROP_READONLY(isCameraIntrinsicMatrixDeliverySupported);
  JS_PROP(isCameraIntrinsicMatrixDeliveryEnabled);
JS_WRAP_CLASS_END(AVCaptureConnection);

#endif /* NAVCaptureConnection_h */
