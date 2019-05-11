//
//  NAVAudioPlayer.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#include "defines.h"
#include "NNSObject.h"
#include "NAVAudioPlayer.h"

Nan::Persistent<FunctionTemplate> NAVAudioPlayer::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NAVAudioPlayer::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("AVAudioPlayer"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "play", Play);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

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

NAN_METHOD(NAVAudioPlayer::Play) {
  Nan::HandleScope scope;

  JS_UNWRAP(AVAudioPlayer, av);

  [av play];
}

NAVAudioPlayer::NAVAudioPlayer () {}
NAVAudioPlayer::~NAVAudioPlayer () {}
