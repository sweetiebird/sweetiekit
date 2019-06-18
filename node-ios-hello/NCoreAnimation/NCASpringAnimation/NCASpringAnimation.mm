//
//  NCASpringAnimation.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCASpringAnimation.h"

#define instancetype CASpringAnimation
#define js_value_instancetype js_value_CASpringAnimation

NCASpringAnimation::NCASpringAnimation() {}
NCASpringAnimation::~NCASpringAnimation() {}

JS_INIT_CLASS(CASpringAnimation, CABasicAnimation);
  JS_ASSIGN_PROTO_PROP(mass);
  JS_ASSIGN_PROTO_PROP(stiffness);
  JS_ASSIGN_PROTO_PROP(damping);
  JS_ASSIGN_PROTO_PROP(initialVelocity);
  JS_ASSIGN_PROTO_PROP_READONLY(settlingDuration);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CASpringAnimation, CABasicAnimation);
  // constant values (exports)
JS_INIT_CLASS_END(CASpringAnimation, CABasicAnimation);

NAN_METHOD(NCASpringAnimation::New) {
  JS_RECONSTRUCT(CASpringAnimation);
  @autoreleasepool {
    CASpringAnimation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CASpringAnimation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CASpringAnimation alloc] init];
    }
    if (self) {
      NCASpringAnimation *wrapper = new NCASpringAnimation();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CASpringAnimation::New: invalid arguments");
    }
  }
}

NAN_GETTER(NCASpringAnimation::massGetter) {
  JS_UNWRAP(CASpringAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self mass]));
  }
}

NAN_SETTER(NCASpringAnimation::massSetter) {
  JS_UNWRAP(CASpringAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMass: input];
  }
}

NAN_GETTER(NCASpringAnimation::stiffnessGetter) {
  JS_UNWRAP(CASpringAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self stiffness]));
  }
}

NAN_SETTER(NCASpringAnimation::stiffnessSetter) {
  JS_UNWRAP(CASpringAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setStiffness: input];
  }
}

NAN_GETTER(NCASpringAnimation::dampingGetter) {
  JS_UNWRAP(CASpringAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self damping]));
  }
}

NAN_SETTER(NCASpringAnimation::dampingSetter) {
  JS_UNWRAP(CASpringAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setDamping: input];
  }
}

NAN_GETTER(NCASpringAnimation::initialVelocityGetter) {
  JS_UNWRAP(CASpringAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self initialVelocity]));
  }
}

NAN_SETTER(NCASpringAnimation::initialVelocitySetter) {
  JS_UNWRAP(CASpringAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setInitialVelocity: input];
  }
}

NAN_GETTER(NCASpringAnimation::settlingDurationGetter) {
  JS_UNWRAP(CASpringAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CFTimeInterval([self settlingDuration]));
  }
}
