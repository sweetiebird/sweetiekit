//
//  NNSLayoutXAxisAnchor.mm
//
//  Created by Shawn Presser on 6/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSLayoutXAxisAnchor.h"

NNSLayoutXAxisAnchor::NNSLayoutXAxisAnchor() {}
NNSLayoutXAxisAnchor::~NNSLayoutXAxisAnchor() {}

JS_INIT_CLASS(NSLayoutXAxisAnchor, NSLayoutAnchor);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, anchorWithOffsetToAnchor);
  JS_ASSIGN_METHOD(proto, constraintEqualToSystemSpacingAfterAnchorMultiplier);
  JS_ASSIGN_METHOD(proto, constraintGreaterThanOrEqualToSystemSpacingAfterAnchorMultiplier);
  JS_ASSIGN_METHOD(proto, constraintLessThanOrEqualToSystemSpacingAfterAnchorMultiplier);
  // static members (ctor)
  JS_INIT_CTOR(NSLayoutXAxisAnchor, NSLayoutAnchor);
JS_INIT_CLASS_END(NSLayoutXAxisAnchor, NSLayoutAnchor);

NAN_METHOD(NNSLayoutXAxisAnchor::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'NSLayoutXAxisAnchor(...)', turn into construct call.
      JS_SET_RETURN_NEW(NSLayoutXAxisAnchor, info);
      return;
    }

    NSLayoutXAxisAnchor* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge NSLayoutXAxisAnchor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSLayoutXAxisAnchor alloc] init];
    }
    if (self) {
      NNSLayoutXAxisAnchor *wrapper = new NNSLayoutXAxisAnchor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSLayoutXAxisAnchor::New: invalid arguments");
    }
  }
}

#include "NNSLayoutDimension.h"

NAN_METHOD(NNSLayoutXAxisAnchor::anchorWithOffsetToAnchor) {
  JS_UNWRAP(NSLayoutXAxisAnchor, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutXAxisAnchor, otherAnchor);
    JS_SET_RETURN(js_value_NSLayoutDimension([self anchorWithOffsetToAnchor: otherAnchor]));
  }
}

#include "NNSLayoutConstraint.h"

NAN_METHOD(NNSLayoutXAxisAnchor::constraintEqualToSystemSpacingAfterAnchorMultiplier) {
  JS_UNWRAP(NSLayoutXAxisAnchor, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutXAxisAnchor, anchor);
    declare_value(CGFloat, multiplier);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintEqualToSystemSpacingAfterAnchor: anchor multiplier: multiplier]));
  }
}

NAN_METHOD(NNSLayoutXAxisAnchor::constraintGreaterThanOrEqualToSystemSpacingAfterAnchorMultiplier) {
  JS_UNWRAP(NSLayoutXAxisAnchor, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutXAxisAnchor, anchor);
    declare_value(CGFloat, multiplier);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintGreaterThanOrEqualToSystemSpacingAfterAnchor: anchor multiplier: multiplier]));
  }
}

NAN_METHOD(NNSLayoutXAxisAnchor::constraintLessThanOrEqualToSystemSpacingAfterAnchorMultiplier) {
  JS_UNWRAP(NSLayoutXAxisAnchor, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutXAxisAnchor, anchor);
    declare_value(CGFloat, multiplier);
    JS_SET_RETURN(js_value_NSLayoutConstraint([self constraintLessThanOrEqualToSystemSpacingAfterAnchor: anchor multiplier: multiplier]));
  }
}
