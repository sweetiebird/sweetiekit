//
//  NMPMusicPlayerQueueDescriptor.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMPMusicPlayerQueueDescriptor.h"

NMPMusicPlayerQueueDescriptor::NMPMusicPlayerQueueDescriptor() {}
NMPMusicPlayerQueueDescriptor::~NMPMusicPlayerQueueDescriptor() {}

JS_INIT_CLASS(MPMusicPlayerQueueDescriptor, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MPMusicPlayerQueueDescriptor, NSObject);
JS_INIT_CLASS_END(MPMusicPlayerQueueDescriptor, NSObject);

NAN_METHOD(NMPMusicPlayerQueueDescriptor::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MPMusicPlayerQueueDescriptor(...)', turn into construct call.
      JS_SET_RETURN_NEW(MPMusicPlayerQueueDescriptor, info);
      return;
    }

    MPMusicPlayerQueueDescriptor* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MPMusicPlayerQueueDescriptor *)(info[0].As<External>()->Value());
    }
    if (self) {
      NMPMusicPlayerQueueDescriptor *wrapper = new NMPMusicPlayerQueueDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MPMusicPlayerQueueDescriptor::New: invalid arguments");
    }
  }
}
