//
//  NARFrame.m
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import <ARKit/ARKit.h>
#include <CoreImage/CoreImage.h>
#include "defines.h"
#include "NARFrame.h"
#include "NARCamera.h"
#include "NARLightEstimate.h"
#include "NNSObject.h"
#include "NARWorldTrackingConfiguration.h"
#include "NUIImage.h"
#include "NCIImage.h"
#import "node_ios_hello-Swift.h"

NARFrame::NARFrame () {}
NARFrame::~NARFrame () {}

JS_INIT_CLASS(ARFrame, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, camera);
  JS_ASSIGN_PROP_READONLY(proto, lightEstimate);
  JS_ASSIGN_PROP_READONLY(proto, capturedImage);
  JS_ASSIGN_METHOD(proto, displayTransform);

  // static members (ctor)
  JS_INIT_CTOR(ARFrame, NSObject);
  
JS_INIT_CLASS_END(ARFrame, NSObject);

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

NAN_GETTER(NARFrame::cameraGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARFrame, frame);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([frame camera], NARCamera::type));
}

NAN_GETTER(NARFrame::lightEstimateGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARFrame, frame);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([frame lightEstimate], NARLightEstimate::type));
}

NAN_GETTER(NARFrame::capturedImageGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARFrame, frame);

  CIImage *ciImg =[[CIImage alloc] initWithCVPixelBuffer:[frame capturedImage]];

  JS_SET_RETURN(sweetiekit::GetWrapperFor(ciImg, NCIImage::type));
}

NAN_METHOD(NARFrame::displayTransform) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARFrame, ar);

  NSNumber *val = [[NSNumber alloc] initWithDouble:TO_DOUBLE(info[0])];
  UIInterfaceOrientation orient = UIInterfaceOrientation([val integerValue]);
  
  Local<Object> jsObj = JS_OBJ(info[1]);
  double w = TO_DOUBLE(jsObj->Get(JS_STR("width")));
  double h = TO_DOUBLE(jsObj->Get(JS_STR("height")));

  CGAffineTransform xform = [ar displayTransformForOrientation:orient viewportSize:CGSizeMake(w, h)];
  const float* matrix = (const float*)&xform;
  JS_SET_RETURN(createTypedArray<Float32Array>(9, matrix));
}
