//
//  NCATransition.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCATransition.h"

#define instancetype CATransition
#define js_value_instancetype js_value_CATransition

NCATransition::NCATransition() {}
NCATransition::~NCATransition() {}

JS_INIT_CLASS(CATransition, CAAnimation);
  JS_ASSIGN_PROTO_PROP(type);
  JS_ASSIGN_PROTO_PROP(subtype);
  JS_ASSIGN_PROTO_PROP(startProgress);
  JS_ASSIGN_PROTO_PROP(endProgress);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CATransition, CAAnimation);
  // constant values (exports)
JS_INIT_CLASS_END(CATransition, CAAnimation);

NAN_METHOD(NCATransition::New) {
  JS_RECONSTRUCT(CATransition);
  @autoreleasepool {
    CATransition* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CATransition *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CATransition alloc] init];
    }
    if (self) {
      NCATransition *wrapper = new NCATransition();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CATransition::New: invalid arguments");
    }
  }
}

NAN_GETTER(NCATransition::typeGetter) {
  JS_UNWRAP(CATransition, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CATransitionType([self type]));
  }
}

NAN_SETTER(NCATransition::typeSetter) {
  JS_UNWRAP(CATransition, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CATransitionType, input);
    [self setType: input];
  }
}

NAN_GETTER(NCATransition::subtypeGetter) {
  JS_UNWRAP(CATransition, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CATransitionSubtype([self subtype]));
  }
}

NAN_SETTER(NCATransition::subtypeSetter) {
  JS_UNWRAP(CATransition, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CATransitionSubtype, input);
    [self setSubtype: input];
  }
}

NAN_GETTER(NCATransition::startProgressGetter) {
  JS_UNWRAP(CATransition, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self startProgress]));
  }
}

NAN_SETTER(NCATransition::startProgressSetter) {
  JS_UNWRAP(CATransition, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setStartProgress: input];
  }
}

NAN_GETTER(NCATransition::endProgressGetter) {
  JS_UNWRAP(CATransition, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self endProgress]));
  }
}

NAN_SETTER(NCATransition::endProgressSetter) {
  JS_UNWRAP(CATransition, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setEndProgress: input];
  }
}
