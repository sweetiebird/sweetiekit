//
//  NSCNAudioPlayer.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNAudioPlayer.h"

#define instancetype SCNAudioPlayer
#define js_value_instancetype js_value_SCNAudioPlayer

NSCNAudioPlayer::NSCNAudioPlayer() {}
NSCNAudioPlayer::~NSCNAudioPlayer() {}

JS_INIT_CLASS(SCNAudioPlayer, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNAudioPlayer, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(SCNAudioPlayer, NSObject);

NAN_METHOD(NSCNAudioPlayer::New) {
  JS_RECONSTRUCT(SCNAudioPlayer);
  @autoreleasepool {
    SCNAudioPlayer* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNAudioPlayer *)(info[0].As<External>()->Value());
    }
    if (self) {
      NSCNAudioPlayer *wrapper = new NSCNAudioPlayer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNAudioPlayer::New: invalid arguments");
    }
  }
}
