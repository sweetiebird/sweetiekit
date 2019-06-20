//
//  NUITextRange.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITextRange.h"

#define instancetype UITextRange
#define js_value_instancetype js_value_UITextRange

NUITextRange::NUITextRange() {}
NUITextRange::~NUITextRange() {}

JS_INIT_CLASS(UITextRange, NSObject);
// UITextRange
  JS_ASSIGN_PROTO_PROP_READONLY(isEmpty);
  JS_ASSIGN_PROTO_PROP_READONLY(start);
  JS_ASSIGN_PROTO_PROP_READONLY(end);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITextRange, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UITextRange, NSObject);

NAN_METHOD(NUITextRange::New) {
  JS_RECONSTRUCT(UITextRange);
  @autoreleasepool {
    UITextRange* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITextRange *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITextRange alloc] init];
    }
    if (self) {
      NUITextRange *wrapper = new NUITextRange();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITextRange::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUITextRange::isEmptyGetter) {
  JS_UNWRAP(UITextRange, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEmpty]));
  }
}

#include "NUITextPosition.h"

NAN_GETTER(NUITextRange::startGetter) {
  JS_UNWRAP(UITextRange, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextPosition([self start]));
  }
}

NAN_GETTER(NUITextRange::endGetter) {
  JS_UNWRAP(UITextRange, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextPosition([self end]));
  }
}
