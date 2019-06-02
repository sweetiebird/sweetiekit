////
////  RPScreenRecorder.m
////  node-ios-hello
////
////  Created by Emily Kolar on 2019-5-26.
////  Copyright © 2019 sweetiebird. All rights reserved.
////
#include "NRPScreenRecorder.h"
#include "NRPPreviewViewController.h"

NRPScreenRecorder::NRPScreenRecorder () {}
NRPScreenRecorder::~NRPScreenRecorder () {}

JS_INIT_CLASS(RPScreenRecorder, NSObject);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, startRecordingWithHandler);
  JS_ASSIGN_METHOD(proto, stopRecordingWithHandler);
  // static members (ctor)
  JS_INIT_CTOR(RPScreenRecorder, NSObject);
JS_INIT_CLASS_END(RPScreenRecorder, NSObject);

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
