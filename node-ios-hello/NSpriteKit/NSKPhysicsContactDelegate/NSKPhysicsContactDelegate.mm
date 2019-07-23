//
//  SKPhysicsContactDelegate.mm
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKPhysicsContactDelegate.h"

#define instancetype SKPhysicsContactDelegate
#define js_value_instancetype js_value_SKPhysicsContactDelegate

NSKPhysicsContactDelegate::NSKPhysicsContactDelegate() {}
NSKPhysicsContactDelegate::~NSKPhysicsContactDelegate() {}

JS_INIT_CLASS(SKPhysicsContactDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(didBeginContact);
  JS_ASSIGN_PROTO_PROP(didEndContact);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKPhysicsContactDelegate, NSObject);
JS_INIT_CLASS_END(SKPhysicsContactDelegate, NSObject);

NAN_METHOD(NSKPhysicsContactDelegate::New) {
  JS_RECONSTRUCT(SKPhysicsContactDelegate);
  @autoreleasepool {
    SKPhysicsContactDelegate* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SKPhysicsContactDelegate *)(info[0].As<External>()->Value());
    } else if (info[0]->IsObject()) {
      Local<Value> that(JS_NEW(NSKPhysicsContactDelegate, 0, nullptr));
      sweetiekit::JSFunction objectAssign(JS_OBJ(JS_GLOBAL()->Get(JS_STR("Object")))->Get(JS_STR("assign")));
      objectAssign("NSKPhysicsContactDelegate::New", that, info[0]);
      JS_SET_RETURN(that);
      return;
    } else if (info.Length() <= 0) {
      self = [[SKPhysicsContactDelegate alloc] init];
    }
    if (self) {
      NSKPhysicsContactDelegate *wrapper = new NSKPhysicsContactDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SKPhysicsContactDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROP(SKPhysicsContactDelegate, didBeginContact);
DELEGATE_PROP(SKPhysicsContactDelegate, didEndContact);

#include "NSKPhysicsContact.h"

@implementation SKPhysicsContactDelegate
- (void)didBeginContact:(SKPhysicsContact *)contact
{
  call_delegate_async(noop(), didBeginContact,
    js_value_SKPhysicsContact(contact));
}

- (void)didEndContact:(SKPhysicsContact *)contact
{
  call_delegate_async(noop(), didEndContact,
    js_value_SKPhysicsContact(contact));
}
@end
