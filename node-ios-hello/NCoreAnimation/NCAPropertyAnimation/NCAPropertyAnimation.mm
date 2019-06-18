//
//  NCAPropertyAnimation.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCAPropertyAnimation.h"

#define instancetype CAPropertyAnimation
#define js_value_instancetype js_value_CAPropertyAnimation

NCAPropertyAnimation::NCAPropertyAnimation() {}
NCAPropertyAnimation::~NCAPropertyAnimation() {}

JS_INIT_CLASS(CAPropertyAnimation, CAAnimation);
  JS_ASSIGN_STATIC_METHOD(animationWithKeyPath);
  JS_ASSIGN_PROTO_PROP(keyPath);
  JS_ASSIGN_PROTO_PROP(isAdditive);
  JS_ASSIGN_PROTO_PROP(isCumulative);
  JS_ASSIGN_PROTO_PROP(valueFunction);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CAPropertyAnimation, CAAnimation);
  // constant values (exports)
JS_INIT_CLASS_END(CAPropertyAnimation, CAAnimation);

NAN_METHOD(NCAPropertyAnimation::New) {
  JS_RECONSTRUCT(CAPropertyAnimation);
  @autoreleasepool {
    CAPropertyAnimation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CAPropertyAnimation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CAPropertyAnimation alloc] init];
    }
    if (self) {
      NCAPropertyAnimation *wrapper = new NCAPropertyAnimation();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CAPropertyAnimation::New: invalid arguments");
    }
  }
}

NAN_METHOD(NCAPropertyAnimation::animationWithKeyPath) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, path);
    JS_SET_RETURN(js_value_instancetype([CAPropertyAnimation animationWithKeyPath: path]));
  }
}

NAN_GETTER(NCAPropertyAnimation::keyPathGetter) {
  JS_UNWRAP(CAPropertyAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self keyPath]));
  }
}

NAN_SETTER(NCAPropertyAnimation::keyPathSetter) {
  JS_UNWRAP(CAPropertyAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setKeyPath: input];
  }
}

NAN_GETTER(NCAPropertyAnimation::isAdditiveGetter) {
  JS_UNWRAP(CAPropertyAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAdditive]));
  }
}

NAN_SETTER(NCAPropertyAnimation::isAdditiveSetter) {
  JS_UNWRAP(CAPropertyAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAdditive: input];
  }
}

NAN_GETTER(NCAPropertyAnimation::isCumulativeGetter) {
  JS_UNWRAP(CAPropertyAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isCumulative]));
  }
}

NAN_SETTER(NCAPropertyAnimation::isCumulativeSetter) {
  JS_UNWRAP(CAPropertyAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setCumulative: input];
  }
}

#include "NCAValueFunction.h"

NAN_GETTER(NCAPropertyAnimation::valueFunctionGetter) {
  JS_UNWRAP(CAPropertyAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CAValueFunction([self valueFunction]));
  }
}

NAN_SETTER(NCAPropertyAnimation::valueFunctionSetter) {
  JS_UNWRAP(CAPropertyAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(CAValueFunction, input);
    [self setValueFunction: input];
  }
}
