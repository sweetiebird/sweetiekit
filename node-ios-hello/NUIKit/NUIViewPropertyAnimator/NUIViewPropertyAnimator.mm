//
//  NUIViewPropertyAnimator.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIViewPropertyAnimator.h"

#define instancetype UIViewPropertyAnimator
#define js_value_instancetype js_value_UIViewPropertyAnimator

NUIViewPropertyAnimator::NUIViewPropertyAnimator() {}
NUIViewPropertyAnimator::~NUIViewPropertyAnimator() {}

JS_INIT_CLASS(UIViewPropertyAnimator, UIViewImplicitlyAnimating);
  JS_ASSIGN_STATIC_METHOD(runningPropertyAnimatorWithDurationDelayOptionsAnimationsCompletion);
  JS_ASSIGN_PROTO_METHOD(initWithDurationTimingParameters);
  JS_ASSIGN_PROTO_METHOD(initWithDurationCurveAnimations);
  JS_ASSIGN_PROTO_METHOD(initWithDurationControlPoint1_controlPoint2_animations);
  JS_ASSIGN_PROTO_METHOD(initWithDurationDampingRatioAnimations);
#if 0
  JS_ASSIGN_PROTO_METHOD(addAnimationsDelayFactor);
  JS_ASSIGN_PROTO_METHOD(addAnimations);
  JS_ASSIGN_PROTO_METHOD(addCompletion);
  JS_ASSIGN_PROTO_METHOD(continueAnimationWithTimingParametersDurationFactor);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(timingParameters);
  JS_ASSIGN_PROTO_PROP_READONLY(duration);
  JS_ASSIGN_PROTO_PROP_READONLY(delay);
  JS_ASSIGN_PROTO_PROP(isUserInteractionEnabled);
  JS_ASSIGN_PROTO_PROP(isManualHitTestingEnabled);
  JS_ASSIGN_PROTO_PROP(isInterruptible);
  JS_ASSIGN_PROTO_PROP(scrubsLinearly);
  JS_ASSIGN_PROTO_PROP(pausesOnCompletion);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIViewPropertyAnimator, UIViewImplicitlyAnimating);
  // constant values (exports)
JS_INIT_CLASS_END(UIViewPropertyAnimator, UIViewImplicitlyAnimating);

NAN_METHOD(NUIViewPropertyAnimator::New) {
  JS_RECONSTRUCT(UIViewPropertyAnimator);
  @autoreleasepool {
    UIViewPropertyAnimator* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIViewPropertyAnimator *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIViewPropertyAnimator alloc] init];
    }
    if (self) {
      NUIViewPropertyAnimator *wrapper = new NUIViewPropertyAnimator();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIViewPropertyAnimator::New: invalid arguments");
    }
  }
}

#include "NUIView.h"

NAN_METHOD(NUIViewPropertyAnimator::runningPropertyAnimatorWithDurationDelayOptionsAnimationsCompletion) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    declare_value(NSTimeInterval, delay);
    declare_value(UIViewAnimationOptions, options);
    declare_callback(animations);
    declare_callback(completion);
    JS_SET_RETURN(js_value_instancetype([UIViewPropertyAnimator runningPropertyAnimatorWithDuration: duration delay: delay options: options animations:^{
      dispatch_main(^{
        if (animations) {
          [animations jsFunction]->Call("NUIViewPropertyAnimator::runningPropertyAnimatorWithDurationDelayOptionsAnimationsCompletion::animations");
        }
      });
    } completion:^(UIViewAnimatingPosition finalPosition) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIViewPropertyAnimator::runningPropertyAnimatorWithDurationDelayOptionsAnimationsCompletion::completion");
        }
      });
    }]));
  }
}

#include "NUITimingCurveProvider.h"

NAN_METHOD(NUIViewPropertyAnimator::initWithDurationTimingParameters) {
  JS_UNWRAP_OR_ALLOC(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    declare_protocol(UITimingCurveProvider, parameters);
    JS_SET_RETURN(js_value_instancetype([self initWithDuration: duration timingParameters: parameters]));
  }
}

NAN_METHOD(NUIViewPropertyAnimator::initWithDurationCurveAnimations) {
  JS_UNWRAP_OR_ALLOC(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    declare_value(UIViewAnimationCurve, curve);
    declare_callback(animations);
    JS_SET_RETURN(js_value_instancetype([self initWithDuration: duration curve: curve animations:^{
      dispatch_main(^{
        if (animations) {
          [animations jsFunction]->Call("NUIViewPropertyAnimator::initWithDurationCurveAnimations");
        }
      });
    }]));
  }
}

NAN_METHOD(NUIViewPropertyAnimator::initWithDurationControlPoint1_controlPoint2_animations) {
  JS_UNWRAP_OR_ALLOC(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    declare_value(CGPoint, point1);
    declare_value(CGPoint, point2);
    declare_callback(animations);
    JS_SET_RETURN(js_value_instancetype([self initWithDuration: duration controlPoint1: point1 controlPoint2: point2 animations:^{
      dispatch_main(^{
        if (animations) {
          [animations jsFunction]->Call("NUIViewPropertyAnimator::initWithDurationControlPoint1_controlPoint2_animations");
        }
      });
    }]));
  }
}

NAN_METHOD(NUIViewPropertyAnimator::initWithDurationDampingRatioAnimations) {
  JS_UNWRAP_OR_ALLOC(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    declare_value(CGFloat, ratio);
    declare_callback(animations);
    JS_SET_RETURN(js_value_instancetype([self initWithDuration: duration dampingRatio: ratio animations:^{
      dispatch_main(^{
        if (animations) {
          [animations jsFunction]->Call("NUIViewPropertyAnimator::initWithDurationDampingRatioAnimations");
        }
      });
    }]));
  }
}

#if 0
NAN_METHOD(NUIViewPropertyAnimator::addAnimationsDelayFactor) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(animation);
    declare_value(CGFloat, delayFactor);
    [self addAnimations:^{
      dispatch_main(^{
        if (animation) {
          [animation jsFunction]->Call("NUIViewPropertyAnimator::addAnimationsDelayFactor");
        }
      });
    } delayFactor: delayFactor];
  }
}

NAN_METHOD(NUIViewPropertyAnimator::addAnimations) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(animation);
    [self addAnimations:^{
      dispatch_main(^{
        if (animation) {
          [animation jsFunction]->Call("NUIViewPropertyAnimator::addAnimations");
        }
      });
    }];
  }
}

NAN_METHOD(NUIViewPropertyAnimator::addCompletion) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(completion);
    [self addCompletion:^(UIViewAnimatingPosition finalPosition) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIViewPropertyAnimator::addCompletion");
        }
      });
    }];
  }
}

NAN_METHOD(NUIViewPropertyAnimator::continueAnimationWithTimingParametersDurationFactor) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(UITimingCurveProvider, parameters);
    declare_value(CGFloat, durationFactor);
    [self continueAnimationWithTimingParameters: parameters durationFactor: durationFactor];
  }
}
#endif

NAN_GETTER(NUIViewPropertyAnimator::timingParametersGetter) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITimingCurveProvider([self timingParameters]));
  }
}

NAN_GETTER(NUIViewPropertyAnimator::durationGetter) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self duration]));
  }
}

NAN_GETTER(NUIViewPropertyAnimator::delayGetter) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self delay]));
  }
}

NAN_GETTER(NUIViewPropertyAnimator::isUserInteractionEnabledGetter) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isUserInteractionEnabled]));
  }
}

NAN_SETTER(NUIViewPropertyAnimator::isUserInteractionEnabledSetter) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setUserInteractionEnabled: input];
  }
}

NAN_GETTER(NUIViewPropertyAnimator::isManualHitTestingEnabledGetter) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isManualHitTestingEnabled]));
  }
}

NAN_SETTER(NUIViewPropertyAnimator::isManualHitTestingEnabledSetter) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setManualHitTestingEnabled: input];
  }
}

NAN_GETTER(NUIViewPropertyAnimator::isInterruptibleGetter) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isInterruptible]));
  }
}

NAN_SETTER(NUIViewPropertyAnimator::isInterruptibleSetter) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setInterruptible: input];
  }
}

NAN_GETTER(NUIViewPropertyAnimator::scrubsLinearlyGetter) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self scrubsLinearly]));
  }
}

NAN_SETTER(NUIViewPropertyAnimator::scrubsLinearlySetter) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setScrubsLinearly: input];
  }
}

NAN_GETTER(NUIViewPropertyAnimator::pausesOnCompletionGetter) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self pausesOnCompletion]));
  }
}

NAN_SETTER(NUIViewPropertyAnimator::pausesOnCompletionSetter) {
  JS_UNWRAP(UIViewPropertyAnimator, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPausesOnCompletion: input];
  }
}
