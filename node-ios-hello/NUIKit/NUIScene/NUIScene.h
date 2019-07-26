//
//  NUIScene.h
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIScene_h
#define NUIScene_h    

#include "NUIResponder.h"

#define js_value_UIScene(x) js_value_wrapper(x, UIScene)
#define to_value_UIScene(x) to_value_wrapper(x, UIScene)
#define is_value_UIScene(x) is_value_wrapper(x, UIScene)

JS_WRAP_CLASS(UIScene, UIResponder);
  JS_METHOD(initWithSessionConnectionOptions);
  JS_METHOD(openURLOptionsCompletionHandler);
  JS_PROP_READONLY(session);
  JS_PROP(delegate);
  JS_PROP_READONLY(activationState);
  JS_PROP(title);
  JS_PROP(activationConditions);
JS_WRAP_CLASS_END(UIScene);

#endif /* NUIScene_h */
