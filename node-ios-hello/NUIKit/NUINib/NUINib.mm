//
//  NUINib.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUINib.h"

NUINib::NUINib() {}
NUINib::~NUINib() {}

JS_INIT_CLASS(UINib, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UINib, NSObject);
JS_INIT_CLASS_END(UINib, NSObject);

NAN_METHOD(NUINib::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUINib *nib = new NUINib();

  if (info[0]->IsExternal()) {
    nib->SetNSObject((__bridge UINib *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    std::string name;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      name = *utf8Value;
    } else {
      Nan::ThrowError("invalid argument");
    }
    @autoreleasepool {
      NSString *nibName = [NSString stringWithUTF8String:name.c_str()];
      nib->SetNSObject([UINib nibWithNibName:nibName bundle:nullptr]);
    }
  } else {
    @autoreleasepool {
      nib->SetNSObject([[UINib alloc] init]);
    }
  }
  nib->Wrap(obj);

  JS_SET_RETURN(obj);
}
