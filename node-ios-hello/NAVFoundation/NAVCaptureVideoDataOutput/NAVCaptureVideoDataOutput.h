//
//  NAVCaptureVideoDataOutput.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureVideoDataOutput_h
#define NAVCaptureVideoDataOutput_h    

#include "NAVCaptureOutput.h"

#define js_value_AVCaptureVideoDataOutput(x) js_value_wrapper(x, AVCaptureVideoDataOutput)
#define to_value_AVCaptureVideoDataOutput(x) to_value_wrapper(x, AVCaptureVideoDataOutput)
#define is_value_AVCaptureVideoDataOutput(x) is_value_wrapper(x, AVCaptureVideoDataOutput)

JS_WRAP_CLASS(AVCaptureVideoDataOutput, AVCaptureOutput);
  JS_METHOD(setSampleBufferDelegateQueue);
  JS_METHOD(recommendedVideoSettingsForAssetWriterWithOutputFileType);
  JS_METHOD(availableVideoCodecTypesForAssetWriterWithOutputFileType);
  JS_METHOD(recommendedVideoSettingsForVideoCodecTypeAssetWriterOutputFileType);
  JS_PROP_READONLY(sampleBufferDelegate);
  JS_PROP_READONLY(sampleBufferCallbackQueue);
  JS_PROP(videoSettings);
  JS_PROP_READONLY(availableVideoCVPixelFormatTypes);
  JS_PROP_READONLY(availableVideoCodecTypes);
  JS_PROP(minFrameDuration);
  JS_PROP(alwaysDiscardsLateVideoFrames);
  JS_PROP(automaticallyConfiguresOutputBufferDimensions);
  JS_PROP(deliversPreviewSizedOutputBuffers);
JS_WRAP_CLASS_END(AVCaptureVideoDataOutput);

#endif /* NAVCaptureVideoDataOutput_h */
