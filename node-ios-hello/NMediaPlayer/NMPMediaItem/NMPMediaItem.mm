//
//  NMPMediaItem.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMPMediaItem.h"

NMPMediaItem::NMPMediaItem() {}
NMPMediaItem::~NMPMediaItem() {}

JS_INIT_CLASS(MPMediaItem, MPMediaEntity);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MPMediaItem, MPMediaEntity);
JS_INIT_CLASS_END(MPMediaItem, MPMediaEntity);

NAN_METHOD(NMPMediaItem::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MPMediaItem(...)', turn into construct call.
      JS_SET_RETURN_NEW(MPMediaItem, info);
      return;
    }

    MPMediaItem* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MPMediaItem *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MPMediaItem alloc] init];
    }
    if (self) {
      NMPMediaItem *wrapper = new NMPMediaItem();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MPMediaItem::New: invalid arguments");
    }
  }
}
