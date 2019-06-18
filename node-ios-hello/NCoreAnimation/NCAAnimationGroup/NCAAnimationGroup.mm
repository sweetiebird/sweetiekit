//
//  NCAAnimationGroup.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCAAnimationGroup.h"

#define instancetype CAAnimationGroup
#define js_value_instancetype js_value_CAAnimationGroup

NCAAnimationGroup::NCAAnimationGroup() {}
NCAAnimationGroup::~NCAAnimationGroup() {}

JS_INIT_CLASS(CAAnimationGroup, CAAnimation);
  JS_ASSIGN_PROTO_PROP(animations);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CAAnimationGroup, CAAnimation);
  // constant values (exports)
JS_INIT_CLASS_END(CAAnimationGroup, CAAnimation);

NAN_METHOD(NCAAnimationGroup::New) {
  JS_RECONSTRUCT(CAAnimationGroup);
  @autoreleasepool {
    CAAnimationGroup* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CAAnimationGroup *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CAAnimationGroup alloc] init];
    }
    if (self) {
      NCAAnimationGroup *wrapper = new NCAAnimationGroup();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CAAnimationGroup::New: invalid arguments");
    }
  }
}

NAN_GETTER(NCAAnimationGroup::animationsGetter) {
  JS_UNWRAP(CAAnimationGroup, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<CAAnimation*>([self animations]));
  }
}

NAN_SETTER(NCAAnimationGroup::animationsSetter) {
  JS_UNWRAP(CAAnimationGroup, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<CAAnimation*>, input);
    [self setAnimations: input];
  }
}
