//
//  NGLKViewControllerDelegate.h
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGLKViewControllerDelegate_h
#define NGLKViewControllerDelegate_h  

#include "NNSObject.h"

#if TARGET_OS_IPHONE

#import <GLKit/GLKViewController.h>

#define js_value_GLKViewControllerDelegate(x) js_protocol_wrapper(x, GLKViewControllerDelegate)
#define to_value_GLKViewControllerDelegate(x) to_protocol_wrapper(x, GLKViewControllerDelegate)
#define is_value_GLKViewControllerDelegate(x) is_protocol_wrapper(x, GLKViewControllerDelegate)

JS_WRAP_PROTOCOL(GLKViewControllerDelegate, NSObject);
  JS_PROP(glkViewControllerUpdate);
  JS_PROP(glkViewControllerWillPause);
JS_WRAP_PROTOCOL_END(GLKViewControllerDelegate, NSObject);

#if __OBJC__
@interface GLKViewControllerDelegateType : NSObject<GLKViewControllerDelegate>

/*
 Required method for implementing GLKViewControllerDelegate. This update method variant should be used
 when not subclassing GLKViewController. This method will not be called if the GLKViewController object
 has been subclassed and implements -(void)update.
 */
- (void)glkViewControllerUpdate:(GLKViewController *)controller;

/*
 Delegate method that gets called when the pause state changes. 
 */
- (void)glkViewController:(GLKViewController *)controller willPause:(BOOL)pause;

@end
#endif

#endif // #if TARGET_OS_IPHONE

#endif /* NGLKViewControllerDelegate_h */
