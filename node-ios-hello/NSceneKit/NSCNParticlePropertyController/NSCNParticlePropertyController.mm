//
//  NSCNParticlePropertyController.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNParticlePropertyController.h"

#define instancetype SCNParticlePropertyController
#define js_value_instancetype js_value_SCNParticlePropertyController

NSCNParticlePropertyController::NSCNParticlePropertyController() {}
NSCNParticlePropertyController::~NSCNParticlePropertyController() {}

JS_INIT_CLASS(SCNParticlePropertyController, NSObject);
  JS_ASSIGN_STATIC_METHOD(controllerWithAnimation);
  JS_ASSIGN_PROTO_PROP(animation);
  JS_ASSIGN_PROTO_PROP(inputMode);
  JS_ASSIGN_PROTO_PROP(inputScale);
  JS_ASSIGN_PROTO_PROP(inputBias);
  JS_ASSIGN_PROTO_PROP(inputOrigin);
  JS_ASSIGN_PROTO_PROP(inputProperty);


  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNParticlePropertyController, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(SCNParticlePropertyController, NSObject);

NAN_METHOD(NSCNParticlePropertyController::New) {
  JS_RECONSTRUCT(SCNParticlePropertyController);
  @autoreleasepool {
    SCNParticlePropertyController* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNParticlePropertyController *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNParticlePropertyController alloc] init];
    }
    if (self) {
      NSCNParticlePropertyController *wrapper = new NSCNParticlePropertyController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNParticlePropertyController::New: invalid arguments");
    }
  }
}

#include "NCAAnimation.h"

NAN_METHOD(NSCNParticlePropertyController::controllerWithAnimation) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CAAnimation, animation);
    JS_SET_RETURN(js_value_instancetype([SCNParticlePropertyController controllerWithAnimation: animation]));
  }
}

NAN_GETTER(NSCNParticlePropertyController::animationGetter) {
  JS_UNWRAP(SCNParticlePropertyController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CAAnimation([self animation]));
  }
}

NAN_SETTER(NSCNParticlePropertyController::animationSetter) {
  JS_UNWRAP(SCNParticlePropertyController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(CAAnimation, input);
    [self setAnimation: input];
  }
}

#include "NSCNParticleSystem.h"

NAN_GETTER(NSCNParticlePropertyController::inputModeGetter) {
  JS_UNWRAP(SCNParticlePropertyController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNParticleInputMode([self inputMode]));
  }
}

NAN_SETTER(NSCNParticlePropertyController::inputModeSetter) {
  JS_UNWRAP(SCNParticlePropertyController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNParticleInputMode, input);
    [self setInputMode: input];
  }
}

NAN_GETTER(NSCNParticlePropertyController::inputScaleGetter) {
  JS_UNWRAP(SCNParticlePropertyController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self inputScale]));
  }
}

NAN_SETTER(NSCNParticlePropertyController::inputScaleSetter) {
  JS_UNWRAP(SCNParticlePropertyController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setInputScale: input];
  }
}

NAN_GETTER(NSCNParticlePropertyController::inputBiasGetter) {
  JS_UNWRAP(SCNParticlePropertyController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self inputBias]));
  }
}

NAN_SETTER(NSCNParticlePropertyController::inputBiasSetter) {
  JS_UNWRAP(SCNParticlePropertyController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setInputBias: input];
  }
}

#include "NSCNNode.h"

NAN_GETTER(NSCNParticlePropertyController::inputOriginGetter) {
  JS_UNWRAP(SCNParticlePropertyController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNNode([self inputOrigin]));
  }
}

NAN_SETTER(NSCNParticlePropertyController::inputOriginSetter) {
  JS_UNWRAP(SCNParticlePropertyController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNNode, input);
    [self setInputOrigin: input];
  }
}

NAN_GETTER(NSCNParticlePropertyController::inputPropertyGetter) {
  JS_UNWRAP(SCNParticlePropertyController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNParticleProperty([self inputProperty]));
  }
}

NAN_SETTER(NSCNParticlePropertyController::inputPropertySetter) {
  JS_UNWRAP(SCNParticlePropertyController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNParticleProperty, input);
    [self setInputProperty: input];
  }
}
