//
//  NUIViewControllerTransitionCoordinatorContext.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIViewControllerTransitionCoordinatorContext.h"

#define instancetype UIViewControllerTransitionCoordinatorContext
#define js_value_instancetype js_value_UIViewControllerTransitionCoordinatorContext

NUIViewControllerTransitionCoordinatorContext::NUIViewControllerTransitionCoordinatorContext() {}
NUIViewControllerTransitionCoordinatorContext::~NUIViewControllerTransitionCoordinatorContext() {}

#include "NUIViewController.h"

JS_INIT_PROTOCOL(UIViewControllerTransitionCoordinatorContext, NSObject);
  JS_ASSIGN_PROTO_PROP(viewControllerForKey);
  JS_ASSIGN_PROTO_PROP(viewForKey);
  JS_ASSIGN_PROTO_PROP_READONLY(isAnimated);
  JS_ASSIGN_PROTO_PROP_READONLY(presentationStyle);
  JS_ASSIGN_PROTO_PROP_READONLY(initiallyInteractive);
  JS_ASSIGN_PROTO_PROP_READONLY(isInterruptible);
  JS_ASSIGN_PROTO_PROP_READONLY(isInteractive);
  JS_ASSIGN_PROTO_PROP_READONLY(isCancelled);
  JS_ASSIGN_PROTO_PROP_READONLY(transitionDuration);
  JS_ASSIGN_PROTO_PROP_READONLY(percentComplete);
  JS_ASSIGN_PROTO_PROP_READONLY(completionVelocity);
  JS_ASSIGN_PROTO_PROP_READONLY(completionCurve);
  JS_ASSIGN_PROTO_PROP_READONLY(containerView);
  JS_ASSIGN_PROTO_PROP_READONLY(targetTransform);

  // UIViewController (UINavigationControllerContextualToolbarItems)
  {
    JS_WITH_TYPE(UIViewController);
    JS_ASSIGN_PROTO_PROP_READONLY_AS(NUIViewController_UIViewControllerTransitionCoordinator::transitionCoordinator, "transitionCoordinator");
  }

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIViewControllerTransitionCoordinatorContext, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UIViewControllerTransitionCoordinatorContext, NSObject);

NAN_METHOD(NUIViewControllerTransitionCoordinatorContext::New) {
  JS_RECONSTRUCT_PROTOCOL(UIViewControllerTransitionCoordinatorContext);
  @autoreleasepool {
    id<UIViewControllerTransitionCoordinatorContext> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UIViewControllerTransitionCoordinatorContext>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UIViewControllerTransitionCoordinatorContext> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UIViewControllerTransitionCoordinatorContext, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UIViewControllerTransitionCoordinatorContextType alloc] init];
    }
    if (self) {
      NUIViewControllerTransitionCoordinatorContext *wrapper = new NUIViewControllerTransitionCoordinatorContext();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIViewControllerTransitionCoordinatorContext::New: invalid arguments");
    }
  }
}
#include "NUIViewControllerTransitionCoordinator.h"

NAN_GETTER(NUIViewController_UIViewControllerTransitionCoordinator::transitionCoordinatorGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewControllerTransitionCoordinator([self transitionCoordinator]));
  }
}

NAN_GETTER(NUIViewControllerTransitionCoordinatorContext::isAnimatedGetter) {
  JS_UNWRAP_PROTOCOL(UIViewControllerTransitionCoordinatorContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAnimated]));
  }
}

NAN_GETTER(NUIViewControllerTransitionCoordinatorContext::presentationStyleGetter) {
  JS_UNWRAP_PROTOCOL(UIViewControllerTransitionCoordinatorContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIModalPresentationStyle([self presentationStyle]));
  }
}

NAN_GETTER(NUIViewControllerTransitionCoordinatorContext::initiallyInteractiveGetter) {
  JS_UNWRAP_PROTOCOL(UIViewControllerTransitionCoordinatorContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self initiallyInteractive]));
  }
}

NAN_GETTER(NUIViewControllerTransitionCoordinatorContext::isInterruptibleGetter) {
  JS_UNWRAP_PROTOCOL(UIViewControllerTransitionCoordinatorContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isInterruptible]));
  }
}

NAN_GETTER(NUIViewControllerTransitionCoordinatorContext::isInteractiveGetter) {
  JS_UNWRAP_PROTOCOL(UIViewControllerTransitionCoordinatorContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isInteractive]));
  }
}

NAN_GETTER(NUIViewControllerTransitionCoordinatorContext::isCancelledGetter) {
  JS_UNWRAP_PROTOCOL(UIViewControllerTransitionCoordinatorContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isCancelled]));
  }
}

NAN_GETTER(NUIViewControllerTransitionCoordinatorContext::transitionDurationGetter) {
  JS_UNWRAP_PROTOCOL(UIViewControllerTransitionCoordinatorContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self transitionDuration]));
  }
}

NAN_GETTER(NUIViewControllerTransitionCoordinatorContext::percentCompleteGetter) {
  JS_UNWRAP_PROTOCOL(UIViewControllerTransitionCoordinatorContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self percentComplete]));
  }
}

NAN_GETTER(NUIViewControllerTransitionCoordinatorContext::completionVelocityGetter) {
  JS_UNWRAP_PROTOCOL(UIViewControllerTransitionCoordinatorContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self completionVelocity]));
  }
}

#include "NUIView.h"

NAN_GETTER(NUIViewControllerTransitionCoordinatorContext::completionCurveGetter) {
  JS_UNWRAP_PROTOCOL(UIViewControllerTransitionCoordinatorContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewAnimationCurve([self completionCurve]));
  }
}

NAN_GETTER(NUIViewControllerTransitionCoordinatorContext::containerViewGetter) {
  JS_UNWRAP_PROTOCOL(UIViewControllerTransitionCoordinatorContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self containerView]));
  }
}

NAN_GETTER(NUIViewControllerTransitionCoordinatorContext::targetTransformGetter) {
  JS_UNWRAP_PROTOCOL(UIViewControllerTransitionCoordinatorContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGAffineTransform([self targetTransform]));
  }
}


DELEGATE_PROTOCOL_PROP(UIViewControllerTransitionCoordinatorContext, viewControllerForKey);
DELEGATE_PROTOCOL_PROP(UIViewControllerTransitionCoordinatorContext, viewForKey);

@implementation UIViewControllerTransitionCoordinatorContextType

// Currently only two keys are defined by the system:
//   UITransitionContextToViewControllerKey
//   UITransitionContextFromViewControllerKey
- (nullable __kindof UIViewController *)viewControllerForKey:(UITransitionContextViewControllerKey)key
{
  __block UIViewController* result = nil;
  call_delegate(result = is_value_UIViewController(JS_RESULT) ? to_value_UIViewController(JS_RESULT) : result, viewControllerForKey,
    js_value_UITransitionContextViewControllerKey(key));
  return result;
}

// Currently only two keys are defined by the system:
//   UITransitionContextToViewKey
//   UITransitionContextFromViewKey
- (nullable __kindof UIView *)viewForKey:(UITransitionContextViewKey)key NS_AVAILABLE_IOS(8_0)
{
  __block UIView* result = nil;
  call_delegate(result = is_value_UIView(JS_RESULT) ? to_value_UIView(JS_RESULT) : result, viewForKey,
    js_value_UITransitionContextViewControllerKey(key));
  return result;
}

@end
