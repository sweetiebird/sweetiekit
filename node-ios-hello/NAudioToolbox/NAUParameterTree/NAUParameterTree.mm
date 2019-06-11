//
//  NAUParameterTree.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAUParameterTree.h"

NAUParameterTree::NAUParameterTree() {}
NAUParameterTree::~NAUParameterTree() {}

JS_INIT_CLASS(AUParameterTree, AUParameterGroup);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AUParameterTree, AUParameterGroup);
JS_INIT_CLASS_END(AUParameterTree, AUParameterGroup);

NAN_METHOD(NAUParameterTree::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AUParameterTree(...)', turn into construct call.
      JS_SET_RETURN_NEW(AUParameterTree, info);
      return;
    }

    AUParameterTree* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AUParameterTree *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AUParameterTree alloc] init];
    }
    if (self) {
      NAUParameterTree *wrapper = new NAUParameterTree();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AUParameterTree::New: invalid arguments");
    }
  }
}
