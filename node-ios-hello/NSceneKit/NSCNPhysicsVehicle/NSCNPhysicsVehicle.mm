//
//  NSCNPhysicsVehicle.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNPhysicsVehicle.h"

#define instancetype SCNPhysicsVehicle
#define js_value_instancetype js_value_SCNPhysicsVehicle

NSCNPhysicsVehicle::NSCNPhysicsVehicle() {}
NSCNPhysicsVehicle::~NSCNPhysicsVehicle() {}

JS_INIT_CLASS(SCNPhysicsVehicle, SCNPhysicsBehavior);
  JS_ASSIGN_STATIC_METHOD(vehicleWithChassisBodyWheels);
  JS_ASSIGN_PROTO_METHOD(applyEngineForceForWheelAtIndex);
  JS_ASSIGN_PROTO_METHOD(setSteeringAngleForWheelAtIndex);
  JS_ASSIGN_PROTO_METHOD(applyBrakingForceForWheelAtIndex);
  JS_ASSIGN_PROTO_PROP_READONLY(speedInKilometersPerHour);
  JS_ASSIGN_PROTO_PROP_READONLY(wheels);
  JS_ASSIGN_PROTO_PROP_READONLY(chassisBody);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNPhysicsVehicle, SCNPhysicsBehavior);
  // constant values (exports)
JS_INIT_CLASS_END(SCNPhysicsVehicle, SCNPhysicsBehavior);

NAN_METHOD(NSCNPhysicsVehicle::New) {
  JS_RECONSTRUCT(SCNPhysicsVehicle);
  @autoreleasepool {
    SCNPhysicsVehicle* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNPhysicsVehicle *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNPhysicsVehicle alloc] init];
    }
    if (self) {
      NSCNPhysicsVehicle *wrapper = new NSCNPhysicsVehicle();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNPhysicsVehicle::New: invalid arguments");
    }
  }
}

#include "NSCNPhysicsBody.h"

NAN_METHOD(NSCNPhysicsVehicle::vehicleWithChassisBodyWheels) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNPhysicsBody, chassisBody);
    declare_pointer(NSArray<SCNPhysicsVehicleWheel*>, wheels);
    JS_SET_RETURN(js_value_instancetype([SCNPhysicsVehicle vehicleWithChassisBody: chassisBody wheels: wheels]));
  }
}

NAN_METHOD(NSCNPhysicsVehicle::applyEngineForceForWheelAtIndex) {
  JS_UNWRAP(SCNPhysicsVehicle, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, value);
    declare_value(NSInteger, index);
    [self applyEngineForce: value forWheelAtIndex: index];
  }
}

NAN_METHOD(NSCNPhysicsVehicle::setSteeringAngleForWheelAtIndex) {
  JS_UNWRAP(SCNPhysicsVehicle, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, value);
    declare_value(NSInteger, index);
    [self setSteeringAngle: value forWheelAtIndex: index];
  }
}

NAN_METHOD(NSCNPhysicsVehicle::applyBrakingForceForWheelAtIndex) {
  JS_UNWRAP(SCNPhysicsVehicle, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, value);
    declare_value(NSInteger, index);
    [self applyBrakingForce: value forWheelAtIndex: index];
  }
}

NAN_GETTER(NSCNPhysicsVehicle::speedInKilometersPerHourGetter) {
  JS_UNWRAP(SCNPhysicsVehicle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self speedInKilometersPerHour]));
  }
}

NAN_GETTER(NSCNPhysicsVehicle::wheelsGetter) {
  JS_UNWRAP(SCNPhysicsVehicle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SCNPhysicsVehicleWheel*>([self wheels]));
  }
}

NAN_GETTER(NSCNPhysicsVehicle::chassisBodyGetter) {
  JS_UNWRAP(SCNPhysicsVehicle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsBody([self chassisBody]));
  }
}
