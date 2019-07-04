//
//  NUIFocusAnimationCoordinator.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIFocusAnimationCoordinator_h
#define NUIFocusAnimationCoordinator_h    

#include "NNSObject.h"

#define js_value_UIFocusAnimationCoordinator(x) js_value_wrapper(x, UIFocusAnimationCoordinator)
#define to_value_UIFocusAnimationCoordinator(x) to_value_wrapper(x, UIFocusAnimationCoordinator)
#define is_value_UIFocusAnimationCoordinator(x) is_value_wrapper(x, UIFocusAnimationCoordinator)

JS_WRAP_CLASS(UIFocusAnimationCoordinator, NSObject);
  JS_METHOD(addCoordinatedAnimationsCompletion);
  JS_METHOD(addCoordinatedFocusingAnimationsCompletion);
  JS_METHOD(addCoordinatedUnfocusingAnimationsCompletion);
JS_WRAP_CLASS_END(UIFocusAnimationCoordinator);

#endif /* NUIFocusAnimationCoordinator_h */
