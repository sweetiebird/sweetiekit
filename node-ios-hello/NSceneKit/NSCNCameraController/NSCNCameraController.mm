//
//  NSCNCameraController.mm
//
//  Created by Shawn Presser on 6/2/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNCameraController.h"

NSCNCameraController::NSCNCameraController() {}
NSCNCameraController::~NSCNCameraController() {}

JS_INIT_CLASS(SCNCameraController, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, delegate);
  JS_ASSIGN_PROP(proto, pointOfView);
  JS_ASSIGN_PROP(proto, interactionMode);
  JS_ASSIGN_PROP(proto, target);
  JS_ASSIGN_PROP(proto, automaticTarget);
  JS_ASSIGN_PROP(proto, worldUp);
  JS_ASSIGN_PROP(proto, inertiaEnabled);
  JS_ASSIGN_PROP(proto, inertiaFriction);
  JS_ASSIGN_PROP_READONLY(proto, inertiaRunning);
  JS_ASSIGN_PROP(proto, minimumVerticalAngle);
  JS_ASSIGN_PROP(proto, maximumVerticalAngle);
  JS_ASSIGN_PROP(proto, minimumHorizontalAngle);
  JS_ASSIGN_PROP(proto, maximumHorizontalAngle);
  // static members (ctor)
  JS_INIT_CTOR(SCNCameraController, NSObject);
JS_INIT_CLASS_END(SCNCameraController, NSObject);

NAN_METHOD(NSCNCameraController::New) {
  JS_RECONSTRUCT(SCNCameraController);
  @autoreleasepool {
    SCNCameraController* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNCameraController *)(info[0].As<External>()->Value());
    } else if(info.Length() <= 0) {
      self = [[SCNCameraController alloc] init];
    }
    if (self) {
      NSCNCameraController *wrapper = new NSCNCameraController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNCameraController::New: invalid arguments");
    }
  }
}

NAN_GETTER(NSCNCameraController::delegateGetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_id /*<SCNCameraControllerDelegate>*/([self delegate]));
    return;
  }
}

NAN_SETTER(NSCNCameraController::delegateSetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    [self setDelegate: to_value_id /*<SCNCameraControllerDelegate>*/(value)];
  }
}

#include "NSCNNode.h"

NAN_GETTER(NSCNCameraController::pointOfViewGetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNNode([self pointOfView]));
    return;
  }
}

NAN_SETTER(NSCNCameraController::pointOfViewSetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    [self setPointOfView: to_value_SCNNode(value)];
  }
}

NAN_GETTER(NSCNCameraController::interactionModeGetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNInteractionMode([self interactionMode]));
    return;
  }
}

NAN_SETTER(NSCNCameraController::interactionModeSetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    [self setInteractionMode: to_value_SCNInteractionMode(value)];
  }
}

NAN_GETTER(NSCNCameraController::targetGetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self target]));
    return;
  }
}

NAN_SETTER(NSCNCameraController::targetSetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    [self setTarget: to_value_SCNVector3(value)];
  }
}

NAN_GETTER(NSCNCameraController::automaticTargetGetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self automaticTarget]));
    return;
  }
}

NAN_SETTER(NSCNCameraController::automaticTargetSetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    [self setAutomaticTarget: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNCameraController::worldUpGetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self worldUp]));
    return;
  }
}

NAN_SETTER(NSCNCameraController::worldUpSetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    [self setWorldUp: to_value_SCNVector3(value)];
  }
}

NAN_GETTER(NSCNCameraController::inertiaEnabledGetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self inertiaEnabled]));
    return;
  }
}

NAN_SETTER(NSCNCameraController::inertiaEnabledSetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    [self setInertiaEnabled: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNCameraController::inertiaFrictionGetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_float([self inertiaFriction]));
    return;
  }
}

NAN_SETTER(NSCNCameraController::inertiaFrictionSetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    [self setInertiaFriction: to_value_float(value)];
  }
}

NAN_GETTER(NSCNCameraController::inertiaRunningGetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isInertiaRunning]));
    return;
  }
}

NAN_GETTER(NSCNCameraController::minimumVerticalAngleGetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_float([self minimumVerticalAngle]));
    return;
  }
}

NAN_SETTER(NSCNCameraController::minimumVerticalAngleSetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    [self setMinimumVerticalAngle: to_value_float(value)];
  }
}

NAN_GETTER(NSCNCameraController::maximumVerticalAngleGetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_float([self maximumVerticalAngle]));
    return;
  }
}

NAN_SETTER(NSCNCameraController::maximumVerticalAngleSetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    [self setMaximumVerticalAngle: to_value_float(value)];
  }
}

NAN_GETTER(NSCNCameraController::minimumHorizontalAngleGetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_float([self minimumHorizontalAngle]));
    return;
  }
}

NAN_SETTER(NSCNCameraController::minimumHorizontalAngleSetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    [self setMinimumHorizontalAngle: to_value_float(value)];
  }
}

NAN_GETTER(NSCNCameraController::maximumHorizontalAngleGetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_float([self maximumHorizontalAngle]));
    return;
  }
}

NAN_SETTER(NSCNCameraController::maximumHorizontalAngleSetter) {
  JS_UNWRAP(SCNCameraController, self);
  @autoreleasepool
  {
    [self setMaximumHorizontalAngle: to_value_float(value)];
  }
}

