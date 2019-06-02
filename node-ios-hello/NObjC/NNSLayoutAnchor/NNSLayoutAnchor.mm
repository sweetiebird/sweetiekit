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

JS_INIT_CLASS(NSLayoutAnchor, NSObject);
  // instance members (proto)
  Nan::SetMethod(proto, "constraintEqualToAnchor", ConstraintEqualToAnchor);
  // static members (ctor)
  JS_INIT_CTOR(NSLayoutAnchor, NSObject);
JS_INIT_CLASS_END(NSLayoutAnchor, NSObject);

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
