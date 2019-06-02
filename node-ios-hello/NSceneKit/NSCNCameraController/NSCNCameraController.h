//
//  NSCNCameraController.h
//
//  Created by Shawn Presser on 6/2/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNCameraController_h
#define NSCNCameraController_h    

#include "NNSObject.h"

#define js_value_SCNCameraController(x) js_value_wrapper(x, SCNCameraController)
#define to_value_SCNCameraController(x) to_value_wrapper(x, SCNCameraController)
#define is_value_SCNCameraController(x) is_value_wrapper(x, SCNCameraController)

// SceneKit enums
#define js_value_SCNInteractionMode(x) JS_ENUM(SCNInteractionMode, NSInteger, x)
#define to_value_SCNInteractionMode(x) TO_ENUM(SCNInteractionMode, NSInteger, x)
#define is_value_SCNInteractionMode(x) IS_ENUM(SCNInteractionMode, NSInteger, x)

JS_WRAP_CLASS(SCNCameraController, NSObject);
  JS_PROP(delegate);
  JS_PROP(pointOfView);
  JS_PROP(interactionMode);
  JS_PROP(target);
  JS_PROP(automaticTarget);
  JS_PROP(worldUp);
  JS_PROP(inertiaEnabled);
  JS_PROP(inertiaFriction);
  JS_PROP_READONLY(inertiaRunning);
  JS_PROP(minimumVerticalAngle);
  JS_PROP(maximumVerticalAngle);
  JS_PROP(minimumHorizontalAngle);
  JS_PROP(maximumHorizontalAngle);
JS_WRAP_CLASS_END(SCNCameraController);

#endif /* NSCNCameraController_h */
