//
//  NSCNPhysicsVehicleWheel.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNPhysicsVehicleWheel.h"

#define instancetype SCNPhysicsVehicleWheel
#define js_value_instancetype js_value_SCNPhysicsVehicleWheel

NSCNPhysicsVehicleWheel::NSCNPhysicsVehicleWheel() {}
NSCNPhysicsVehicleWheel::~NSCNPhysicsVehicleWheel() {}

JS_INIT_CLASS(SCNPhysicsVehicleWheel, NSObject);
  JS_ASSIGN_STATIC_METHOD(wheelWithNode);
  JS_ASSIGN_PROTO_PROP_READONLY(node);
  JS_ASSIGN_PROTO_PROP(suspensionStiffness);
  JS_ASSIGN_PROTO_PROP(suspensionCompression);
  JS_ASSIGN_PROTO_PROP(suspensionDamping);
  JS_ASSIGN_PROTO_PROP(maximumSuspensionTravel);
  JS_ASSIGN_PROTO_PROP(frictionSlip);
  JS_ASSIGN_PROTO_PROP(maximumSuspensionForce);
  JS_ASSIGN_PROTO_PROP(connectionPosition);
  JS_ASSIGN_PROTO_PROP(steeringAxis);
  JS_ASSIGN_PROTO_PROP(axle);
  JS_ASSIGN_PROTO_PROP(radius);
  JS_ASSIGN_PROTO_PROP(suspensionRestLength);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNPhysicsVehicleWheel, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(SCNPhysicsVehicleWheel, NSObject);

NAN_METHOD(NSCNPhysicsVehicleWheel::New) {
  JS_RECONSTRUCT(SCNPhysicsVehicleWheel);
  @autoreleasepool {
    SCNPhysicsVehicleWheel* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNPhysicsVehicleWheel *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNPhysicsVehicleWheel alloc] init];
    }
    if (self) {
      NSCNPhysicsVehicleWheel *wrapper = new NSCNPhysicsVehicleWheel();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNPhysicsVehicleWheel::New: invalid arguments");
    }
  }
}

#include "NSCNNode.h"

NAN_METHOD(NSCNPhysicsVehicleWheel::wheelWithNode) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNNode, node);
    JS_SET_RETURN(js_value_instancetype([SCNPhysicsVehicleWheel wheelWithNode: node]));
  }
}

NAN_GETTER(NSCNPhysicsVehicleWheel::nodeGetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNNode([self node]));
  }
}

NAN_GETTER(NSCNPhysicsVehicleWheel::suspensionStiffnessGetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self suspensionStiffness]));
  }
}

NAN_SETTER(NSCNPhysicsVehicleWheel::suspensionStiffnessSetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSuspensionStiffness: input];
  }
}

NAN_GETTER(NSCNPhysicsVehicleWheel::suspensionCompressionGetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self suspensionCompression]));
  }
}

NAN_SETTER(NSCNPhysicsVehicleWheel::suspensionCompressionSetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSuspensionCompression: input];
  }
}

NAN_GETTER(NSCNPhysicsVehicleWheel::suspensionDampingGetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self suspensionDamping]));
  }
}

NAN_SETTER(NSCNPhysicsVehicleWheel::suspensionDampingSetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSuspensionDamping: input];
  }
}

NAN_GETTER(NSCNPhysicsVehicleWheel::maximumSuspensionTravelGetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self maximumSuspensionTravel]));
  }
}

NAN_SETTER(NSCNPhysicsVehicleWheel::maximumSuspensionTravelSetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMaximumSuspensionTravel: input];
  }
}

NAN_GETTER(NSCNPhysicsVehicleWheel::frictionSlipGetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self frictionSlip]));
  }
}

NAN_SETTER(NSCNPhysicsVehicleWheel::frictionSlipSetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setFrictionSlip: input];
  }
}

NAN_GETTER(NSCNPhysicsVehicleWheel::maximumSuspensionForceGetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self maximumSuspensionForce]));
  }
}

NAN_SETTER(NSCNPhysicsVehicleWheel::maximumSuspensionForceSetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMaximumSuspensionForce: input];
  }
}

NAN_GETTER(NSCNPhysicsVehicleWheel::connectionPositionGetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self connectionPosition]));
  }
}

NAN_SETTER(NSCNPhysicsVehicleWheel::connectionPositionSetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setConnectionPosition: input];
  }
}

NAN_GETTER(NSCNPhysicsVehicleWheel::steeringAxisGetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self steeringAxis]));
  }
}

NAN_SETTER(NSCNPhysicsVehicleWheel::steeringAxisSetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setSteeringAxis: input];
  }
}

NAN_GETTER(NSCNPhysicsVehicleWheel::axleGetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self axle]));
  }
}

NAN_SETTER(NSCNPhysicsVehicleWheel::axleSetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setAxle: input];
  }
}

NAN_GETTER(NSCNPhysicsVehicleWheel::radiusGetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self radius]));
  }
}

NAN_SETTER(NSCNPhysicsVehicleWheel::radiusSetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setRadius: input];
  }
}

NAN_GETTER(NSCNPhysicsVehicleWheel::suspensionRestLengthGetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self suspensionRestLength]));
  }
}

NAN_SETTER(NSCNPhysicsVehicleWheel::suspensionRestLengthSetter) {
  JS_UNWRAP(SCNPhysicsVehicleWheel, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSuspensionRestLength: input];
  }
}
