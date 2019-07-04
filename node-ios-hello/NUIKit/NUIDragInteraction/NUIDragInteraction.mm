//
//  NUIDragInteraction.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIDragInteraction.h"

#define instancetype UIDragInteraction
#define js_value_instancetype js_value_UIDragInteraction

NUIDragInteraction::NUIDragInteraction() {}
NUIDragInteraction::~NUIDragInteraction() {}

JS_INIT_CLASS(UIDragInteraction, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithDelegate);
  JS_ASSIGN_PROTO_PROP_READONLY(delegate);
  JS_ASSIGN_PROTO_PROP(allowsSimultaneousRecognitionDuringLift);
  JS_ASSIGN_PROTO_PROP(isEnabled);
  JS_ASSIGN_STATIC_PROP_READONLY(isEnabledByDefault);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIDragInteraction, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UIDragInteraction, NSObject);

NAN_METHOD(NUIDragInteraction::New) {
  JS_RECONSTRUCT(UIDragInteraction);
  @autoreleasepool {
    UIDragInteraction* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIDragInteraction *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUIDragInteraction *wrapper = new NUIDragInteraction();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIDragInteraction::New: invalid arguments");
    }
  }
}

#include "NUIDragInteractionDelegate.h"

NAN_METHOD(NUIDragInteraction::initWithDelegate) {
  JS_UNWRAP_OR_ALLOC(UIDragInteraction, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(UIDragInteractionDelegate, delegate);
    instancetype* result = [self initWithDelegate: delegate];
    [result associateValue:delegate withKey:@"NUIDragInteraction::delegate"];
    JS_SET_RETURN(js_value_instancetype(result));
  }
}

NAN_GETTER(NUIDragInteraction::delegateGetter) {
  JS_UNWRAP(UIDragInteraction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDragInteractionDelegate([self delegate]));
  }
}

NAN_GETTER(NUIDragInteraction::allowsSimultaneousRecognitionDuringLiftGetter) {
  JS_UNWRAP(UIDragInteraction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsSimultaneousRecognitionDuringLift]));
  }
}

NAN_SETTER(NUIDragInteraction::allowsSimultaneousRecognitionDuringLiftSetter) {
  JS_UNWRAP(UIDragInteraction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsSimultaneousRecognitionDuringLift: input];
  }
}

NAN_GETTER(NUIDragInteraction::isEnabledGetter) {
  JS_UNWRAP(UIDragInteraction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEnabled]));
  }
}

NAN_SETTER(NUIDragInteraction::isEnabledSetter) {
  JS_UNWRAP(UIDragInteraction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEnabled: input];
  }
}

NAN_GETTER(NUIDragInteraction::isEnabledByDefaultGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([UIDragInteraction isEnabledByDefault]));
  }
}
