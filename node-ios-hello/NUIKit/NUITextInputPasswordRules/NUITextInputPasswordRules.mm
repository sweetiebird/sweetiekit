//
//  NUITextInputPasswordRules.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITextInputPasswordRules.h"

#define instancetype UITextInputPasswordRules
#define js_value_instancetype js_value_UITextInputPasswordRules

NUITextInputPasswordRules::NUITextInputPasswordRules() {}
NUITextInputPasswordRules::~NUITextInputPasswordRules() {}

JS_INIT_CLASS(UITextInputPasswordRules, NSObject);
  // instance members (proto)
  JS_ASSIGN_STATIC_METHOD(passwordRulesWithDescriptor);
  JS_ASSIGN_PROTO_PROP_READONLY(passwordRulesDescriptor);

  // static members (ctor)
  JS_INIT_CTOR(UITextInputPasswordRules, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UITextInputPasswordRules, NSObject);

NAN_METHOD(NUITextInputPasswordRules::New) {
  JS_RECONSTRUCT(UITextInputPasswordRules);
  @autoreleasepool {
    UITextInputPasswordRules* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITextInputPasswordRules *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUITextInputPasswordRules *wrapper = new NUITextInputPasswordRules();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITextInputPasswordRules::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUITextInputPasswordRules::passwordRulesWithDescriptor) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, passwordRulesDescriptor);
    JS_SET_RETURN(js_value_instancetype([UITextInputPasswordRules passwordRulesWithDescriptor: passwordRulesDescriptor]));
  }
}

NAN_GETTER(NUITextInputPasswordRules::passwordRulesDescriptorGetter) {
  JS_UNWRAP(UITextInputPasswordRules, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self passwordRulesDescriptor]));
  }
}

