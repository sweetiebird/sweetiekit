//
//  NSKPhysicsContactDelegate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsContactDelegate_h
#define NSKPhysicsContactDelegate_h    

#include "NNSObject.h"

#define js_value_SKPhysicsContactDelegate(x) js_value_wrapper(x, SKPhysicsContactDelegate)
#define to_value_SKPhysicsContactDelegate(x) to_value_wrapper(x, SSKPhysicsContactDelegate)
#define is_value_SKPhysicsContactDelegate(x) JS_INSTANCEOF(x, SSKPhysicsContactDelegate)

JS_WRAP_CLASS(SKPhysicsContactDelegate, NSObject);
  JS_PROP(didBeginContact);
  JS_PROP(didEndContact);
  
  sweetiekit::JSFunction _didBeginContact;
  sweetiekit::JSFunction _didEndContact;
JS_WRAP_CLASS_END(SKPhysicsContactDelegate);

#endif /* NSKPhysicsContactDelegate_h */
