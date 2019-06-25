////
////  RPScreenRecorder.mm
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
  JS_RECONSTRUCT(RPScreenRecorder);

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

#include "NNSError.h"

NAN_METHOD(NRPScreenRecorder::startRecordingWithHandler) {
  JS_UNWRAP(RPScreenRecorder, rp);
  
  __block sweetiekit::JSFunction fn(info[0]);

  [rp startRecordingWithHandler: ^ (NSError * _Nullable error) {
    dispatch_main(^{
      fn.Call("NRPScreenRecorder::startRecording handler", js_value_NSError(error));
      fn.Reset();
    });
  }];
}

#include "NRPPreviewViewController.h"

NAN_METHOD(NRPScreenRecorder::stopRecordingWithHandler) {
  JS_UNWRAP(RPScreenRecorder, rp);

  __block sweetiekit::JSFunction fn(info[0]);

  [rp stopRecordingWithHandler: ^ (RPPreviewViewController * _Nullable previewViewController, NSError * _Nullable error) {
    dispatch_main(^{
      fn.Call("NRPScreenRecorder::stopRecording handler",
        js_value_RPPreviewViewController(previewViewController),
        js_value_NSError(error));
      fn.Reset();
    });
  }];
}
