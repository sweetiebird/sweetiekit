//
//  NAVCaptureOutput.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureOutput.h"

#define instancetype AVCaptureOutput
#define js_value_instancetype js_value_AVCaptureOutput

NAVCaptureOutput::NAVCaptureOutput() {}
NAVCaptureOutput::~NAVCaptureOutput() {}

JS_INIT_CLASS(AVCaptureOutput, NSObject);
  JS_ASSIGN_PROTO_METHOD(connectionWithMediaType);
  JS_ASSIGN_PROTO_METHOD(transformedMetadataObjectForMetadataObjectConnection);
  JS_ASSIGN_PROTO_METHOD(metadataOutputRectOfInterestForRect);
  JS_ASSIGN_PROTO_METHOD(rectForMetadataOutputRectOfInterest);
  JS_ASSIGN_PROTO_PROP_READONLY(connections);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureOutput, NSObject);
  // constant values (exports)


  //typedef NS_ENUM(NSInteger, AVCaptureOutputDataDroppedReason) {
    JS_ASSIGN_ENUM(AVCaptureOutputDataDroppedReasonNone, NSInteger); //           = 0,
    JS_ASSIGN_ENUM(AVCaptureOutputDataDroppedReasonLateData, NSInteger); //       = 1,
    JS_ASSIGN_ENUM(AVCaptureOutputDataDroppedReasonOutOfBuffers, NSInteger); //   = 2,
    JS_ASSIGN_ENUM(AVCaptureOutputDataDroppedReasonDiscontinuity, NSInteger); //  = 3,
  //} API_AVAILABLE(macos(10.15), ios(11.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

JS_INIT_CLASS_END(AVCaptureOutput, NSObject);

NAN_METHOD(NAVCaptureOutput::New) {
  JS_RECONSTRUCT(AVCaptureOutput);
  @autoreleasepool {
    AVCaptureOutput* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureOutput *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVCaptureOutput *wrapper = new NAVCaptureOutput();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureOutput::New: invalid arguments");
    }
  }
}

#include "NAVMediaFormat.h"
#include "NAVCaptureConnection.h"

NAN_METHOD(NAVCaptureOutput::connectionWithMediaType) {
  JS_UNWRAP(AVCaptureOutput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVMediaType, mediaType);
    JS_SET_RETURN(js_value_AVCaptureConnection([self connectionWithMediaType: mediaType]));
  }
}

#include "NAVMetadataObject.h"

NAN_METHOD(NAVCaptureOutput::transformedMetadataObjectForMetadataObjectConnection) {
  JS_UNWRAP(AVCaptureOutput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVMetadataObject, metadataObject);
    declare_pointer(AVCaptureConnection, connection);
    JS_SET_RETURN(js_value_AVMetadataObject([self transformedMetadataObjectForMetadataObject: metadataObject connection: connection]));
  }
}

NAN_METHOD(NAVCaptureOutput::metadataOutputRectOfInterestForRect) {
  JS_UNWRAP(AVCaptureOutput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rectInOutputCoordinates);
    JS_SET_RETURN(js_value_CGRect([self metadataOutputRectOfInterestForRect: rectInOutputCoordinates]));
  }
}

NAN_METHOD(NAVCaptureOutput::rectForMetadataOutputRectOfInterest) {
  JS_UNWRAP(AVCaptureOutput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rectInMetadataOutputCoordinates);
    JS_SET_RETURN(js_value_CGRect([self rectForMetadataOutputRectOfInterest: rectInMetadataOutputCoordinates]));
  }
}

NAN_GETTER(NAVCaptureOutput::connectionsGetter) {
  JS_UNWRAP(AVCaptureOutput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVCaptureConnection*>([self connections]));
  }
}
