//
//  NNSLayoutAnchor.mm
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSLayoutAnchor.h"
#include "NNSLayoutConstraint.h"

NNSLayoutAnchor::NNSLayoutAnchor () {}
NNSLayoutAnchor::~NNSLayoutAnchor () {}

Nan::Persistent<FunctionTemplate> NNSLayoutAnchor::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NNSLayoutAnchor::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("NSLayoutAnchor"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "constraintEqualToAnchor", ConstraintEqualToAnchor);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NNSLayoutAnchor::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NNSLayoutAnchor *la = new NNSLayoutAnchor();

  if (info[0]->IsExternal()) {
    la->SetNSObject((__bridge NSLayoutAnchor *)(info[0].As<External>()->Value()));
  } else {
    // error
  }
  la->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_METHOD(NNSLayoutAnchor::ConstraintEqualToAnchor) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSLayoutAnchor, ui);

  JS_UNWRAPPED(JS_OBJ(info[0]), NSLayoutAnchor, anchor);
  double constant = TO_DOUBLE(info[1]);

  NSLayoutConstraint *constraint = [ui constraintEqualToAnchor:anchor constant:constant];

  JS_SET_RETURN(sweetiekit::GetWrapperFor(constraint, NNSLayoutConstraint::type));
}
