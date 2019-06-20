//
//  NUITextPosition.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITextPosition.h"

#define instancetype UITextPosition
#define js_value_instancetype js_value_UITextPosition

NUITextPosition::NUITextPosition() {}
NUITextPosition::~NUITextPosition() {}

JS_INIT_CLASS(UITextPosition, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITextPosition, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UITextPosition, NSObject);

NAN_METHOD(NUITextPosition::New) {
  JS_RECONSTRUCT(UITextPosition);
  @autoreleasepool {
    UITextPosition* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITextPosition *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITextPosition alloc] init];
    }
    if (self) {
      NUITextPosition *wrapper = new NUITextPosition();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITextPosition::New: invalid arguments");
    }
  }
}
