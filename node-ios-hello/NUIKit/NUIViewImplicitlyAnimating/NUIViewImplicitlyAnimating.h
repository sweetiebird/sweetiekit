//
//  NUIViewImplicitlyAnimating.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIViewImplicitlyAnimating_h
#define NUIViewImplicitlyAnimating_h    

#include "NUIViewAnimating.h"

#define js_value_UIViewImplicitlyAnimating(x) js_protocol_wrapper(x, UIViewImplicitlyAnimating)
#define to_value_UIViewImplicitlyAnimating(x) to_protocol_wrapper(x, UIViewImplicitlyAnimating)
#define is_value_UIViewImplicitlyAnimating(x) is_protocol_wrapper(x, UIViewImplicitlyAnimating)

JS_WRAP_PROTOCOL(UIViewImplicitlyAnimating, UIViewAnimating);
  JS_PROP(addAnimationsDelayFactor);
  JS_PROP(addAnimations);
  JS_PROP(addCompletion);
  JS_PROP(continueAnimationWithTimingParametersDurationFactor);
  JS_METHOD(addAnimationsDelayFactor);
  JS_METHOD(addAnimations);
  JS_METHOD(addCompletion);
  JS_METHOD(continueAnimationWithTimingParametersDurationFactor);
JS_WRAP_PROTOCOL_END(UIViewImplicitlyAnimating, UIViewAnimating);

#if __OBJC__
@interface UIViewImplicitlyAnimatingType : UIViewAnimatingType<UIViewImplicitlyAnimating>

- (void)addAnimations:(void (^)(void))animation delayFactor:(CGFloat)delayFactor;
- (void)addAnimations:(void (^)(void))animation;
- (void)addCompletion:(void (^)(UIViewAnimatingPosition finalPosition))completion;
- (void)continueAnimationWithTimingParameters:(nullable id <UITimingCurveProvider>)parameters durationFactor:(CGFloat)durationFactor;

@end
#endif

#endif /* NUIViewImplicitlyAnimating_h */
