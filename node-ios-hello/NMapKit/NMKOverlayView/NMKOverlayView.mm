//
//  NMKOverlayView.mm
//
//  Created by Shawn Presser on 6/23/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMKOverlayView.h"

#define instancetype MKOverlayView
#define js_value_instancetype js_value_MKOverlayView

NMKOverlayView::NMKOverlayView() {}
NMKOverlayView::~NMKOverlayView() {}

JS_INIT_CLASS(MKOverlayView, UIView);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MKOverlayView, UIView);
  // constant values (exports)
JS_INIT_CLASS_END(MKOverlayView, UIView);

NAN_METHOD(NMKOverlayView::New) {
  JS_RECONSTRUCT(MKOverlayView);
  @autoreleasepool {
    MKOverlayView* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MKOverlayView *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[MKOverlayView alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[MKOverlayView alloc] init];
    }
    if (self) {
      NMKOverlayView *wrapper = new NMKOverlayView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MKOverlayView::New: invalid arguments");
    }
  }
}
