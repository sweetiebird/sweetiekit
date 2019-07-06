//
//  NUIViewControllerTransitionCoordinator.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIViewControllerTransitionCoordinator.h"

#define instancetype UIViewControllerTransitionCoordinator
#define js_value_instancetype js_value_UIViewControllerTransitionCoordinator

NUIViewControllerTransitionCoordinator::NUIViewControllerTransitionCoordinator() {}
NUIViewControllerTransitionCoordinator::~NUIViewControllerTransitionCoordinator() {}

JS_INIT_PROTOCOL(UIViewControllerTransitionCoordinator, UIViewControllerTransitionCoordinatorContext);
  JS_ASSIGN_PROTO_PROP(animateAlongsideTransitionCompletion);
  JS_ASSIGN_PROTO_PROP(animateAlongsideTransitionInViewAnimationCompletion);
  JS_ASSIGN_PROTO_PROP(notifyWhenInteractionEndsUsingBlock);
  JS_ASSIGN_PROTO_PROP(notifyWhenInteractionChangesUsingBlock);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIViewControllerTransitionCoordinator, UIViewControllerTransitionCoordinatorContext);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UIViewControllerTransitionCoordinator, UIViewControllerTransitionCoordinatorContext);

NAN_METHOD(NUIViewControllerTransitionCoordinator::New) {
  JS_RECONSTRUCT_PROTOCOL(UIViewControllerTransitionCoordinator);
  @autoreleasepool {
    id<UIViewControllerTransitionCoordinator> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UIViewControllerTransitionCoordinator>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UIViewControllerTransitionCoordinator> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UIViewControllerTransitionCoordinator, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UIViewControllerTransitionCoordinatorType alloc] init];
    }
    if (self) {
      NUIViewControllerTransitionCoordinator *wrapper = new NUIViewControllerTransitionCoordinator();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIViewControllerTransitionCoordinator::New: invalid arguments");
    }
  }
}


DELEGATE_PROTOCOL_PROP(UIViewControllerTransitionCoordinator, animateAlongsideTransitionCompletion);
DELEGATE_PROTOCOL_PROP(UIViewControllerTransitionCoordinator, animateAlongsideTransitionInViewAnimationCompletion);
DELEGATE_PROTOCOL_PROP(UIViewControllerTransitionCoordinator, notifyWhenInteractionEndsUsingBlock);
DELEGATE_PROTOCOL_PROP(UIViewControllerTransitionCoordinator, notifyWhenInteractionChangesUsingBlock);

@implementation UIViewControllerTransitionCoordinatorType

// Any animations specified will be run in the same animation context as the
// transition. If the animations are occurring in a view that is a not
// descendent of the containerView, then an ancestor view in which all of the
// animations are occuring should be specified.  The completionBlock is invoked
// after the transition completes. (Note that this may not be after all the
// animations specified by to call complete if the duration is not inherited.)
// It is perfectly legitimate to only specify a completion block. This method
// returns YES if the animations are successfully queued to run. The completions
// may be run even if the animations are not. Note that for transitioning
// animators that are not implemented with UIView animations, the alongside
// animations will be run just after their animateTransition: method returns.
//
- (BOOL)animateAlongsideTransition:(void (^ __nullable)(id <UIViewControllerTransitionCoordinatorContext>context))animation
                        completion:(void (^ __nullable)(id <UIViewControllerTransitionCoordinatorContext>context))completion
{
  __block BOOL result = YES; // TODO: unsure about this default value.
  // TODO
  return result;
}

// This alternative API is needed if the view is not a descendent of the container view AND you require this animation
// to be driven by a UIPercentDrivenInteractiveTransition interaction controller.
- (BOOL)animateAlongsideTransitionInView:(nullable UIView *)view
                               animation:(void (^ __nullable)(id <UIViewControllerTransitionCoordinatorContext>context))animation
                              completion:(void (^ __nullable)(id <UIViewControllerTransitionCoordinatorContext>context))completion
{
  __block BOOL result = YES; // TODO: unsure about this default value.
  // TODO
  return result;
}

// When a transition changes from interactive to non-interactive then handler is
// invoked. The handler will typically then do something depending on whether or
// not the transition isCancelled. Note that only interactive transitions can
// be cancelled and all interactive transitions complete as non-interactive
// ones. In general, when a transition is cancelled the view controller that was
// appearing will receive a viewWillDisappear: call, and the view controller
// that was disappearing will receive a viewWillAppear: call.  This handler is
// invoked BEFORE the "will" method calls are made.
- (void)notifyWhenInteractionEndsUsingBlock: (void (^)(id <UIViewControllerTransitionCoordinatorContext>context))handler NS_DEPRECATED_IOS(7_0, 10_0,"Use notifyWhenInteractionChangesUsingBlock")
{
  // TODO
}

// This method behavior is identical to the method above. On 10.0, however, the behavior has
// changed slightly to account for the fact that transitions can be interruptible. For interruptible transitions
// The block may be called multiple times. It is called each time the transition moves from an interactive to a 
// non-interactive state and vice-versa. The block is now also retained until the transition has completed.
- (void)notifyWhenInteractionChangesUsingBlock: (void (^)(id <UIViewControllerTransitionCoordinatorContext>context))handler NS_AVAILABLE_IOS(10_0)
{
  // TODO
}

@end
