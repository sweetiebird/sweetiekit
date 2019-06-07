//
//  NUIGraphicsRendererFormat.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIGraphicsRendererFormat.h"

NUIGraphicsRendererFormat::NUIGraphicsRendererFormat() {}
NUIGraphicsRendererFormat::~NUIGraphicsRendererFormat() {}

JS_INIT_CLASS(UIGraphicsRendererFormat, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIGraphicsRendererFormat, NSObject);
JS_INIT_CLASS_END(UIGraphicsRendererFormat, NSObject);

NAN_METHOD(NUIGraphicsRendererFormat::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'UIGraphicsRendererFormat(...)', turn into construct call.
      JS_SET_RETURN_NEW(UIGraphicsRendererFormat, info);
      return;
    }

    UIGraphicsRendererFormat* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIGraphicsRendererFormat *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIGraphicsRendererFormat alloc] init];
    }
    if (self) {
      NUIGraphicsRendererFormat *wrapper = new NUIGraphicsRendererFormat();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIGraphicsRendererFormat::New: invalid arguments");
    }
  }
}
