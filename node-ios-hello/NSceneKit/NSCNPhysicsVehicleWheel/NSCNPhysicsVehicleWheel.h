//
//  NSCNPhysicsVehicleWheel.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNPhysicsVehicleWheel_h
#define NSCNPhysicsVehicleWheel_h    

#include "NNSObject.h"

#define js_value_SCNPhysicsVehicleWheel(x) js_value_wrapper(x, SCNPhysicsVehicleWheel)
#define to_value_SCNPhysicsVehicleWheel(x) to_value_wrapper(x, SCNPhysicsVehicleWheel)
#define is_value_SCNPhysicsVehicleWheel(x) is_value_wrapper(x, SCNPhysicsVehicleWheel)

JS_WRAP_CLASS(SCNPhysicsVehicleWheel, NSObject);
  JS_STATIC_METHOD(wheelWithNode);
  JS_PROP_READONLY(node);
  JS_PROP(suspensionStiffness);
  JS_PROP(suspensionCompression);
  JS_PROP(suspensionDamping);
  JS_PROP(maximumSuspensionTravel);
  JS_PROP(frictionSlip);
  JS_PROP(maximumSuspensionForce);
  JS_PROP(connectionPosition);
  JS_PROP(steeringAxis);
  JS_PROP(axle);
  JS_PROP(radius);
  JS_PROP(suspensionRestLength);
JS_WRAP_CLASS_END(SCNPhysicsVehicleWheel);

#endif /* NSCNPhysicsVehicleWheel_h */
