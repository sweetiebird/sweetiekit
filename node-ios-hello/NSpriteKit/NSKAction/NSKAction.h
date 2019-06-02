//
//  NSKAction.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKAction_h
#define NSKAction_h    

#include "NNSObject.h"

#define js_value_SKAction(x) js_value_wrapper(x, SKAction)
#define to_value_SKAction(x) to_value_wrapper(x, SKAction)
#define is_value_SKAction(x) is_value_wrapper(x, SKAction)

JS_WRAP_CLASS(SKAction, NSObject);
  JS_METHOD(moveTo);
  JS_METHOD(removeFromParent);
  JS_METHOD(sequence);
  JS_METHOD(waitForDuration);
  JS_METHOD(moveBy);
  JS_METHOD(scaleBy);
  JS_METHOD(group);
JS_WRAP_CLASS_END(SKAction);

#endif /* NSKAction_h */
