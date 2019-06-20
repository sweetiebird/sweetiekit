//
//  NUILexicon.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUILexicon.h"

#define instancetype UILexicon
#define js_value_instancetype js_value_UILexicon

NUILexicon::NUILexicon() {}
NUILexicon::~NUILexicon() {}

JS_INIT_CLASS(UILexicon, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(entries);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UILexicon, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UILexicon, NSObject);

NAN_METHOD(NUILexicon::New) {
  JS_RECONSTRUCT(UILexicon);
  @autoreleasepool {
    UILexicon* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UILexicon *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UILexicon alloc] init];
    }
    if (self) {
      NUILexicon *wrapper = new NUILexicon();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UILexicon::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUILexicon::entriesGetter) {
  JS_UNWRAP(UILexicon, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UILexiconEntry*>([self entries]));
  }
}
