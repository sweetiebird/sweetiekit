//
//  NSCNPhysicsVehicle.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNPhysicsVehicle_h
#define NSCNPhysicsVehicle_h    

#include "NSCNPhysicsBehavior.h"

#define js_value_SCNPhysicsVehicle(x) js_value_wrapper(x, SCNPhysicsVehicle)
#define to_value_SCNPhysicsVehicle(x) to_value_wrapper(x, SCNPhysicsVehicle)
#define is_value_SCNPhysicsVehicle(x) is_value_wrapper(x, SCNPhysicsVehicle)

JS_WRAP_CLASS(SCNPhysicsVehicle, SCNPhysicsBehavior);
  JS_STATIC_METHOD(vehicleWithChassisBodyWheels);
  JS_METHOD(applyEngineForceForWheelAtIndex);
  JS_METHOD(setSteeringAngleForWheelAtIndex);
  JS_METHOD(applyBrakingForceForWheelAtIndex);
  JS_PROP_READONLY(speedInKilometersPerHour);
  JS_PROP_READONLY(wheels);
  JS_PROP_READONLY(chassisBody);
JS_WRAP_CLASS_END(SCNPhysicsVehicle);

#endif /* NSCNPhysicsVehicle_h */
