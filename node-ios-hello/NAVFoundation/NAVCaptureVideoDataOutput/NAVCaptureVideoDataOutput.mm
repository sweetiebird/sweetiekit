//
//  NAVCaptureVideoDataOutput.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureVideoDataOutput.h"

#define instancetype AVCaptureVideoDataOutput
#define js_value_instancetype js_value_AVCaptureVideoDataOutput

Local<Value>
js_value_dispatch_queue_t(dispatch_queue_t value)
{
  if (!value) {
    return Nan::Undefined();
  }
  return Nan::New<External>((__bridge void*)value);
}

bool
is_value_dispatch_queue_t(Local<Value> value)
{
  if (value->IsExternal()) {
    return true;
  }
  return false;
}

dispatch_queue_t
to_value_dispatch_queue_t(Local<Value> value, bool* failed = nullptr)
{
  dispatch_queue_t result = ::dispatch_get_main_queue();
  if (failed) {
    *failed = false;
  }
  if (!is_value_dispatch_queue_t(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected dispatch_queue_t");
    }
    return result;
  }
  result = (__bridge dispatch_queue_t)(value.As<External>()->Value());
  return result;
}

NAN_METHOD(dispatch_get_main_queue) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_dispatch_queue_t(::dispatch_get_main_queue()));
  }
}

NAN_METHOD(dispatch_get_global_queue) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, identifier);
    declare_value(NSUInteger, flags);
    JS_SET_RETURN(js_value_dispatch_queue_t(::dispatch_get_global_queue(identifier, flags)));
  }
}

NAVCaptureVideoDataOutput::NAVCaptureVideoDataOutput() {}
NAVCaptureVideoDataOutput::~NAVCaptureVideoDataOutput() {}

JS_INIT_CLASS(AVCaptureVideoDataOutput, AVCaptureOutput);
  JS_ASSIGN_GLOBAL_METHOD(dispatch_get_main_queue); // TODO
  JS_ASSIGN_GLOBAL_METHOD(dispatch_get_global_queue); // TODO
  JS_ASSIGN_PROTO_METHOD(setSampleBufferDelegateQueue);
  JS_ASSIGN_PROTO_METHOD(recommendedVideoSettingsForAssetWriterWithOutputFileType);
  JS_ASSIGN_PROTO_METHOD(availableVideoCodecTypesForAssetWriterWithOutputFileType);
  JS_ASSIGN_PROTO_METHOD(recommendedVideoSettingsForVideoCodecTypeAssetWriterOutputFileType);
  JS_ASSIGN_PROTO_PROP_READONLY(sampleBufferDelegate);
  JS_ASSIGN_PROTO_PROP_READONLY(sampleBufferCallbackQueue);
  JS_ASSIGN_PROTO_PROP(videoSettings);
  JS_ASSIGN_PROTO_PROP_READONLY(availableVideoCVPixelFormatTypes);
  JS_ASSIGN_PROTO_PROP_READONLY(availableVideoCodecTypes);
  JS_ASSIGN_PROTO_PROP(minFrameDuration);
  JS_ASSIGN_PROTO_PROP(alwaysDiscardsLateVideoFrames);
  JS_ASSIGN_PROTO_PROP(automaticallyConfiguresOutputBufferDimensions);
  JS_ASSIGN_PROTO_PROP(deliversPreviewSizedOutputBuffers);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureVideoDataOutput, AVCaptureOutput);
  // constant values (exports)
JS_INIT_CLASS_END(AVCaptureVideoDataOutput, AVCaptureOutput);

NAN_METHOD(NAVCaptureVideoDataOutput::New) {
  JS_RECONSTRUCT(AVCaptureVideoDataOutput);
  @autoreleasepool {
    AVCaptureVideoDataOutput* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureVideoDataOutput *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVCaptureVideoDataOutput alloc] init];
    }
    if (self) {
      NAVCaptureVideoDataOutput *wrapper = new NAVCaptureVideoDataOutput();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureVideoDataOutput::New: invalid arguments");
    }
  }
}

#include "NAVCaptureVideoDataOutputSampleBufferDelegate.h"

NAN_METHOD(NAVCaptureVideoDataOutput::setSampleBufferDelegateQueue) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(AVCaptureVideoDataOutputSampleBufferDelegate, sampleBufferDelegate);
    declare_nullable_value(dispatch_queue_t, sampleBufferCallbackQueue);
    [self setSampleBufferDelegate: sampleBufferDelegate queue: sampleBufferCallbackQueue];
  }
}

#include "NAVMediaFormat.h"

NAN_METHOD(NAVCaptureVideoDataOutput::recommendedVideoSettingsForAssetWriterWithOutputFileType) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVFileType, outputFileType);
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, id>*/([self recommendedVideoSettingsForAssetWriterWithOutputFileType: outputFileType]));
  }
}

NAN_METHOD(NAVCaptureVideoDataOutput::availableVideoCodecTypesForAssetWriterWithOutputFileType) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVFileType, outputFileType);
    JS_SET_RETURN(js_value_NSArray<AVVideoCodecType>([self availableVideoCodecTypesForAssetWriterWithOutputFileType: outputFileType]));
  }
}

#include "NAVVideoSettings.h"

NAN_METHOD(NAVCaptureVideoDataOutput::recommendedVideoSettingsForVideoCodecTypeAssetWriterOutputFileType) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVVideoCodecType, videoCodecType);
    declare_value(AVFileType, outputFileType);
    JS_SET_RETURN(js_value_NSDictionary([self recommendedVideoSettingsForVideoCodecType: videoCodecType assetWriterOutputFileType: outputFileType]));
  }
}

#include "NAVCaptureVideoDataOutputSampleBufferDelegate.h"

NAN_GETTER(NAVCaptureVideoDataOutput::sampleBufferDelegateGetter) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureVideoDataOutputSampleBufferDelegate([self sampleBufferDelegate]));
  }
}

NAN_GETTER(NAVCaptureVideoDataOutput::sampleBufferCallbackQueueGetter) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_dispatch_queue_t([self sampleBufferCallbackQueue]));
  }
}

NAN_GETTER(NAVCaptureVideoDataOutput::videoSettingsGetter) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, id>*/([self videoSettings]));
  }
}

NAN_SETTER(NAVCaptureVideoDataOutput::videoSettingsSetter) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary/* <NSString*, id>*/, input);
    [self setVideoSettings: input];
  }
}

NAN_GETTER(NAVCaptureVideoDataOutput::availableVideoCVPixelFormatTypesGetter) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self availableVideoCVPixelFormatTypes]));
  }
}

NAN_GETTER(NAVCaptureVideoDataOutput::availableVideoCodecTypesGetter) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVVideoCodecType>([self availableVideoCodecTypes]));
  }
}

#include "NCMTime.h"

NAN_GETTER(NAVCaptureVideoDataOutput::minFrameDurationGetter) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMTime([self minFrameDuration]));
  }
}

NAN_SETTER(NAVCaptureVideoDataOutput::minFrameDurationSetter) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CMTime, input);
    [self setMinFrameDuration: input];
  }
}

NAN_GETTER(NAVCaptureVideoDataOutput::alwaysDiscardsLateVideoFramesGetter) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self alwaysDiscardsLateVideoFrames]));
  }
}

NAN_SETTER(NAVCaptureVideoDataOutput::alwaysDiscardsLateVideoFramesSetter) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAlwaysDiscardsLateVideoFrames: input];
  }
}

NAN_GETTER(NAVCaptureVideoDataOutput::automaticallyConfiguresOutputBufferDimensionsGetter) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self automaticallyConfiguresOutputBufferDimensions]));
  }
}

NAN_SETTER(NAVCaptureVideoDataOutput::automaticallyConfiguresOutputBufferDimensionsSetter) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutomaticallyConfiguresOutputBufferDimensions: input];
  }
}

NAN_GETTER(NAVCaptureVideoDataOutput::deliversPreviewSizedOutputBuffersGetter) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self deliversPreviewSizedOutputBuffers]));
  }
}

NAN_SETTER(NAVCaptureVideoDataOutput::deliversPreviewSizedOutputBuffersSetter) {
  JS_UNWRAP(AVCaptureVideoDataOutput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setDeliversPreviewSizedOutputBuffers: input];
  }
}
