//
//  NSKPhysicsWorld.h
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsWorld_h
#define NSKPhysicsWorld_h    

#include "NNSObject.h"

#define js_value_SKPhysicsWorld(x) js_value_wrapper(x, SKPhysicsWorld)
#define to_value_SKPhysicsWorld(x) to_value_wrapper(x, SKPhysicsWorld)
#define is_value_SKPhysicsWorld(x) is_value_wrapper(x, SKPhysicsWorld)

JS_WRAP_CLASS(SKPhysicsWorld, NSObject);
  JS_PROP(gravity);
  JS_PROP(speed);
  JS_PROP(contactDelegate);
JS_WRAP_CLASS_END(SKPhysicsWorld);

#endif /* NSKPhysicsWorld_h */
