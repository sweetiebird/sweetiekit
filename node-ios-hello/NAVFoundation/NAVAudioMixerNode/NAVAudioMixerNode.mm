//
//  NAVAudioMixerNode.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioMixerNode.h"

NAVAudioMixerNode::NAVAudioMixerNode() {}
NAVAudioMixerNode::~NAVAudioMixerNode() {}

JS_INIT_CLASS(AVAudioMixerNode, AVAudioIONode);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioMixerNode, AVAudioIONode);
JS_INIT_CLASS_END(AVAudioMixerNode, AVAudioIONode);

NAN_METHOD(NAVAudioMixerNode::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioMixerNode(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioMixerNode, info);
      return;
    }

    AVAudioMixerNode* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioMixerNode *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioMixerNode alloc] init];
    }
    if (self) {
      NAVAudioMixerNode *wrapper = new NAVAudioMixerNode();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioMixerNode::New: invalid arguments");
    }
  }
}
