//
//  NUILexiconEntry.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUILexiconEntry.h"

#define instancetype UILexiconEntry
#define js_value_instancetype js_value_UILexiconEntry

NUILexiconEntry::NUILexiconEntry() {}
NUILexiconEntry::~NUILexiconEntry() {}

JS_INIT_CLASS(UILexiconEntry, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(documentText);
  JS_ASSIGN_PROTO_PROP_READONLY(userInput);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UILexiconEntry, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UILexiconEntry, NSObject);

NAN_METHOD(NUILexiconEntry::New) {
  JS_RECONSTRUCT(UILexiconEntry);
  @autoreleasepool {
    UILexiconEntry* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UILexiconEntry *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UILexiconEntry alloc] init];
    }
    if (self) {
      NUILexiconEntry *wrapper = new NUILexiconEntry();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UILexiconEntry::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUILexiconEntry::documentTextGetter) {
  JS_UNWRAP(UILexiconEntry, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self documentText]));
  }
}

NAN_GETTER(NUILexiconEntry::userInputGetter) {
  JS_UNWRAP(UILexiconEntry, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self userInput]));
  }
}
