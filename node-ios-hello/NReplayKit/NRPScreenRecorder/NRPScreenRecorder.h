//
//  NRPScreenRecorder.h
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NRPScreenRecorder_h
#define NRPScreenRecorder_h    

#include "NNSObject.h"

#define js_value_RPScreenRecorder(x) js_value_wrapper(x, RPScreenRecorder)
#define to_value_RPScreenRecorder(x) to_value_wrapper(x, RPScreenRecorder)
#define is_value_RPScreenRecorder(x) is_value_wrapper(x, RPScreenRecorder)

#define js_value_RPCameraPosition(x) JS_ENUM(RPCameraPosition, NSInteger, x)
#define to_value_RPCameraPosition(x) TO_ENUM(RPCameraPosition, NSInteger, x)
#define is_value_RPCameraPosition(x) IS_ENUM(RPCameraPosition, NSInteger, x)

#define js_value_CMSampleBufferRef(x) js_value_bridged(x, CMSampleBufferRef)
#define to_value_CMSampleBufferRef(x) to_value_bridged(x, CMSampleBufferRef)
#define is_value_CMSampleBufferRef(x) is_value_bridged(x, CMSampleBufferRef)

#define js_value_RPSampleBufferType(x) JS_ENUM(RPSampleBufferType, NSInteger, x)
#define to_value_RPSampleBufferType(x) TO_ENUM(RPSampleBufferType, NSInteger, x)
#define is_value_RPSampleBufferType(x) IS_ENUM(RPSampleBufferType, NSInteger, x)

JS_WRAP_CLASS(RPScreenRecorder, NSObject);
  JS_STATIC_METHOD(sharedRecorder);
  JS_METHOD(startRecordingWithMicrophoneEnabledHandler);
  JS_METHOD(startRecordingWithHandler);
  JS_METHOD(stopRecordingWithHandler);
  JS_METHOD(discardRecordingWithHandler);
  JS_METHOD(startCaptureWithHandlerCompletionHandler);
  JS_METHOD(stopCaptureWithHandler);
  JS_PROP(delegate);
  JS_PROP_READONLY(isAvailable);
  JS_PROP_READONLY(isRecording);
  JS_PROP(isMicrophoneEnabled);
  JS_PROP(isCameraEnabled);
  JS_PROP(cameraPosition);
  JS_PROP_READONLY(cameraPreviewView);
JS_WRAP_CLASS_END(RPScreenRecorder);

#endif /* NRPScreenRecorder_h */
