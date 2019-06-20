//
//  NUITextInputStringTokenizer.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITextInputStringTokenizer.h"

#define instancetype UITextInputStringTokenizer
#define js_value_instancetype js_value_UITextInputStringTokenizer

NUITextInputStringTokenizer::NUITextInputStringTokenizer() {}
NUITextInputStringTokenizer::~NUITextInputStringTokenizer() {}

JS_INIT_CLASS(UITextInputStringTokenizer, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITextInputStringTokenizer, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UITextInputStringTokenizer, NSObject);

NAN_METHOD(NUITextInputStringTokenizer::New) {
  JS_RECONSTRUCT(UITextInputStringTokenizer);
  @autoreleasepool {
    UITextInputStringTokenizer* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITextInputStringTokenizer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITextInputStringTokenizer alloc] init];
    }
    if (self) {
      NUITextInputStringTokenizer *wrapper = new NUITextInputStringTokenizer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITextInputStringTokenizer::New: invalid arguments");
    }
  }
}
