//
//  NNSLayoutYAxisAnchor.mm
//
//  Created by Shawn Presser on 6/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSLayoutYAxisAnchor.h"

NNSLayoutYAxisAnchor::NNSLayoutYAxisAnchor() {}
NNSLayoutYAxisAnchor::~NNSLayoutYAxisAnchor() {}

JS_INIT_CLASS(NSLayoutYAxisAnchor, NSLayoutAnchor);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, anchorWithOffsetToAnchor);
  JS_ASSIGN_METHOD(proto, constraintEqualToSystemSpacingBelowAnchorMultiplier);
  JS_ASSIGN_METHOD(proto, constraintGreaterThanOrEqualToSystemSpacingBelowAnchorMultiplier);
  JS_ASSIGN_METHOD(proto, constraintLessThanOrEqualToSystemSpacingBelowAnchorMultiplier);
  // static members (ctor)
  JS_INIT_CTOR(NSLayoutYAxisAnchor, NSLayoutAnchor);
JS_INIT_CLASS_END(NSLayoutYAxisAnchor, NSLayoutAnchor);

NAN_METHOD(NNSLayoutYAxisAnchor::New) {
  JS_RECONSTRUCT(NSLayoutYAxisAnchor);
  @autoreleasepool {
    NSLayoutYAxisAnchor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSLayoutYAxisAnchor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSLayoutYAxisAnchor alloc] init];
    }
    if (self) {
      NNSLayoutYAxisAnchor *wrapper = new NNSLayoutYAxisAnchor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSLayoutYAxisAnchor::New: invalid arguments");
    }
  }
}

#include "NNSLayoutDimension.h"

NAN_METHOD(NNSLayoutYAxisAnchor::anchorWithOffsetToAnchor) {
  JS_UNWRAP(NSLayoutYAxisAnchor, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutYAxisAnchor, otherAnchor);
    JS_SET_RETURN(js_value_NSLayoutDimension([self anchorWithOffsetToAnchor: otherAnchor]));
  }
}

#include "NNSLayoutConstraint.h"

NAN_METHOD(NNSLayoutYAxisAnchor::constraintEqualToSystemSpacingBelowAnchorMultiplier) {
  JS_UNWRAP(NSLayoutYAxisAnchor, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutYAxisAnchor, anchor);
    declare_value(CGFloat, multiplier);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintEqualToSystemSpacingBelowAnchor: anchor multiplier: multiplier]));
  }
}

NAN_METHOD(NNSLayoutYAxisAnchor::constraintGreaterThanOrEqualToSystemSpacingBelowAnchorMultiplier) {
  JS_UNWRAP(NSLayoutYAxisAnchor, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutYAxisAnchor, anchor);
    declare_value(CGFloat, multiplier);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintGreaterThanOrEqualToSystemSpacingBelowAnchor: anchor multiplier: multiplier]));
  }
}

NAN_METHOD(NNSLayoutYAxisAnchor::constraintLessThanOrEqualToSystemSpacingBelowAnchorMultiplier) {
  JS_UNWRAP(NSLayoutYAxisAnchor, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutYAxisAnchor, anchor);
    declare_value(CGFloat, multiplier);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintLessThanOrEqualToSystemSpacingBelowAnchor: anchor multiplier: multiplier]));
  }
}
