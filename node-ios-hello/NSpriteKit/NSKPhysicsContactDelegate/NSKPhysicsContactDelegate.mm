//
//  SKPhysicsContactDelegate.mm
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKPhysicsContactDelegate.h"

NSKPhysicsContactDelegate::NSKPhysicsContactDelegate() {}
NSKPhysicsContactDelegate::~NSKPhysicsContactDelegate() {}

JS_INIT_CLASS(SKPhysicsContactDelegate, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, didBeginContact);
  JS_ASSIGN_PROP(proto, didEndContact);
  // static members (ctor)
  JS_INIT_CTOR(SKPhysicsContactDelegate, NSObject);
JS_INIT_CLASS_END(SKPhysicsContactDelegate, NSObject);

NAN_METHOD(NSKPhysicsContactDelegate::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKPhysicsContactDelegate *ui = new NSKPhysicsContactDelegate();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SSKPhysicsContactDelegate *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SSKPhysicsContactDelegate alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

#include "NSKPhysicsContact.h"

NAN_GETTER(NSKPhysicsContactDelegate::didBeginContactGetter) {
  Nan::HandleScope scope;
  
  Nan::ThrowError("NSKPhysicsContactDelegate::didBeginContactGetter not yet implemented");
}

NAN_SETTER(NSKPhysicsContactDelegate::didBeginContactSetter) {
  Nan::EscapableHandleScope scope;

  NSKPhysicsContactDelegate *wrap = ObjectWrap::Unwrap<NSKPhysicsContactDelegate>(info.This());
  SSKPhysicsContactDelegate* del = wrap->As<SSKPhysicsContactDelegate>();

  wrap->_didBeginContact.Reset(Local<Function>::Cast(value));

  [del setDidBegin: ^ (SKPhysicsContact * _Nonnull contact) {
    Nan::HandleScope scope;
    Local<Value> contactObj = sweetiekit::GetWrapperFor(contact, NSKPhysicsContact::type);
    wrap->_didBeginContact("NSKPhysicsContactDelegate::didBeginContactSetter", contactObj);
  }];
}

NAN_GETTER(NSKPhysicsContactDelegate::didEndContactGetter) {
  Nan::HandleScope scope;

  Nan::ThrowError("NSKPhysicsContactDelegate::didEndContactGetter not yet implemented");
}

NAN_SETTER(NSKPhysicsContactDelegate::didEndContactSetter) {
  Nan::EscapableHandleScope scope;

  NSKPhysicsContactDelegate *wrap = ObjectWrap::Unwrap<NSKPhysicsContactDelegate>(info.This());
  SSKPhysicsContactDelegate* del = wrap->As<SSKPhysicsContactDelegate>();

  wrap->_didEndContact.Reset(Local<Function>::Cast(value));
  
  [del setDidEnd: ^ (SKPhysicsContact * _Nonnull contact) {
    Nan::HandleScope scope;
    Local<Value> contactObj = sweetiekit::GetWrapperFor(contact, NSKPhysicsContact::type);
    wrap->_didEndContact("NSKPhysicsContactDelegate::didEndContactSetter", contactObj);
  }];
}
