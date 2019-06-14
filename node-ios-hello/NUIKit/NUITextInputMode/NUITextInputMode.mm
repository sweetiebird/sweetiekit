//
//  NUITextInputMode.mm
//
//  Created by Shawn Presser on 6/12/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITextInputMode.h"

#define instancetype UITextInputMode
#define js_value_instancetype js_value_UITextInputMode

NUITextInputMode::NUITextInputMode() {}
NUITextInputMode::~NUITextInputMode() {}

JS_INIT_CLASS(UITextInputMode, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP_READONLY(primaryLanguage);
  // static members (ctor)
  JS_INIT_CTOR(UITextInputMode, NSObject);
  JS_ASSIGN_STATIC_PROP_READONLY(currentInputMode);
  JS_ASSIGN_STATIC_PROP_READONLY(activeInputModes);
  // constant values (exports)
JS_INIT_CLASS_END(UITextInputMode, NSObject);

NAN_METHOD(NUITextInputMode::New) {
  JS_RECONSTRUCT(UITextInputMode);
  @autoreleasepool {
    UITextInputMode* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITextInputMode *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITextInputMode alloc] init];
    }
    if (self) {
      NUITextInputMode *wrapper = new NUITextInputMode();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITextInputMode::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUITextInputMode::currentInputModeGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextInputMode([UITextInputMode currentInputMode]));
  }
}

NAN_GETTER(NUITextInputMode::primaryLanguageGetter) {
  JS_UNWRAP(UITextInputMode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self primaryLanguage]));
  }
}

NAN_GETTER(NUITextInputMode::activeInputModesGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UITextInputMode*>([UITextInputMode activeInputModes]));
  }
}

