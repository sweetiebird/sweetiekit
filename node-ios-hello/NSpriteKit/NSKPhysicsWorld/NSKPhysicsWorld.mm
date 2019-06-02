//
//  SKPhysicsWorld.mm
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKPhysicsWorld.h"

NSKPhysicsWorld::NSKPhysicsWorld() {}
NSKPhysicsWorld::~NSKPhysicsWorld() {}

JS_INIT_CLASS(SKPhysicsWorld, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, gravity);
  JS_ASSIGN_PROP(proto, speed);
  JS_ASSIGN_PROP(proto, contactDelegate);
  // static members (ctor)
  JS_INIT_CTOR(SKPhysicsWorld, NSObject);
JS_INIT_CLASS_END(SKPhysicsWorld, NSObject);

NAN_METHOD(NSKPhysicsWorld::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKPhysicsWorld *ui = new NSKPhysicsWorld();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SKPhysicsWorld *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SKPhysicsWorld alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_GETTER(NSKPhysicsWorld::gravityGetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGVector([self gravity]));
    return;
  }
}

NAN_SETTER(NSKPhysicsWorld::gravitySetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  @autoreleasepool
  {
    [self setGravity: to_value_CGVector(value)];
  }
}

NAN_GETTER(NSKPhysicsWorld::speedGetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self speed]));
    return;
  }
}

NAN_SETTER(NSKPhysicsWorld::speedSetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  @autoreleasepool
  {
    [self setSpeed: TO_FLOAT(value)];
  }
}

#include "NSKPhysicsContactDelegate.h"

NAN_GETTER(NSKPhysicsWorld::contactDelegateGetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKPhysicsContactDelegate([self contactDelegate]));
    return;
  }
}

NAN_SETTER(NSKPhysicsWorld::contactDelegateSetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  @autoreleasepool
  {
    [self setContactDelegate: to_value_SKPhysicsContactDelegate(value)];
  }
}
