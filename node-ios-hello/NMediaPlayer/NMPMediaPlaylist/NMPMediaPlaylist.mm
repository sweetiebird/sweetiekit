//
//  NMPMediaPlaylist.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMPMediaPlaylist.h"

NMPMediaPlaylist::NMPMediaPlaylist() {}
NMPMediaPlaylist::~NMPMediaPlaylist() {}

JS_INIT_CLASS(MPMediaPlaylist, MPMediaItemCollection);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MPMediaPlaylist, MPMediaItemCollection);
JS_INIT_CLASS_END(MPMediaPlaylist, MPMediaItemCollection);

NAN_METHOD(NMPMediaPlaylist::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MPMediaPlaylist(...)', turn into construct call.
      JS_SET_RETURN_NEW(MPMediaPlaylist, info);
      return;
    }

    MPMediaPlaylist* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MPMediaPlaylist *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MPMediaPlaylist alloc] init];
    }
    if (self) {
      NMPMediaPlaylist *wrapper = new NMPMediaPlaylist();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MPMediaPlaylist::New: invalid arguments");
    }
  }
}
