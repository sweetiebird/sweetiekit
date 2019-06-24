//
//  NSCNPhysicsShape.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNPhysicsShape.h"

#define instancetype SCNPhysicsShape
#define js_value_instancetype js_value_SCNPhysicsShape

NSCNPhysicsShape::NSCNPhysicsShape() {}
NSCNPhysicsShape::~NSCNPhysicsShape() {}

JS_INIT_CLASS(SCNPhysicsShape, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNPhysicsShape, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(SCNPhysicsShape, NSObject);

NAN_METHOD(NSCNPhysicsShape::New) {
  JS_RECONSTRUCT(SCNPhysicsShape);
  @autoreleasepool {
    SCNPhysicsShape* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNPhysicsShape *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNPhysicsShape alloc] init];
    }
    if (self) {
      NSCNPhysicsShape *wrapper = new NSCNPhysicsShape();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNPhysicsShape::New: invalid arguments");
    }
  }
}
