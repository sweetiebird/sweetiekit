//
//  NNSLayoutDimension.mm
//
//  Created by Shawn Presser on 6/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSLayoutDimension.h"

NNSLayoutDimension::NNSLayoutDimension() {}
NNSLayoutDimension::~NNSLayoutDimension() {}

JS_INIT_CLASS(NSLayoutDimension, NSLayoutAnchor);
  // instance members (proto)
  JS_PROTO_METHOD(constraintEqualToConstant);
  JS_PROTO_METHOD(constraintGreaterThanOrEqualToConstant);
  JS_PROTO_METHOD(constraintLessThanOrEqualToConstant);
  JS_PROTO_METHOD(constraintEqualToAnchorMultiplier);
  JS_PROTO_METHOD(constraintGreaterThanOrEqualToAnchorMultiplier);
  JS_PROTO_METHOD(constraintLessThanOrEqualToAnchorMultiplier);
  JS_PROTO_METHOD(constraintEqualToAnchorMultiplierConstant);
  JS_PROTO_METHOD(constraintGreaterThanOrEqualToAnchorMultiplierConstant);
  JS_PROTO_METHOD(constraintLessThanOrEqualToAnchorMultiplierConstant);
  // static members (ctor)
  JS_INIT_CTOR(NSLayoutDimension, NSLayoutAnchor);
JS_INIT_CLASS_END(NSLayoutDimension, NSLayoutAnchor);

NAN_METHOD(NNSLayoutDimension::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'NSLayoutDimension(...)', turn into construct call.
      JS_SET_RETURN_NEW(NSLayoutDimension, info);
      return;
    }

    NSLayoutDimension* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge NSLayoutDimension *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSLayoutDimension alloc] init];
    }
    if (self) {
      NNSLayoutDimension *wrapper = new NNSLayoutDimension();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSLayoutDimension::New: invalid arguments");
    }
  }
}

#include "NNSLayoutConstraint.h"

NAN_METHOD(NNSLayoutDimension::constraintEqualToConstant) {
  JS_UNWRAP(NSLayoutDimension, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGFloat, c);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintEqualToConstant: c]));
  }
}

NAN_METHOD(NNSLayoutDimension::constraintGreaterThanOrEqualToConstant) {
  JS_UNWRAP(NSLayoutDimension, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGFloat, c);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintGreaterThanOrEqualToConstant: c]));
  }
}

NAN_METHOD(NNSLayoutDimension::constraintLessThanOrEqualToConstant) {
  JS_UNWRAP(NSLayoutDimension, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGFloat, c);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintLessThanOrEqualToConstant: c]));
  }
}

NAN_METHOD(NNSLayoutDimension::constraintEqualToAnchorMultiplier) {
  JS_UNWRAP(NSLayoutDimension, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutDimension, anchor);
    declare_value(CGFloat, m);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintEqualToAnchor: anchor multiplier: m]));
  }
}

NAN_METHOD(NNSLayoutDimension::constraintGreaterThanOrEqualToAnchorMultiplier) {
  JS_UNWRAP(NSLayoutDimension, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutDimension, anchor);
    declare_value(CGFloat, m);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintGreaterThanOrEqualToAnchor: anchor multiplier: m]));
  }
}

NAN_METHOD(NNSLayoutDimension::constraintLessThanOrEqualToAnchorMultiplier) {
  JS_UNWRAP(NSLayoutDimension, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutDimension, anchor);
    declare_value(CGFloat, m);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintLessThanOrEqualToAnchor: anchor multiplier: m]));
  }
}

NAN_METHOD(NNSLayoutDimension::constraintEqualToAnchorMultiplierConstant) {
  JS_UNWRAP(NSLayoutDimension, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutDimension, anchor);
    declare_value(CGFloat, m);
    declare_value(CGFloat, c);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintEqualToAnchor: anchor multiplier: m constant: c]));
  }
}

NAN_METHOD(NNSLayoutDimension::constraintGreaterThanOrEqualToAnchorMultiplierConstant) {
  JS_UNWRAP(NSLayoutDimension, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutDimension, anchor);
    declare_value(CGFloat, m);
    declare_value(CGFloat, c);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintGreaterThanOrEqualToAnchor: anchor multiplier: m constant: c]));
  }
}

NAN_METHOD(NNSLayoutDimension::constraintLessThanOrEqualToAnchorMultiplierConstant) {
  JS_UNWRAP(NSLayoutDimension, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutDimension, anchor);
    declare_value(CGFloat, m);
    declare_value(CGFloat, c);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintLessThanOrEqualToAnchor: anchor multiplier: m constant: c]));
  }
}
