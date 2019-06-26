//
//  NCAAnimation.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCAAnimation.h"

#define instancetype CAAnimation
#define js_value_instancetype js_value_CAAnimation

NCAAnimation::NCAAnimation() {}
NCAAnimation::~NCAAnimation() {}

NAN_METHOD(NCAAnimation::CACurrentMediaTime) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_double(::CACurrentMediaTime()));
  }
}

JS_INIT_CLASS(CAAnimation, NSObject);
  // global functions
  JS_ASSIGN_GLOBAL_METHOD(CACurrentMediaTime);

// CAAnimation
  JS_ASSIGN_STATIC_METHOD(animation);
  JS_ASSIGN_STATIC_METHOD(defaultValueForKey);
  JS_ASSIGN_PROTO_METHOD(shouldArchiveValueForKey);
#if TODO
// CAAnimationDelegate
  JS_ASSIGN_PROTO_METHOD(animationDidStart);
  JS_ASSIGN_PROTO_METHOD(animationDidStopFinished);
#endif
// CAAnimation
  JS_ASSIGN_PROTO_PROP(timingFunction);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(isRemovedOnCompletion);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CAAnimation, NSObject);
  // constant values (exports)

  JS_ASSIGN_ENUM(kCAAnimationLinear, CAAnimationCalculationMode);
  JS_ASSIGN_ENUM(kCAAnimationDiscrete, CAAnimationCalculationMode);
  JS_ASSIGN_ENUM(kCAAnimationPaced, CAAnimationCalculationMode);
  JS_ASSIGN_ENUM(kCAAnimationCubic, CAAnimationCalculationMode);
  JS_ASSIGN_ENUM(kCAAnimationCubicPaced, CAAnimationCalculationMode);

  JS_ASSIGN_ENUM(kCAAnimationRotateAuto, CAAnimationRotationMode);
  JS_ASSIGN_ENUM(kCAAnimationRotateAutoReverse, CAAnimationRotationMode);

  JS_ASSIGN_ENUM(kCATransitionFade, CATransitionType);
  JS_ASSIGN_ENUM(kCATransitionMoveIn, CATransitionType);
  JS_ASSIGN_ENUM(kCATransitionPush, CATransitionType);
  JS_ASSIGN_ENUM(kCATransitionReveal, CATransitionType);

  JS_ASSIGN_ENUM(kCATransitionFromRight, CATransitionSubtype);
  JS_ASSIGN_ENUM(kCATransitionFromLeft, CATransitionSubtype);
  JS_ASSIGN_ENUM(kCATransitionFromTop, CATransitionSubtype);
  JS_ASSIGN_ENUM(kCATransitionFromBottom, CATransitionSubtype);
JS_INIT_CLASS_END(CAAnimation, NSObject);

NAN_METHOD(NCAAnimation::New) {
  JS_RECONSTRUCT(CAAnimation);
  @autoreleasepool {
    CAAnimation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CAAnimation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CAAnimation alloc] init];
    }
    if (self) {
      NCAAnimation *wrapper = new NCAAnimation();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CAAnimation::New: invalid arguments");
    }
  }
}

NAN_METHOD(NCAAnimation::animation) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([CAAnimation animation]));
  }
}

NAN_METHOD(NCAAnimation::defaultValueForKey) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_id([CAAnimation defaultValueForKey: key]));
  }
}

NAN_METHOD(NCAAnimation::shouldArchiveValueForKey) {
  JS_UNWRAP(CAAnimation, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_BOOL([self shouldArchiveValueForKey: key]));
  }
}

#if TODO
NAN_METHOD(NCAAnimationDelegate::animationDidStart) {
  JS_UNWRAP(CAAnimationDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CAAnimation, anim);
    [self animationDidStart: anim];
  }
}

NAN_METHOD(NCAAnimationDelegate::animationDidStopFinished) {
  JS_UNWRAP(CAAnimationDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CAAnimation, anim);
    declare_value(BOOL, flag);
    [self animationDidStop: anim finished: flag];
  }
}
#endif

#include "NCAMediaTimingFunction.h"

NAN_GETTER(NCAAnimation::timingFunctionGetter) {
  JS_UNWRAP(CAAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CAMediaTimingFunction([self timingFunction]));
  }
}

NAN_SETTER(NCAAnimation::timingFunctionSetter) {
  JS_UNWRAP(CAAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(CAMediaTimingFunction, input);
    [self setTimingFunction: input];
  }
}

NAN_GETTER(NCAAnimation::delegateGetter) {
  JS_UNWRAP(CAAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <CAAnimationDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NCAAnimation::delegateSetter) {
  JS_UNWRAP(CAAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <CAAnimationDelegate>*/, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"CAAnimation::delegate"];
  }
}

NAN_GETTER(NCAAnimation::isRemovedOnCompletionGetter) {
  JS_UNWRAP(CAAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isRemovedOnCompletion]));
  }
}

NAN_SETTER(NCAAnimation::isRemovedOnCompletionSetter) {
  JS_UNWRAP(CAAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setRemovedOnCompletion: input];
  }
}
