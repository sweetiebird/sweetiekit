//
//  NSKTransition.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKTransition_h
#define NSKTransition_h    

#include "NNSObject.h"

#define js_value_SKTransition(x) js_value_wrapper(x, SKTransition)
#define to_value_SKTransition(x) to_value_wrapper(x, SKTransition)
#define is_value_SKTransition(x) is_value_wrapper(x, SKTransition)

#define js_value_SKTransitionDirection(x) JS_ENUM(SKTransitionDirection, NSInteger, x)
#define to_value_SKTransitionDirection(x) TO_ENUM(SKTransitionDirection, NSInteger, x)
#define is_value_SKTransitionDirection(x) IS_ENUM(SKTransitionDirection, NSInteger, x)

JS_WRAP_CLASS(SKTransition, NSObject);
  JS_STATIC_METHOD(crossFadeWithDuration);
  JS_STATIC_METHOD(fadeWithDuration);
  JS_STATIC_METHOD(fadeWithColorDuration);
  JS_STATIC_METHOD(flipHorizontalWithDuration);
  JS_STATIC_METHOD(flipVerticalWithDuration);
  JS_STATIC_METHOD(revealWithDirectionDuration);
  JS_STATIC_METHOD(moveInWithDirectionDuration);
  JS_STATIC_METHOD(pushWithDirectionDuration);
  JS_STATIC_METHOD(doorsOpenHorizontalWithDuration);
  JS_STATIC_METHOD(doorsOpenVerticalWithDuration);
  JS_STATIC_METHOD(doorsCloseHorizontalWithDuration);
  JS_STATIC_METHOD(doorsCloseVerticalWithDuration);
  JS_STATIC_METHOD(doorwayWithDuration);
  JS_STATIC_METHOD(transitionWithCIFilterDuration);
  JS_PROP(pausesIncomingScene);
  JS_PROP(pausesOutgoingScene);
JS_WRAP_CLASS_END(SKTransition);

#endif /* NSKTransition_h */
