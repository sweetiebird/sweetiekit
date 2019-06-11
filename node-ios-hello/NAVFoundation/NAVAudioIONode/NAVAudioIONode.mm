//
//  NAVAudioIONode.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioIONode.h"

NAVAudioIONode::NAVAudioIONode() {}
NAVAudioIONode::~NAVAudioIONode() {}

JS_INIT_CLASS(AVAudioIONode, AVAudioNode);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioIONode, AVAudioNode);
JS_INIT_CLASS_END(AVAudioIONode, AVAudioNode);

NAN_METHOD(NAVAudioIONode::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioIONode(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioIONode, info);
      return;
    }

    AVAudioIONode* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioIONode *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioIONode alloc] init];
    }
    if (self) {
      NAVAudioIONode *wrapper = new NAVAudioIONode();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioIONode::New: invalid arguments");
    }
  }
}
