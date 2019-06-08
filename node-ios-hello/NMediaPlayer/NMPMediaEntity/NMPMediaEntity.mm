//
//  NMPMediaEntity.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMPMediaEntity.h"

NMPMediaEntity::NMPMediaEntity() {}
NMPMediaEntity::~NMPMediaEntity() {}

JS_INIT_CLASS(MPMediaEntity, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MPMediaEntity, NSObject);
JS_INIT_CLASS_END(MPMediaEntity, NSObject);

NAN_METHOD(NMPMediaEntity::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MPMediaEntity(...)', turn into construct call.
      JS_SET_RETURN_NEW(MPMediaEntity, info);
      return;
    }

    MPMediaEntity* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MPMediaEntity *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MPMediaEntity alloc] init];
    }
    if (self) {
      NMPMediaEntity *wrapper = new NMPMediaEntity();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MPMediaEntity::New: invalid arguments");
    }
  }
}
