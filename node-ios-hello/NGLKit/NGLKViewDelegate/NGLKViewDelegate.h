//
//  NGLKViewDelegate.h
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGLKViewDelegate_h
#define NGLKViewDelegate_h    

#include "NNSObject.h"

#import <GLKit/GLKView.h>

#define js_value_GLKViewDelegate(x) js_protocol_wrapper(x, GLKViewDelegate)
#define to_value_GLKViewDelegate(x) to_protocol_wrapper(x, GLKViewDelegate)
#define is_value_GLKViewDelegate(x) is_protocol_wrapper(x, GLKViewDelegate)

JS_WRAP_PROTOCOL(GLKViewDelegate, NSObject);
  JS_PROP(glkViewDrawInRect);
JS_WRAP_PROTOCOL_END(GLKViewDelegate, NSObject);

#if __OBJC__
@interface GLKViewDelegateType : NSObject<GLKViewDelegate>

/*
 Required method for implementing GLKViewDelegate. This draw method variant should be used when not subclassing GLKView.
 This method will not be called if the GLKView object has been subclassed and implements -(void)drawRect:(CGRect)rect.
 */
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect;

@end
#endif

#endif /* NGLKViewDelegate_h */
