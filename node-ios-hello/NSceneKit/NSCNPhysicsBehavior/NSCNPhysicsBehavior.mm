//
//  NSCNPhysicsBehavior.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNPhysicsBehavior.h"

#define instancetype SCNPhysicsBehavior
#define js_value_instancetype js_value_SCNPhysicsBehavior

NSCNPhysicsBehavior::NSCNPhysicsBehavior() {}
NSCNPhysicsBehavior::~NSCNPhysicsBehavior() {}

JS_INIT_CLASS(SCNPhysicsBehavior, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNPhysicsBehavior, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(SCNPhysicsBehavior, NSObject);

NAN_METHOD(NSCNPhysicsBehavior::New) {
  JS_RECONSTRUCT(SCNPhysicsBehavior);
  @autoreleasepool {
    SCNPhysicsBehavior* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNPhysicsBehavior *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNPhysicsBehavior alloc] init];
    }
    if (self) {
      NSCNPhysicsBehavior *wrapper = new NSCNPhysicsBehavior();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNPhysicsBehavior::New: invalid arguments");
    }
  }
}
