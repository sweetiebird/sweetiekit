////
////  RPScreenRecorder.m
////  node-ios-hello
////
////  Created by Emily Kolar on 2019-5-26.
////  Copyright © 2019 sweetiebird. All rights reserved.
////

#import <Foundation/Foundation.h>
#import <ReplayKit/ReplayKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NRPScreenRecorder.h"
#include "NRPPreviewViewController.h"

Nan::Persistent<FunctionTemplate> NRPScreenRecorder::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NRPScreenRecorder::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("RPScreenRecorder"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "startRecordingWithHandler", startRecordingWithHandler);
  Nan::SetMethod(proto, "stopRecordingWithHandler", stopRecordingWithHandler);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  
  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NRPScreenRecorder::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NRPScreenRecorder *ui = new NRPScreenRecorder();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge RPScreenRecorder *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([RPScreenRecorder sharedRecorder]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NRPScreenRecorder::NRPScreenRecorder () {}
NRPScreenRecorder::~NRPScreenRecorder () {}

NAN_METHOD(NRPScreenRecorder::startRecordingWithHandler) {
  JS_UNWRAP(RPScreenRecorder, rp);
  
  __block sweetiekit::JSFunction fn(info[0]);

  [rp startRecordingWithHandler: ^ (NSError * _Nullable error) {
    dispatch_ui_sync(dispatch_get_main_queue(), ^{
      Nan::HandleScope scope;
      fn.Call("NRPScreenRecorder::startRecording handler");
      fn.Reset();
    });
  }];
}

NAN_METHOD(NRPScreenRecorder::stopRecordingWithHandler) {
  JS_UNWRAP(RPScreenRecorder, rp);

  __block sweetiekit::JSFunction fn(info[0]);

  [rp stopRecordingWithHandler: ^ (RPPreviewViewController * _Nullable previewViewController, NSError * _Nullable error) {
    dispatch_ui_sync(dispatch_get_main_queue(), ^{
      Nan::HandleScope scope;
      Local<Value> ctrlObj = sweetiekit::GetWrapperFor(previewViewController, NRPPreviewViewController::type);
      fn.Call("NRPScreenRecorder::stopRecording handler", ctrlObj);
      fn.Reset();
    });
  }];
}
