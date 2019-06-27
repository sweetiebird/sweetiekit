//
//  NAVAudioEnvironmentNode.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioEnvironmentNode.h"

#define instancetype AVAudioEnvironmentNode
#define js_value_instancetype js_value_AVAudioEnvironmentNode

NAVAudioEnvironmentNode::NAVAudioEnvironmentNode() {}
NAVAudioEnvironmentNode::~NAVAudioEnvironmentNode() {}

JS_INIT_CLASS(AVAudioEnvironmentNode, AVAudioMixing);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioEnvironmentNode, AVAudioMixing);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, AVAudioEnvironmentDistanceAttenuationModel) {
    JS_ASSIGN_ENUM(AVAudioEnvironmentDistanceAttenuationModelExponential, NSInteger); //    = 1,
    JS_ASSIGN_ENUM(AVAudioEnvironmentDistanceAttenuationModelInverse, NSInteger); //        = 2,
    JS_ASSIGN_ENUM(AVAudioEnvironmentDistanceAttenuationModelLinear, NSInteger); //         = 3
  //} NS_ENUM_AVAILABLE(10_10, 8_0);

JS_INIT_CLASS_END(AVAudioEnvironmentNode, AVAudioMixing);

NAN_METHOD(NAVAudioEnvironmentNode::New) {
  JS_RECONSTRUCT(AVAudioEnvironmentNode);
  @autoreleasepool {
    AVAudioEnvironmentNode* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioEnvironmentNode *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioEnvironmentNode alloc] init];
    }
    if (self) {
      NAVAudioEnvironmentNode *wrapper = new NAVAudioEnvironmentNode();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioEnvironmentNode::New: invalid arguments");
    }
  }
}
