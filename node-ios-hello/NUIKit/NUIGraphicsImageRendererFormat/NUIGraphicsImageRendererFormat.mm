//
//  NUIGraphicsImageRendererFormat.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIGraphicsImageRendererFormat.h"

NUIGraphicsImageRendererFormat::NUIGraphicsImageRendererFormat() {}
NUIGraphicsImageRendererFormat::~NUIGraphicsImageRendererFormat() {}

JS_INIT_CLASS(UIGraphicsImageRendererFormat, UIGraphicsRendererFormat);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIGraphicsImageRendererFormat, UIGraphicsRendererFormat);
JS_INIT_CLASS_END(UIGraphicsImageRendererFormat, UIGraphicsRendererFormat);

NAN_METHOD(NUIGraphicsImageRendererFormat::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'UIGraphicsImageRendererFormat(...)', turn into construct call.
      JS_SET_RETURN_NEW(UIGraphicsImageRendererFormat, info);
      return;
    }

    UIGraphicsImageRendererFormat* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIGraphicsImageRendererFormat *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIGraphicsImageRendererFormat alloc] init];
    }
    if (self) {
      NUIGraphicsImageRendererFormat *wrapper = new NUIGraphicsImageRendererFormat();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIGraphicsImageRendererFormat::New: invalid arguments");
    }
  }
}
