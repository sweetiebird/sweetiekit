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
  JS_ASSIGN_PROTO_METHOD(constraintEqualToAnchor);
  JS_ASSIGN_PROTO_METHOD(constraintGreaterThanOrEqualToAnchor);
  JS_ASSIGN_PROTO_METHOD(constraintLessThanOrEqualToAnchor);
  JS_ASSIGN_PROTO_METHOD(constraintEqualToAnchorConstant);
  JS_ASSIGN_PROTO_METHOD(constraintGreaterThanOrEqualToAnchorConstant);
  JS_ASSIGN_PROTO_METHOD(constraintLessThanOrEqualToAnchorConstant);
  // static members (ctor)
  JS_INIT_CTOR(NSLayoutAnchor, NSObject);
JS_INIT_CLASS_END(NSLayoutAnchor, NSObject);

NAN_METHOD(NNSLayoutAnchor::New) {
  JS_RECONSTRUCT(NSLayoutAnchor);
  @autoreleasepool {
    NSLayoutAnchor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSLayoutAnchor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSLayoutAnchor alloc] init];
    }
    if (self) {
      NNSLayoutAnchor *wrapper = new NNSLayoutAnchor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSLayoutAnchor::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSLayoutAnchor::constraintEqualToAnchor) {
  JS_UNWRAP(NSLayoutAnchor, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutAnchor, anchor);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintEqualToAnchor: anchor]));
  }
}

NAN_METHOD(NNSLayoutAnchor::constraintGreaterThanOrEqualToAnchor) {
  if (info.Length() >= 2) {
    return constraintGreaterThanOrEqualToAnchorConstant(info);
  }
  JS_UNWRAP(NSLayoutAnchor, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutAnchor, anchor);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintGreaterThanOrEqualToAnchor: anchor]));
  }
}

NAN_METHOD(NNSLayoutAnchor::constraintLessThanOrEqualToAnchor) {
  JS_UNWRAP(NSLayoutAnchor, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutAnchor, anchor);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintLessThanOrEqualToAnchor: anchor]));
  }
}

NAN_METHOD(NNSLayoutAnchor::constraintEqualToAnchorConstant) {
  JS_UNWRAP(NSLayoutAnchor, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutAnchor, anchor);
    declare_value(CGFloat, c);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintEqualToAnchor: anchor constant: c]));
  }
}

NAN_METHOD(NNSLayoutAnchor::constraintGreaterThanOrEqualToAnchorConstant) {
  JS_UNWRAP(NSLayoutAnchor, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutAnchor, anchor);
    declare_value(CGFloat, c);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintGreaterThanOrEqualToAnchor: anchor constant: c]));
  }
}

NAN_METHOD(NNSLayoutAnchor::constraintLessThanOrEqualToAnchorConstant) {
  JS_UNWRAP(NSLayoutAnchor, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutAnchor, anchor);
    declare_value(CGFloat, c);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintLessThanOrEqualToAnchor: anchor constant: c]));
  }
}

