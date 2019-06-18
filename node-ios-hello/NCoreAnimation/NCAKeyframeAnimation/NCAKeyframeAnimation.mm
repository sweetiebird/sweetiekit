//
//  NCAKeyframeAnimation.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCAKeyframeAnimation.h"

#define instancetype CAKeyframeAnimation
#define js_value_instancetype js_value_CAKeyframeAnimation

NCAKeyframeAnimation::NCAKeyframeAnimation() {}
NCAKeyframeAnimation::~NCAKeyframeAnimation() {}

JS_INIT_CLASS(CAKeyframeAnimation, CAPropertyAnimation);
  JS_ASSIGN_PROTO_PROP(values);
  JS_ASSIGN_PROTO_PROP(path);
  JS_ASSIGN_PROTO_PROP(keyTimes);
  JS_ASSIGN_PROTO_PROP(timingFunctions);
  JS_ASSIGN_PROTO_PROP(calculationMode);
  JS_ASSIGN_PROTO_PROP(tensionValues);
  JS_ASSIGN_PROTO_PROP(continuityValues);
  JS_ASSIGN_PROTO_PROP(biasValues);
  JS_ASSIGN_PROTO_PROP(rotationMode);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CAKeyframeAnimation, CAPropertyAnimation);
  // constant values (exports)
JS_INIT_CLASS_END(CAKeyframeAnimation, CAPropertyAnimation);

NAN_METHOD(NCAKeyframeAnimation::New) {
  JS_RECONSTRUCT(CAKeyframeAnimation);
  @autoreleasepool {
    CAKeyframeAnimation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CAKeyframeAnimation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CAKeyframeAnimation alloc] init];
    }
    if (self) {
      NCAKeyframeAnimation *wrapper = new NCAKeyframeAnimation();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CAKeyframeAnimation::New: invalid arguments");
    }
  }
}

NAN_GETTER(NCAKeyframeAnimation::valuesGetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray([self values]));
  }
}

NAN_SETTER(NCAKeyframeAnimation::valuesSetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray, input);
    [self setValues: input];
  }
}

NAN_GETTER(NCAKeyframeAnimation::pathGetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPathRef([self path]));
  }
}

NAN_SETTER(NCAKeyframeAnimation::pathSetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPathRef, input);
    [self setPath: input];
  }
}

NAN_GETTER(NCAKeyframeAnimation::keyTimesGetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self keyTimes]));
  }
}

NAN_SETTER(NCAKeyframeAnimation::keyTimesSetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<NSNumber*>, input);
    [self setKeyTimes: input];
  }
}

#include "NCAMediaTimingFunction.h"

NAN_GETTER(NCAKeyframeAnimation::timingFunctionsGetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<CAMediaTimingFunction*>([self timingFunctions]));
  }
}

NAN_SETTER(NCAKeyframeAnimation::timingFunctionsSetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<CAMediaTimingFunction*>, input);
    [self setTimingFunctions: input];
  }
}

NAN_GETTER(NCAKeyframeAnimation::calculationModeGetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CAAnimationCalculationMode([self calculationMode]));
  }
}

NAN_SETTER(NCAKeyframeAnimation::calculationModeSetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CAAnimationCalculationMode, input);
    [self setCalculationMode: input];
  }
}

NAN_GETTER(NCAKeyframeAnimation::tensionValuesGetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self tensionValues]));
  }
}

NAN_SETTER(NCAKeyframeAnimation::tensionValuesSetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<NSNumber*>, input);
    [self setTensionValues: input];
  }
}

NAN_GETTER(NCAKeyframeAnimation::continuityValuesGetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self continuityValues]));
  }
}

NAN_SETTER(NCAKeyframeAnimation::continuityValuesSetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<NSNumber*>, input);
    [self setContinuityValues: input];
  }
}

NAN_GETTER(NCAKeyframeAnimation::biasValuesGetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self biasValues]));
  }
}

NAN_SETTER(NCAKeyframeAnimation::biasValuesSetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<NSNumber*>, input);
    [self setBiasValues: input];
  }
}

NAN_GETTER(NCAKeyframeAnimation::rotationModeGetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CAAnimationRotationMode([self rotationMode]));
  }
}

NAN_SETTER(NCAKeyframeAnimation::rotationModeSetter) {
  JS_UNWRAP(CAKeyframeAnimation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CAAnimationRotationMode, input);
    [self setRotationMode: input];
  }
}
