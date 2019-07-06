//
//  NUIViewControllerTransitionCoordinator.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIViewControllerTransitionCoordinator_h
#define NUIViewControllerTransitionCoordinator_h    

#include "NUIViewControllerTransitionCoordinatorContext.h"

#define js_value_UIViewControllerTransitionCoordinator(x) js_protocol_wrapper(x, UIViewControllerTransitionCoordinator)
#define to_value_UIViewControllerTransitionCoordinator(x) to_protocol_wrapper(x, UIViewControllerTransitionCoordinator)
#define is_value_UIViewControllerTransitionCoordinator(x) is_protocol_wrapper(x, UIViewControllerTransitionCoordinator)

JS_WRAP_PROTOCOL(UIViewControllerTransitionCoordinator, UIViewControllerTransitionCoordinatorContext);
  JS_PROP(animateAlongsideTransitionCompletion);
  JS_PROP(animateAlongsideTransitionInViewAnimationCompletion);
  JS_PROP(notifyWhenInteractionEndsUsingBlock);
  JS_PROP(notifyWhenInteractionChangesUsingBlock);
JS_WRAP_PROTOCOL_END(UIViewControllerTransitionCoordinator, UIViewControllerTransitionCoordinatorContext);

#if __OBJC__
@interface UIViewControllerTransitionCoordinatorType : UIViewControllerTransitionCoordinatorContextType<UIViewControllerTransitionCoordinator>

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
                        completion:(void (^ __nullable)(id <UIViewControllerTransitionCoordinatorContext>context))completion;

// This alternative API is needed if the view is not a descendent of the container view AND you require this animation
// to be driven by a UIPercentDrivenInteractiveTransition interaction controller.
- (BOOL)animateAlongsideTransitionInView:(nullable UIView *)view
                               animation:(void (^ __nullable)(id <UIViewControllerTransitionCoordinatorContext>context))animation
                              completion:(void (^ __nullable)(id <UIViewControllerTransitionCoordinatorContext>context))completion;

// When a transition changes from interactive to non-interactive then handler is
// invoked. The handler will typically then do something depending on whether or
// not the transition isCancelled. Note that only interactive transitions can
// be cancelled and all interactive transitions complete as non-interactive
// ones. In general, when a transition is cancelled the view controller that was
// appearing will receive a viewWillDisappear: call, and the view controller
// that was disappearing will receive a viewWillAppear: call.  This handler is
// invoked BEFORE the "will" method calls are made.
- (void)notifyWhenInteractionEndsUsingBlock: (void (^)(id <UIViewControllerTransitionCoordinatorContext>context))handler NS_DEPRECATED_IOS(7_0, 10_0,"Use notifyWhenInteractionChangesUsingBlock");

// This method behavior is identical to the method above. On 10.0, however, the behavior has
// changed slightly to account for the fact that transitions can be interruptible. For interruptible transitions
// The block may be called multiple times. It is called each time the transition moves from an interactive to a 
// non-interactive state and vice-versa. The block is now also retained until the transition has completed.
- (void)notifyWhenInteractionChangesUsingBlock: (void (^)(id <UIViewControllerTransitionCoordinatorContext>context))handler NS_AVAILABLE_IOS(10_0);

@end
#endif

#endif /* NUIViewControllerTransitionCoordinator_h */
