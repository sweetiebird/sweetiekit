//
//  NGLKViewControllerDelegate.mm
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NGLKViewControllerDelegate.h"

#if TARGET_OS_IPHONE

#define instancetype GLKViewControllerDelegate
#define js_value_instancetype js_value_GLKViewControllerDelegate

NGLKViewControllerDelegate::NGLKViewControllerDelegate() {}
NGLKViewControllerDelegate::~NGLKViewControllerDelegate() {}

JS_INIT_PROTOCOL(GLKViewControllerDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(glkViewControllerUpdate);
  JS_ASSIGN_PROTO_PROP(glkViewControllerWillPause);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(GLKViewControllerDelegate, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(GLKViewControllerDelegate, NSObject);


NAN_METHOD(NGLKViewControllerDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(GLKViewControllerDelegate);
  @autoreleasepool {
    id<GLKViewControllerDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<GLKViewControllerDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<GLKViewControllerDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], GLKViewControllerDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[GLKViewControllerDelegateType alloc] init];
    }
    if (self) {
      NGLKViewControllerDelegate *wrapper = new NGLKViewControllerDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("GLKViewControllerDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(GLKViewControllerDelegate, glkViewControllerUpdate);
DELEGATE_PROTOCOL_PROP(GLKViewControllerDelegate, glkViewControllerWillPause);

#include "NGLKViewController.h"

@implementation GLKViewControllerDelegateType

/*
 Required method for implementing GLKViewControllerDelegate. This update method variant should be used
 when not subclassing GLKViewController. This method will not be called if the GLKViewController object
 has been subclassed and implements -(void)update.
 */
- (void)glkViewControllerUpdate:(GLKViewController *)controller
{
  call_delegate_async(noop(), glkViewControllerUpdate,
    js_value_GLKViewController(controller));
}

/*
 Delegate method that gets called when the pause state changes. 
 */
- (void)glkViewController:(GLKViewController *)controller willPause:(BOOL)pause {
  call_delegate_async(noop(), glkViewControllerUpdate,
    js_value_GLKViewController(controller),
    js_value_BOOL(pause));
}

@end

#endif
