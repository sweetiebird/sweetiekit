//
//  NAVCaptureSession.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureSession_h
#define NAVCaptureSession_h    

#include "NNSObject.h"

#define js_value_AVCaptureVideoOrientation(x) JS_ENUM(AVCaptureVideoOrientation, NSInteger, x)
#define to_value_AVCaptureVideoOrientation(x) TO_ENUM(AVCaptureVideoOrientation, NSInteger, x)
#define is_value_AVCaptureVideoOrientation(x) IS_ENUM(AVCaptureVideoOrientation, NSInteger, x)

#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
#define js_value_AVVideoFieldMode(x) JS_ENUM(AVVideoFieldMode, NSInteger, x)
#define to_value_AVVideoFieldMode(x) TO_ENUM(AVVideoFieldMode, NSInteger, x)
#define is_value_AVVideoFieldMode(x) IS_ENUM(AVVideoFieldMode, NSInteger, x)
#endif

#define js_value_AVCaptureSession(x) js_value_wrapper(x, AVCaptureSession)
#define to_value_AVCaptureSession(x) to_value_wrapper(x, AVCaptureSession)
#define is_value_AVCaptureSession(x) is_value_wrapper(x, AVCaptureSession)

JS_WRAP_CLASS(AVCaptureSession, NSObject);
  JS_METHOD(canSetSessionPreset);
  JS_METHOD(canAddInput);
  JS_METHOD(addInput);
  JS_METHOD(removeInput);
  JS_METHOD(canAddOutput);
  JS_METHOD(addOutput);
  JS_METHOD(removeOutput);
  JS_METHOD(addInputWithNoConnections);
  JS_METHOD(addOutputWithNoConnections);
  JS_METHOD(canAddConnection);
  JS_METHOD(addConnection);
  JS_METHOD(removeConnection);
  JS_METHOD(beginConfiguration);
  JS_METHOD(commitConfiguration);
  JS_METHOD(startRunning);
  JS_METHOD(stopRunning);
  JS_PROP(sessionPreset);
  JS_PROP_READONLY(inputs);
  JS_PROP_READONLY(outputs);
  JS_PROP_READONLY(connections);
  JS_PROP_READONLY(isRunning);
  JS_PROP_READONLY(isInterrupted);
  JS_PROP(usesApplicationAudioSession);
  JS_PROP(automaticallyConfiguresApplicationAudioSession);
  JS_PROP(automaticallyConfiguresCaptureDeviceForWideColor);
  JS_PROP_READONLY(masterClock);
JS_WRAP_CLASS_END(AVCaptureSession);

#endif /* NAVCaptureSession_h */
