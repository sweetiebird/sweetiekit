//
//  SKPhysicsContactDelegate.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NSKPhysicsContactDelegate.h"
#include "NSKPhysicsContact.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NSKPhysicsContactDelegate::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSKPhysicsContactDelegate::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SKPhysicsContactDelegate"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, didBeginContact);
  JS_ASSIGN_PROP(proto, didEndContact);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

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

NSKPhysicsContactDelegate::NSKPhysicsContactDelegate () {}
NSKPhysicsContactDelegate::~NSKPhysicsContactDelegate () {}

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
  
  Nan::ThrowError("NSKPhysicsContactDelegate::didBeginContactGetter not yet implemented");
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
