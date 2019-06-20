//
//  NUIDictationPhrase.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIDictationPhrase.h"

#define instancetype UIDictationPhrase
#define js_value_instancetype js_value_UIDictationPhrase

NUIDictationPhrase::NUIDictationPhrase() {}
NUIDictationPhrase::~NUIDictationPhrase() {}

JS_INIT_CLASS(UIDictationPhrase, NSObject);
  // UIDictationPhrase
  JS_ASSIGN_PROTO_PROP_READONLY(text);
  JS_ASSIGN_PROTO_PROP_READONLY(alternativeInterpretations);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIDictationPhrase, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UIDictationPhrase, NSObject);

NAN_METHOD(NUIDictationPhrase::New) {
  JS_RECONSTRUCT(UIDictationPhrase);
  @autoreleasepool {
    UIDictationPhrase* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIDictationPhrase *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIDictationPhrase alloc] init];
    }
    if (self) {
      NUIDictationPhrase *wrapper = new NUIDictationPhrase();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIDictationPhrase::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUIDictationPhrase::textGetter) {
  JS_UNWRAP(UIDictationPhrase, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self text]));
  }
}

NAN_GETTER(NUIDictationPhrase::alternativeInterpretationsGetter) {
  JS_UNWRAP(UIDictationPhrase, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self alternativeInterpretations]));
  }
}
