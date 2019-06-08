//
//  NMPMediaItemCollection.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMPMediaItemCollection.h"

NMPMediaItemCollection::NMPMediaItemCollection() {}
NMPMediaItemCollection::~NMPMediaItemCollection() {}

JS_INIT_CLASS(MPMediaItemCollection, MPMediaEntity);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MPMediaItemCollection, MPMediaEntity);
JS_INIT_CLASS_END(MPMediaItemCollection, MPMediaEntity);

NAN_METHOD(NMPMediaItemCollection::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MPMediaItemCollection(...)', turn into construct call.
      JS_SET_RETURN_NEW(MPMediaItemCollection, info);
      return;
    }

    MPMediaItemCollection* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MPMediaItemCollection *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MPMediaItemCollection alloc] init];
    }
    if (self) {
      NMPMediaItemCollection *wrapper = new NMPMediaItemCollection();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MPMediaItemCollection::New: invalid arguments");
    }
  }
}
