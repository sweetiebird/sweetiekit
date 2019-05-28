//
//  NARFrame.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import <ARKit/ARKit.h>
#include "defines.h"
#include "NARFrame.h"
#include "NARCamera.h"
#include "NARLightEstimate.h"
#include "NNSObject.h"
#include "NARWorldTrackingConfiguration.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NARFrame::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NARFrame::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("ARFrame"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP_READONLY(proto, "camera", Camera);
  JS_SET_PROP_READONLY(proto, "lightEstimate", LightEstimate);
  JS_ASSIGN_PROP_READONLY(proto, capturedImage);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NARFrame::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NARFrame *session = new NARFrame();

  if (info[0]->IsExternal()) {
    session->SetNSObject((__bridge ARFrame *)(info[0].As<External>()->Value()));
  } else {
    Nan::ThrowError("ARFrame must be external");
  }
  session->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_GETTER(NARFrame::CameraGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARFrame, frame);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([frame camera], NARCamera::type));
}

NAN_GETTER(NARFrame::LightEstimateGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARFrame, frame);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([frame lightEstimate], NARLightEstimate::type));
}

#include "NUIImage.h"
#import <CoreVideo/CoreVideo.h>

JS_GETTER(ARFrame, frame, capturedImage, {
  CVPixelBufferRef pixelBuffer = [frame capturedImage];
//    CIImage *ciImage = [CIImage imageWithCVPixelBuffer:pixelBuffer];
//
//    CIContext *temporaryContext = [CIContext contextWithOptions:nil];
//    CGImageRef videoImage = [temporaryContext
//                       createCGImage:ciImage
//                       fromRect:CGRectMake(0, 0, 
//                              CVPixelBufferGetWidth(pixelBuffer),
//                              CVPixelBufferGetHeight(pixelBuffer))];
//
//    UIImage *uiImage = [UIImage imageWithCGImage:videoImage];
//    CGImageRelease(videoImage);
//    JS_SET_RETURN(sweetiekit::GetWrapperFor(uiImage, NUIImage::type));
  if (pixelBuffer != nullptr) {
    UIImage* uiImage = [[UIImage alloc] initWithPixelBuffer:pixelBuffer];
    JS_SET_RETURN(sweetiekit::GetWrapperFor(uiImage, NUIImage::type));
  }
});

NARFrame::NARFrame () {}
NARFrame::~NARFrame () {}
