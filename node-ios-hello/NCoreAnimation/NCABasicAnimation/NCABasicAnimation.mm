//
//  CABasicAnimation.mm
//
//  Created by Emily Kolar on 5/3/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCABasicAnimation.h"

NCABasicAnimation::NCABasicAnimation () {}
NCABasicAnimation::~NCABasicAnimation () {}

JS_INIT_CLASS(CABasicAnimation, CAPropertyAnimation);
  JS_ASSIGN_PROTO_PROP(fromValue);
  JS_ASSIGN_PROTO_PROP(toValue);
  JS_ASSIGN_PROTO_PROP(byValue);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CABasicAnimation, CAPropertyAnimation);
  // constants (exports)
JS_INIT_CLASS_END(CABasicAnimation, CAPropertyAnimation);

NAN_METHOD(NCABasicAnimation::New) {
  JS_RECONSTRUCT(CABasicAnimation);
  
  Local<Object> obj = info.This();
  
  NCABasicAnimation *anim = new NCABasicAnimation();
  
  if (info[0]->IsExternal()) {
    anim->SetNSObject((__bridge CABasicAnimation *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      std::string kp;
      if (info[0]->IsString()) {
        Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
        kp = *utf8Value;
      } else {
        Nan::ThrowError("invalid argument: key path");
      }

      NSString *keyPath = [NSString stringWithUTF8String:kp.c_str()];

      anim->SetNSObject([CABasicAnimation animationWithKeyPath:keyPath]);
    }
  }
  anim->Wrap(obj);
  
  JS_SET_RETURN(obj);
}

NAN_GETTER(NCABasicAnimation::fromValueGetter) {
  JS_UNWRAP(CABasicAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self fromValue]));
  }
}

NAN_SETTER(NCABasicAnimation::fromValueSetter) {
  JS_UNWRAP(CABasicAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id, input);
    [self setFromValue: input];
  }
}

NAN_GETTER(NCABasicAnimation::toValueGetter) {
  JS_UNWRAP(CABasicAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self toValue]));
  }
}

NAN_SETTER(NCABasicAnimation::toValueSetter) {
  JS_UNWRAP(CABasicAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id, input);
    [self setToValue: input];
  }
}

NAN_GETTER(NCABasicAnimation::byValueGetter) {
  JS_UNWRAP(CABasicAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self byValue]));
  }
}

NAN_SETTER(NCABasicAnimation::byValueSetter) {
  JS_UNWRAP(CABasicAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id, input);
    [self setByValue: input];
  }
}
