//
//  NGLKViewDelegate.mm
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NGLKViewDelegate.h"

#ifdef __IPHONEOS__

#define instancetype GLKViewDelegate
#define js_value_instancetype js_value_GLKViewDelegate

NGLKViewDelegate::NGLKViewDelegate() {}
NGLKViewDelegate::~NGLKViewDelegate() {}

JS_INIT_PROTOCOL(GLKViewDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(glkViewDrawInRect);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(GLKViewDelegate, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(GLKViewDelegate, NSObject);


NAN_METHOD(NGLKViewDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(GLKViewDelegate);
  @autoreleasepool {
    id<GLKViewDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<GLKViewDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<GLKViewDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], GLKViewDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[GLKViewDelegateType alloc] init];
    }
    if (self) {
      NGLKViewDelegate *wrapper = new NGLKViewDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("GLKViewDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(GLKViewDelegate, glkViewDrawInRect);

#include "NGLKView.h"

@implementation GLKViewDelegateType

/*
 Required method for implementing GLKViewDelegate. This draw method variant should be used when not subclassing GLKView.
 This method will not be called if the GLKView object has been subclassed and implements -(void)drawRect:(CGRect)rect.
 */
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
  call_delegate(noop(), glkViewDrawInRect,
    js_value_GLKView(view),
    js_value_CGRect(rect));
}

@end

#endif
