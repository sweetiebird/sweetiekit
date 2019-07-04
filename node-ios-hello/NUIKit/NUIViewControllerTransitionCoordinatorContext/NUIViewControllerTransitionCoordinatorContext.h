//
//  NUIViewControllerTransitionCoordinatorContext.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIViewControllerTransitionCoordinatorContext_h
#define NUIViewControllerTransitionCoordinatorContext_h    

#include "NNSObject.h"

#define js_value_UIViewControllerTransitionCoordinatorContext(x) js_protocol_wrapper(x, UIViewControllerTransitionCoordinatorContext)
#define to_value_UIViewControllerTransitionCoordinatorContext(x) to_protocol_wrapper(x, UIViewControllerTransitionCoordinatorContext)
#define is_value_UIViewControllerTransitionCoordinatorContext(x) is_protocol_wrapper(x, UIViewControllerTransitionCoordinatorContext)

#define js_value_UITransitionContextViewControllerKey(x) JS_ENUM(UITransitionContextViewControllerKey, NSString, x)
#define to_value_UITransitionContextViewControllerKey(x) TO_ENUM(UITransitionContextViewControllerKey, NSString, x)
#define is_value_UITransitionContextViewControllerKey(x) IS_ENUM(UITransitionContextViewControllerKey, NSString, x)

#define js_value_UITransitionContextViewKey(x) JS_ENUM(UITransitionContextViewKey, NSString, x)
#define to_value_UITransitionContextViewKey(x) TO_ENUM(UITransitionContextViewKey, NSString, x)
#define is_value_UITransitionContextViewKey(x) IS_ENUM(UITransitionContextViewKey, NSString, x)

JS_WRAP_PROTOCOL(UIViewControllerTransitionCoordinatorContext, NSObject);
  JS_PROP(viewControllerForKey);
  JS_PROP(viewForKey);
  JS_PROP_READONLY(isAnimated);
  JS_PROP_READONLY(presentationStyle);
  JS_PROP_READONLY(initiallyInteractive);
  JS_PROP_READONLY(isInterruptible);
  JS_PROP_READONLY(isInteractive);
  JS_PROP_READONLY(isCancelled);
  JS_PROP_READONLY(transitionDuration);
  JS_PROP_READONLY(percentComplete);
  JS_PROP_READONLY(completionVelocity);
  JS_PROP_READONLY(completionCurve);
  JS_PROP_READONLY(containerView);
  JS_PROP_READONLY(targetTransform);
JS_WRAP_PROTOCOL_END(UIViewControllerTransitionCoordinatorContext, NSObject);

JS_EXTEND_CLASS(UIViewController, UIViewControllerTransitionCoordinator);
  JS_PROP_READONLY(transitionCoordinator);
JS_EXTEND_CLASS_END(UIViewController, UIViewControllerTransitionCoordinator);

#if __OBJC__
@interface UIViewControllerTransitionCoordinatorContextType : NSObject<UIViewControllerTransitionCoordinatorContext>

// Most of the time isAnimated will be YES. For custom transitions that use the
// new UIModalPresentationCustom presentation type we invoke the
// animateTransition: even though the transition is not animated. (This allows
// the custom transition to add or remove subviews to the container view.)
#if UIKIT_DEFINE_AS_PROPERTIES
@property(nonatomic, readonly, getter=isAnimated) BOOL animated;
#else
- (BOOL)isAnimated;
#endif

// A modal presentation style whose transition is being customized or UIModaPresentationNone if this is not a modal presentation
// or dismissal.
#if UIKIT_DEFINE_AS_PROPERTIES
@property(nonatomic, readonly) UIModalPresentationStyle presentationStyle;
#else
- (UIModalPresentationStyle)presentationStyle;
#endif

/// initiallyInteractive indicates whether the transition was initiated as an interactive transition.
/// It never changes during the course of a transition.
/// It can only be YES if isAnimated is YES.
///If it is NO, then isInteractive can only be YES if isInterruptible is YES
#if UIKIT_DEFINE_AS_PROPERTIES
@property(nonatomic, readonly) BOOL initiallyInteractive;
#else
- (BOOL)initiallyInteractive;
#endif
@property(nonatomic,readonly) BOOL isInterruptible NS_AVAILABLE_IOS(10_0);

// Interactive transitions have non-interactive segments. For example, they all complete non-interactively. Some interactive transitions may have
// intermediate segments that are not interactive.
#if UIKIT_DEFINE_AS_PROPERTIES
@property(nonatomic, readonly, getter=isInteractive) BOOL interactive;
#else
- (BOOL)isInteractive;
#endif

// isCancelled is usually NO. It is only set to YES for an interactive transition that was cancelled.
#if UIKIT_DEFINE_AS_PROPERTIES
@property(nonatomic, readonly, getter=isCancelled) BOOL cancelled;
#else
- (BOOL)isCancelled;
#endif

// The full expected duration of the transition if it is run non-interactively. 
#if UIKIT_DEFINE_AS_PROPERTIES
@property(nonatomic, readonly) NSTimeInterval transitionDuration;
#else
- (NSTimeInterval)transitionDuration;
#endif

// These three methods are potentially meaningful for interactive transitions that are
// completing. It reports the percent complete of the transition when it moves
// to the non-interactive completion phase of the transition.
#if UIKIT_DEFINE_AS_PROPERTIES
@property(nonatomic, readonly) CGFloat percentComplete;
@property(nonatomic, readonly) CGFloat completionVelocity;
@property(nonatomic, readonly) UIViewAnimationCurve completionCurve;
#else
- (CGFloat)percentComplete;
- (CGFloat)completionVelocity;
- (UIViewAnimationCurve)completionCurve;
#endif

// Currently only two keys are defined by the system:
//   UITransitionContextToViewControllerKey
//   UITransitionContextFromViewControllerKey
- (nullable __kindof UIViewController *)viewControllerForKey:(UITransitionContextViewControllerKey)key;

// Currently only two keys are defined by the system:
//   UITransitionContextToViewKey
//   UITransitionContextFromViewKey
- (nullable __kindof UIView *)viewForKey:(UITransitionContextViewKey)key NS_AVAILABLE_IOS(8_0);

// The view in which the animated transition is taking place.
#if UIKIT_DEFINE_AS_PROPERTIES
@property(nonatomic, readonly) UIView *containerView;
#else
- (UIView *)containerView;
#endif

// This is either CGAffineTransformIdentity (indicating no rotation), or a rotation transform of +90, -90, or 180.
#if UIKIT_DEFINE_AS_PROPERTIES
@property(nonatomic, readonly) CGAffineTransform targetTransform NS_AVAILABLE_IOS(8_0);
#else
- (CGAffineTransform)targetTransform NS_AVAILABLE_IOS(8_0);
#endif

@end
#endif

#endif /* NUIViewControllerTransitionCoordinatorContext_h */
