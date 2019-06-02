//
//  NSKPhysicsContact.h
//  node-ios-hello
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
  JS_PROP(bodyA);
  JS_PROP(bodyB);
JS_WRAP_CLASS_END(SKPhysicsContact);

#endif /* NSKPhysicsContact_h */
