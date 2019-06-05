//
//  NAVAudioPlayer.m
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#include "defines.h"
#include "NNSObject.h"
#include "NAVAudioPlayer.h"

NAVAudioPlayer::NAVAudioPlayer () {}
NAVAudioPlayer::~NAVAudioPlayer () {}

JS_INIT_CLASS(AVAudioPlayer, NSObject);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, play);
  
  // static members (ctor)
  JS_INIT_CTOR(AVAudioPlayer, NSObject);
  
JS_INIT_CLASS_END(AVAudioPlayer, NSObject);

NAN_METHOD(NAVAudioPlayer::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NAVAudioPlayer *av = new NAVAudioPlayer();

  if (info[0]->IsExternal()) {
    av->SetNSObject((__bridge AVAudioPlayer *)(info[0].As<External>()->Value()));
  } else {
    std::string path;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      path = *utf8Value;
    } else {
      Nan::ThrowError("NNSBundle::PathForResource: invalid argument resource");
    }
    @autoreleasepool {
      NSURL *url = [[NSURL alloc] initFileURLWithPath:[NSString stringWithUTF8String:path.c_str()]];
      av->SetNSObject([[AVAudioPlayer alloc] initWithContentsOfURL:url error:nullptr]);
    }
  }

  av->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_METHOD(NAVAudioPlayer::play) {
  Nan::HandleScope scope;

  JS_UNWRAP(AVAudioPlayer, av);

  [av play];
}
