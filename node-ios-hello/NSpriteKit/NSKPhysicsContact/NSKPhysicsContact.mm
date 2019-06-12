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
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, bodyA);
  JS_ASSIGN_PROP_READONLY(proto, bodyB);
  // static members (ctor)
  JS_INIT_CTOR(SKPhysicsContact, NSObject);
JS_INIT_CLASS_END(SKPhysicsContact, NSObject);

NAN_METHOD(NSKPhysicsContact::New) {
  JS_RECONSTRUCT(SKPhysicsContact);

  Local<Object> obj = info.This();

  NSKPhysicsContact *ui = new NSKPhysicsContact();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SKPhysicsContact *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SKPhysicsContact alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

#include "NSKPhysicsBody.h"

NAN_GETTER(NSKPhysicsContact::bodyAGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(SKPhysicsContact, con);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([con bodyA], NSKPhysicsBody::type));
}

NAN_GETTER(NSKPhysicsContact::bodyBGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(SKPhysicsContact, con);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([con bodyB], NSKPhysicsBody::type));
}

