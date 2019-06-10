//
//  NAVAudioOutputNode.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioOutputNode.h"

NAVAudioOutputNode::NAVAudioOutputNode() {}
NAVAudioOutputNode::~NAVAudioOutputNode() {}

JS_INIT_CLASS(AVAudioOutputNode, AVAudioIONode);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioOutputNode, AVAudioIONode);
JS_INIT_CLASS_END(AVAudioOutputNode, AVAudioIONode);

NAN_METHOD(NAVAudioOutputNode::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioOutputNode(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioOutputNode, info);
      return;
    }

    AVAudioOutputNode* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioOutputNode *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVAudioOutputNode *wrapper = new NAVAudioOutputNode();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioOutputNode::New: invalid arguments");
    }
  }
}
