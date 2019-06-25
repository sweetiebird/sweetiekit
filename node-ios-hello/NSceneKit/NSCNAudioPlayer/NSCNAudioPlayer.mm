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
  JS_ASSIGN_STATIC_METHOD(audioPlayerWithSource);
  JS_ASSIGN_STATIC_METHOD(audioPlayerWithAVAudioNode);
  JS_ASSIGN_PROTO_METHOD(initWithSource);
  JS_ASSIGN_PROTO_METHOD(initWithAVAudioNode);
  JS_ASSIGN_PROTO_PROP(willStartPlayback);
  JS_ASSIGN_PROTO_PROP(didFinishPlayback);
  JS_ASSIGN_PROTO_PROP_READONLY(audioNode);
  JS_ASSIGN_PROTO_PROP_READONLY(audioSource);

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

#include "NSCNAudioSource.h"

NAN_METHOD(NSCNAudioPlayer::audioPlayerWithSource) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNAudioSource, source);
    JS_SET_RETURN(js_value_instancetype([SCNAudioPlayer audioPlayerWithSource: source]));
  }
}

#include "NAVAudioNode.h"

NAN_METHOD(NSCNAudioPlayer::audioPlayerWithAVAudioNode) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, audioNode);
    JS_SET_RETURN(js_value_instancetype([SCNAudioPlayer audioPlayerWithAVAudioNode: audioNode]));
  }
}

NAN_METHOD(NSCNAudioPlayer::initWithSource) {
  JS_UNWRAP_OR_ALLOC(SCNAudioPlayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNAudioSource, source);
    JS_SET_RETURN(js_value_instancetype([self initWithSource: source]));
  }
}

NAN_METHOD(NSCNAudioPlayer::initWithAVAudioNode) {
  JS_UNWRAP_OR_ALLOC(SCNAudioPlayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, audioNode);
    JS_SET_RETURN(js_value_instancetype([self initWithAVAudioNode: audioNode]));
  }
}

NAN_GETTER(NSCNAudioPlayer::willStartPlaybackGetter) {
  JS_UNWRAP(SCNAudioPlayer, self);
  declare_autoreleasepool {
    get_persistent_function(self, callback, @"NSCNAudioPlayer::willStartPlayback");
    if (callback) {
      JS_SET_RETURN([callback jsFunction]->Get());
    }
  }
}

NAN_SETTER(NSCNAudioPlayer::willStartPlaybackSetter) {
  JS_UNWRAP(SCNAudioPlayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(callback, @"NSCNAudioPlayer::willStartPlayback");
    [self setWillStartPlayback:^{
      dispatch_main(^{
        get_persistent_function(self, callback, @"NSCNAudioPlayer::willStartPlayback");
        if (callback) {
          [callback jsFunction]->Call("NSCNAudioPlayer::willStartPlayback");
        }
      });
    }];
  }
}

NAN_GETTER(NSCNAudioPlayer::didFinishPlaybackGetter) {
  JS_UNWRAP(SCNAudioPlayer, self);
  declare_autoreleasepool {
    get_persistent_function(self, callback, @"NSCNAudioPlayer::didFinishPlayback");
    if (callback) {
      JS_SET_RETURN([callback jsFunction]->Get());
    }
  }
}

NAN_SETTER(NSCNAudioPlayer::didFinishPlaybackSetter) {
  JS_UNWRAP(SCNAudioPlayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(callback, @"NSCNAudioPlayer::didFinishPlayback");
    [self setDidFinishPlayback:^{
      dispatch_main(^{
        get_persistent_function(self, callback, @"NSCNAudioPlayer::didFinishPlayback");
        if (callback) {
          [callback jsFunction]->Call("NSCNAudioPlayer::didFinishPlayback");
        }
      });
    }];
  }
}

NAN_GETTER(NSCNAudioPlayer::audioNodeGetter) {
  JS_UNWRAP(SCNAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioNode([self audioNode]));
  }
}

NAN_GETTER(NSCNAudioPlayer::audioSourceGetter) {
  JS_UNWRAP(SCNAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNAudioSource([self audioSource]));
  }
}


