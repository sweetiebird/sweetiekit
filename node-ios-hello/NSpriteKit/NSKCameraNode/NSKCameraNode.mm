//
//  SKCameraNode.mm
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKCameraNode.h"

NSKCameraNode::NSKCameraNode() {}
NSKCameraNode::~NSKCameraNode() {}

JS_INIT_CLASS(SKCameraNode, SKNode);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKCameraNode, SKNode);
JS_INIT_CLASS_END(SKCameraNode, SKNode);

NAN_METHOD(NSKCameraNode::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKCameraNode *ui = new NSKCameraNode();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SKCameraNode *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SKCameraNode alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}
