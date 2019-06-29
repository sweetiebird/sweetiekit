//
//  NGLKViewController.h
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGLKViewController_h
#define NGLKViewController_h    


#include "NNSObject.h"

#define js_value_GLKViewController(x) js_value_wrapper(x, GLKViewController)
#define to_value_GLKViewController(x) to_value_wrapper(x, GLKViewController)
#define is_value_GLKViewController(x) is_value_wrapper(x, GLKViewController)

JS_WRAP_CLASS(GLKViewController, NSObject);
  JS_PROP(delegate);
  JS_PROP(preferredFramesPerSecond);
  JS_PROP_READONLY(framesPerSecond);
  JS_PROP(isPaused);
  JS_PROP_READONLY(framesDisplayed);
  JS_PROP_READONLY(timeSinceFirstResume);
  JS_PROP_READONLY(timeSinceLastResume);
  JS_PROP_READONLY(timeSinceLastUpdate);
  JS_PROP_READONLY(timeSinceLastDraw);
  JS_PROP(pauseOnWillResignActive);
  JS_PROP(resumeOnDidBecomeActive);
JS_WRAP_CLASS_END(GLKViewController);

#endif /* NGLKViewController_h */
