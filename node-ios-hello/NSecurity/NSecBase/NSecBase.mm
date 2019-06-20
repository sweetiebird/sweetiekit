//
//  NSecBase.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSecBase.h"

#define instancetype SecBase
#define js_value_instancetype js_value_SecBase

NSecBase::NSecBase() {}
NSecBase::~NSecBase() {}

JS_INIT_CLASS(SecBase, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SecBase, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(SecBase, NSObject);

NAN_METHOD(NSecBase::New) {
  JS_RECONSTRUCT(SecBase);
  @autoreleasepool {
    SecBase* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SecBase *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SecBase alloc] init];
    }
    if (self) {
      NSecBase *wrapper = new NSecBase();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SecBase::New: invalid arguments");
    }
  }
}

@implementation SecBase
@end
