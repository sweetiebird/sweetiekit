//
//  NAVAudioSessionChannelDescription.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioSessionChannelDescription.h"

NAVAudioSessionChannelDescription::NAVAudioSessionChannelDescription() {}
NAVAudioSessionChannelDescription::~NAVAudioSessionChannelDescription() {}

JS_INIT_CLASS(AVAudioSessionChannelDescription, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP_READONLY(channelName);
  JS_ASSIGN_PROTO_PROP_READONLY(owningPortUID);
  JS_ASSIGN_PROTO_PROP_READONLY(channelNumber);
  JS_ASSIGN_PROTO_PROP_READONLY(channelLabel);
  // static members (ctor)
  JS_INIT_CTOR(AVAudioSessionChannelDescription, NSObject);
JS_INIT_CLASS_END(AVAudioSessionChannelDescription, NSObject);

NAN_METHOD(NAVAudioSessionChannelDescription::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioSessionChannelDescription(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioSessionChannelDescription, info);
      return;
    }

    AVAudioSessionChannelDescription* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioSessionChannelDescription *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioSessionChannelDescription alloc] init];
    }
    if (self) {
      NAVAudioSessionChannelDescription *wrapper = new NAVAudioSessionChannelDescription();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioSessionChannelDescription::New: invalid arguments");
    }
  }
}


NAN_GETTER(NAVAudioSessionChannelDescription::channelNameGetter) {
  JS_UNWRAP(AVAudioSessionChannelDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self channelName]));
  }
}

NAN_GETTER(NAVAudioSessionChannelDescription::owningPortUIDGetter) {
  JS_UNWRAP(AVAudioSessionChannelDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self owningPortUID]));
  }
}

NAN_GETTER(NAVAudioSessionChannelDescription::channelNumberGetter) {
  JS_UNWRAP(AVAudioSessionChannelDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self channelNumber]));
  }
}

#include "NAVAudioSession.h"

NAN_GETTER(NAVAudioSessionChannelDescription::channelLabelGetter) {
  JS_UNWRAP(AVAudioSessionChannelDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AudioChannelLabel([self channelLabel]));
  }
}
