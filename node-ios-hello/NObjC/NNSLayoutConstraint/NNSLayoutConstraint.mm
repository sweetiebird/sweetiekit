//
//  NNSLayoutConstraint.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NNSObject.h"
#include "NNSLayoutConstraint.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NNSLayoutConstraint::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NNSLayoutConstraint::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("NSLayoutConstraint"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "isActive", IsActive);
  JS_SET_PROP(proto, "priority", Priority);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Nan::SetMethod(ctorFn, "activateConstraints", ActivateConstraints);
  Nan::SetMethod(ctorFn, "deactivateConstraints", DeactivateConstraints);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NNSLayoutConstraint::NNSLayoutConstraint () {}
NNSLayoutConstraint::~NNSLayoutConstraint () {}

NAN_METHOD(NNSLayoutConstraint::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NNSLayoutConstraint *lc = new NNSLayoutConstraint();

  if (info[0]->IsExternal()) {
    lc->SetNSObject((__bridge NSLayoutConstraint *)(info[0].As<External>()->Value()));
  } else {
    // error
  }
  lc->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_GETTER(NNSLayoutConstraint::IsActiveGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(NSLayoutConstraint, constraint);

  JS_SET_RETURN(JS_BOOL([constraint isActive]));
}

NAN_SETTER(NNSLayoutConstraint::IsActiveSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(NSLayoutConstraint, constraint);
  
  [constraint setActive:TO_BOOL(value)];
}

NAN_GETTER(NNSLayoutConstraint::PriorityGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(NSLayoutConstraint, constraint);

  JS_SET_RETURN(JS_NUM([constraint priority]));
}

NAN_SETTER(NNSLayoutConstraint::PrioritySetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(NSLayoutConstraint, constraint);
  
  float priority = TO_FLOAT(value);
  
  [constraint setPriority:priority];
}

NAN_METHOD(NNSLayoutConstraint::ActivateConstraints) {
  Nan::HandleScope scope;

  NSMutableArray* constraints = [[NSMutableArray alloc] init];

  if (info[0]->IsObject()) {
    Local<Object> object = JS_OBJ(info[0]);
    MaybeLocal<Array> maybe_props = object->GetOwnPropertyNames(JS_CONTEXT());
    if (!maybe_props.IsEmpty()) {
      Local<Array> props = maybe_props.ToLocalChecked();
      for (uint32_t i=0; i < props->Length(); i++) {
        Local<Value> key = props->Get(i);
        Local<Value> value = object->Get(key);
        JS_UNWRAPPED(JS_OBJ(value), NSLayoutConstraint, c);
        [constraints addObject:c];
      }
    }

    [NSLayoutConstraint activateConstraints:constraints];
  }
}

NAN_METHOD(NNSLayoutConstraint::DeactivateConstraints) {
  Nan::HandleScope scope;

  NSMutableArray* constraints = [[NSMutableArray alloc] init];

  if (info[0]->IsObject()) {
    Local<Object> object = JS_OBJ(info[0]);
    MaybeLocal<Array> maybe_props = object->GetOwnPropertyNames(JS_CONTEXT());
    if (!maybe_props.IsEmpty()) {
      Local<Array> props = maybe_props.ToLocalChecked();
      for (uint32_t i=0; i < props->Length(); i++) {
        Local<Value> key = props->Get(i);
        Local<Value> value = object->Get(key);
        JS_UNWRAPPED(JS_OBJ(value), NSLayoutConstraint, c);
        [constraints addObject:c];
      }
    }

    [NSLayoutConstraint deactivateConstraints:constraints];
  }
}
