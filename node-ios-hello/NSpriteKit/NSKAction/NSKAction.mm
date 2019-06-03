//
//  SKAction.mm
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKAction.h"

NSKAction::NSKAction() {}
NSKAction::~NSKAction() {}

JS_INIT_CLASS(SKAction, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKAction, NSObject);
  JS_ASSIGN_METHOD(ctor, moveTo);
  JS_ASSIGN_METHOD(ctor, removeFromParent);
  JS_ASSIGN_METHOD(ctor, sequence);
  JS_ASSIGN_METHOD(ctor, waitForDuration);
  JS_ASSIGN_METHOD(ctor, moveBy);
  JS_ASSIGN_METHOD(ctor, scaleBy);
  JS_ASSIGN_METHOD(ctor, group);
JS_INIT_CLASS_END(SKAction, NSObject);

NAN_METHOD(NSKAction::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKAction *ui = new NSKAction();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SKAction *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SKAction alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

// creates an action that will move to a point over time
NAN_METHOD(NSKAction::moveTo) {
  JS_SET_RETURN_EXTERNAL(SKAction,
    [SKAction moveTo:to_value_CGPoint(info[0]) duration:to_value_NSTimeInterval(info[1])]);
}

// creates an action that removes a node from its parent
NAN_METHOD(NSKAction::removeFromParent) {
  JS_SET_RETURN_EXTERNAL(SKAction,
    [SKAction removeFromParent]);
}

// creates an action that runs a collection of actions sequentially
NAN_METHOD(NSKAction::sequence) {
  JS_SET_RETURN_EXTERNAL(SKAction,
    [SKAction sequence:to_value_NSArray<SKAction*>(info[0])]);
}

// creates an action that idles for a specified period of time
NAN_METHOD(NSKAction::waitForDuration) {
  if (info.Length() >= 2) {
    JS_SET_RETURN_EXTERNAL(SKAction,
      [SKAction waitForDuration:to_value_NSTimeInterval(info[0])]);
  } else {
    JS_SET_RETURN_EXTERNAL(SKAction,
      [SKAction waitForDuration:to_value_NSTimeInterval(info[0])
                withRange:to_value_NSTimeInterval(info[1])]);
  }
}

// creates an action that moves a node relative to its current position
NAN_METHOD(NSKAction::moveBy) {
  if (info.Length() >= 3) {
    JS_SET_RETURN_EXTERNAL(SKAction,
      [SKAction moveByX:to_value_CGFloat(info[0])
                y:to_value_CGFloat(info[1])
                duration:to_value_NSTimeInterval(info[2])]);
  } else {
    JS_SET_RETURN_EXTERNAL(SKAction,
      [SKAction moveBy:to_value_CGVector(info[0])
                duration:to_value_NSTimeInterval(info[1])]);
  }
}

// creates an action that changes the x and y scale values of a node by a relative value
NAN_METHOD(NSKAction::scaleBy) {
  if (info.Length() >= 3) {
    JS_SET_RETURN_EXTERNAL(SKAction,
      [SKAction scaleXBy:to_value_CGFloat(info[0])
                y:to_value_CGFloat(info[1])
                duration:to_value_NSTimeInterval(info[2])]);
  } else {
    JS_SET_RETURN_EXTERNAL(SKAction,
      [SKAction scaleBy:to_value_CGFloat(info[0])
                duration:to_value_NSTimeInterval(info[1])]);
  }
}

// creates an action that runs a collection of actions in parallel
NAN_METHOD(NSKAction::group) {
  JS_SET_RETURN_EXTERNAL(SKAction,
    [SKAction group:to_value_NSArray<SKAction *>(info[0])]);
}
