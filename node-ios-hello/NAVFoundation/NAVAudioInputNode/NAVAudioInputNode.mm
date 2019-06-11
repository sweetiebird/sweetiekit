//
//  NAVAudioInputNode.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioInputNode.h"

NAVAudioInputNode::NAVAudioInputNode() {}
NAVAudioInputNode::~NAVAudioInputNode() {}

JS_INIT_CLASS(AVAudioInputNode, AVAudioIONode);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioInputNode, AVAudioIONode);
JS_INIT_CLASS_END(AVAudioInputNode, AVAudioIONode);

NAN_METHOD(NAVAudioInputNode::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioInputNode(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioInputNode, info);
      return;
    }

    AVAudioInputNode* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioInputNode *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVAudioInputNode *wrapper = new NAVAudioInputNode();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioInputNode::New: invalid arguments");
    }
  }
}
