//
//  NSKPhysicsContact.h
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsContact_h
#define NSKPhysicsContact_h    

#include "NNSObject.h"

#define js_value_SKPhysicsContact(x) js_value_wrapper(x, SKPhysicsContact)
#define to_value_SKPhysicsContact(x) to_value_wrapper(x, SKPhysicsContact)
#define is_value_SKPhysicsContact(x) is_value_wrapper(x, SKPhysicsContact)

JS_WRAP_CLASS(SKPhysicsContact, NSObject);
  JS_PROP_READONLY(bodyA);
  JS_PROP_READONLY(bodyB);
  JS_PROP_READONLY(contactPoint);
  JS_PROP_READONLY(contactNormal);
  JS_PROP_READONLY(collisionImpulse);
JS_WRAP_CLASS_END(SKPhysicsContact);

#endif /* NSKPhysicsContact_h */
