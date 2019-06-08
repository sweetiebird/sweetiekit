//
//  NMPMediaQuery.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMPMediaQuery.h"

NMPMediaQuery::NMPMediaQuery() {}
NMPMediaQuery::~NMPMediaQuery() {}

JS_INIT_CLASS(MPMediaQuery, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MPMediaQuery, NSObject);
JS_INIT_CLASS_END(MPMediaQuery, NSObject);

NAN_METHOD(NMPMediaQuery::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MPMediaQuery(...)', turn into construct call.
      JS_SET_RETURN_NEW(MPMediaQuery, info);
      return;
    }

    MPMediaQuery* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MPMediaQuery *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MPMediaQuery alloc] init];
    }
    if (self) {
      NMPMediaQuery *wrapper = new NMPMediaQuery();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MPMediaQuery::New: invalid arguments");
    }
  }
}
