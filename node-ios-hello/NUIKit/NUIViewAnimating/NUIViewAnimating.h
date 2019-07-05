//
//  NUIViewAnimating.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIViewAnimating_h
#define NUIViewAnimating_h    

#include "NNSObject.h"

#define js_value_UIViewAnimating(x) js_protocol_wrapper(x, UIViewAnimating)
#define to_value_UIViewAnimating(x) to_protocol_wrapper(x, UIViewAnimating)
#define is_value_UIViewAnimating(x) is_protocol_wrapper(x, UIViewAnimating)

#define js_value_UIViewAnimatingState(x) JS_ENUM(UIViewAnimatingState, NSInteger, x)
#define to_value_UIViewAnimatingState(x) TO_ENUM(UIViewAnimatingState, NSInteger, x)
#define is_value_UIViewAnimatingState(x) IS_ENUM(UIViewAnimatingState, NSInteger, x)

#define js_value_UIViewAnimatingPosition(x) JS_ENUM(UIViewAnimatingPosition, NSInteger, x)
#define to_value_UIViewAnimatingPosition(x) TO_ENUM(UIViewAnimatingPosition, NSInteger, x)
#define is_value_UIViewAnimatingPosition(x) IS_ENUM(UIViewAnimatingPosition, NSInteger, x)

JS_WRAP_PROTOCOL(UIViewAnimating, NSObject);
  JS_PROP(startAnimation);
  JS_PROP(startAnimationAfterDelay);
  JS_PROP(pauseAnimation);
  JS_PROP(stopAnimation);
  JS_PROP(finishAnimationAtPosition);

  JS_METHOD(startAnimation);
  JS_METHOD(startAnimationAfterDelay);
  JS_METHOD(pauseAnimation);
  JS_METHOD(stopAnimation);
  JS_METHOD(finishAnimationAtPosition);
  
  JS_PROP_READONLY(state);
  JS_PROP_READONLY(isRunning);
  JS_PROP(isReversed);
  JS_PROP(fractionComplete);
JS_WRAP_PROTOCOL_END(UIViewAnimating, NSObject);

#if __OBJC__
@interface UIViewAnimatingType : NSObject<UIViewAnimating>

@property(nonatomic, readonly) UIViewAnimatingState state;

// Running indicates that the animation is running either in the forward or the reversed direction.
// The state of a running animation is always active.
@property(nonatomic, readonly, getter=isRunning) BOOL running;

// Reversed indicates that the animation is running in the reversed direction when running is YES.
// If running is NO, it indicates that it will run in the reversed direction when it is started.
@property(nonatomic, getter=isReversed) BOOL reversed;

// fractionComplete values are typically between 0 and 1. Some adopters may choose to give
// meaning to values less than zero and greater than 1 to facilitate over and
// undershooting.  The setter is usually a nop when the animation is
// running. Adopters are free to change this if it makes sense. An adopter
// may also choose to only return a meaningful result for this property if it 
// is read while the animation is not running.
@property(nonatomic) CGFloat fractionComplete;  

// Starts the animation either from an inactive state, or if the animation has been paused.
- (void)startAnimation;

// Starts the animation after the given delay.
- (void)startAnimationAfterDelay:(NSTimeInterval)delay;

// Pauses an active, running animation, or start the animation as paused. This is different
// than stopping an animation.
- (void)pauseAnimation;

// Stops the animation.  The values of a view's animated property values are
// updated to correspond to the values that were last rendered. If
// withoutFinishing == YES, then the animator immediately becomes
// inactive. Otherwise it enters the stopped state and it is incumbent on the
// client to explicitly finish the animation by calling finishAnimationAtPosition:. Note
// when an animation finishes naturally this method is not called.
- (void)stopAnimation:(BOOL) withoutFinishing;

// This method may only be called if the animator is in the stopped state.
// The finalPosition argument should indicate the final values of the animated properties.
- (void)finishAnimationAtPosition:(UIViewAnimatingPosition)finalPosition;

@end
#endif

#endif /* NUIViewAnimating_h */
