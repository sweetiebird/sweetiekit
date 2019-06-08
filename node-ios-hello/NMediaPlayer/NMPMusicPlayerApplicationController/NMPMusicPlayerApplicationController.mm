//
//  NMPMusicPlayerApplicationController.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMPMusicPlayerApplicationController.h"

NMPMusicPlayerApplicationController::NMPMusicPlayerApplicationController() {}
NMPMusicPlayerApplicationController::~NMPMusicPlayerApplicationController() {}

JS_INIT_CLASS(MPMusicPlayerApplicationController, MPMusicPlayerController);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MPMusicPlayerApplicationController, MPMusicPlayerController);
JS_INIT_CLASS_END(MPMusicPlayerApplicationController, MPMusicPlayerController);

NAN_METHOD(NMPMusicPlayerApplicationController::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MPMusicPlayerApplicationController(...)', turn into construct call.
      JS_SET_RETURN_NEW(MPMusicPlayerApplicationController, info);
      return;
    }

    MPMusicPlayerApplicationController* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MPMusicPlayerApplicationController *)(info[0].As<External>()->Value());
    }
    if (self) {
      NMPMusicPlayerApplicationController *wrapper = new NMPMusicPlayerApplicationController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MPMusicPlayerApplicationController::New: invalid arguments");
    }
  }
}
