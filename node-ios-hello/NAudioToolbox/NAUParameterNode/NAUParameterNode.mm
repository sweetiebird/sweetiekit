//
//  NAUParameterNode.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAUParameterNode.h"

NAUParameterNode::NAUParameterNode() {}
NAUParameterNode::~NAUParameterNode() {}

JS_INIT_CLASS(AUParameterNode, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AUParameterNode, NSObject);
JS_INIT_CLASS_END(AUParameterNode, NSObject);

NAN_METHOD(NAUParameterNode::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AUParameterNode(...)', turn into construct call.
      JS_SET_RETURN_NEW(AUParameterNode, info);
      return;
    }

    AUParameterNode* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AUParameterNode *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AUParameterNode alloc] init];
    }
    if (self) {
      NAUParameterNode *wrapper = new NAUParameterNode();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AUParameterNode::New: invalid arguments");
    }
  }
}
