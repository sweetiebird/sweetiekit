//
//  SKPhysicsContact.mm
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKPhysicsContact.h"

NSKPhysicsContact::NSKPhysicsContact() {}
NSKPhysicsContact::~NSKPhysicsContact() {}

JS_INIT_CLASS(SKPhysicsContact, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(bodyA);
  JS_ASSIGN_PROTO_PROP_READONLY(bodyB);
  JS_ASSIGN_PROTO_PROP_READONLY(contactPoint);
  JS_ASSIGN_PROTO_PROP_READONLY(contactNormal);
  JS_ASSIGN_PROTO_PROP_READONLY(collisionImpulse);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKPhysicsContact, NSObject);
JS_INIT_CLASS_END(SKPhysicsContact, NSObject);

NAN_METHOD(NSKPhysicsContact::New) {
  JS_RECONSTRUCT(SKPhysicsContact);
  @autoreleasepool {
    SKPhysicsContact* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SKPhysicsContact *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SKPhysicsContact alloc] init];
    }
    if (self) {
      NSKPhysicsContact *wrapper = new NSKPhysicsContact();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SKPhysicsContact::New: invalid arguments");
    }
  }
}

#include "NSKPhysicsBody.h"

NAN_GETTER(NSKPhysicsContact::bodyAGetter) {
  JS_UNWRAP(SKPhysicsContact, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKPhysicsBody([self bodyA]));
  }
}

NAN_GETTER(NSKPhysicsContact::bodyBGetter) {
  JS_UNWRAP(SKPhysicsContact, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKPhysicsBody([self bodyB]));
  }
}

NAN_GETTER(NSKPhysicsContact::contactPointGetter) {
  JS_UNWRAP(SKPhysicsContact, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self contactPoint]));
  }
}

NAN_GETTER(NSKPhysicsContact::contactNormalGetter) {
  JS_UNWRAP(SKPhysicsContact, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGVector([self contactNormal]));
  }
}

NAN_GETTER(NSKPhysicsContact::collisionImpulseGetter) {
  JS_UNWRAP(SKPhysicsContact, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self collisionImpulse]));
  }
}
