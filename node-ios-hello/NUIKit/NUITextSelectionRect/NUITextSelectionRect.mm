//
//  NUITextSelectionRect.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITextSelectionRect.h"

#define instancetype UITextSelectionRect
#define js_value_instancetype js_value_UITextSelectionRect

NUITextSelectionRect::NUITextSelectionRect() {}
NUITextSelectionRect::~NUITextSelectionRect() {}

JS_INIT_CLASS(UITextSelectionRect, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITextSelectionRect, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UITextSelectionRect, NSObject);

NAN_METHOD(NUITextSelectionRect::New) {
  JS_RECONSTRUCT(UITextSelectionRect);
  @autoreleasepool {
    UITextSelectionRect* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITextSelectionRect *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITextSelectionRect alloc] init];
    }
    if (self) {
      NUITextSelectionRect *wrapper = new NUITextSelectionRect();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITextSelectionRect::New: invalid arguments");
    }
  }
}
