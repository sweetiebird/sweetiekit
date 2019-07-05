//
//  NUIViewAnimating.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIViewAnimating.h"

#define instancetype UIViewAnimating
#define js_value_instancetype js_value_UIViewAnimating

NUIViewAnimating::NUIViewAnimating() {}
NUIViewAnimating::~NUIViewAnimating() {}

JS_INIT_PROTOCOL(UIViewAnimating, NSObject);
  JS_ASSIGN_PROTO_PROP(startAnimation);
  JS_ASSIGN_PROTO_PROP(startAnimationAfterDelay);
  JS_ASSIGN_PROTO_PROP(pauseAnimation);
  JS_ASSIGN_PROTO_PROP(stopAnimation);
  JS_ASSIGN_PROTO_PROP(finishAnimationAtPosition);
  JS_ASSIGN_PROTO_PROP_READONLY(state);
  JS_ASSIGN_PROTO_PROP_READONLY(isRunning);
  JS_ASSIGN_PROTO_PROP(isReversed);
  JS_ASSIGN_PROTO_PROP(fractionComplete);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIViewAnimating, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, UIViewAnimatingState) {
    JS_ASSIGN_ENUM(UIViewAnimatingStateInactive, NSInteger);
    JS_ASSIGN_ENUM(UIViewAnimatingStateActive, NSInteger);
    JS_ASSIGN_ENUM(UIViewAnimatingStateStopped, NSInteger);
  //} NS_ENUM_AVAILABLE_IOS(10_0) ;

  //typedef NS_ENUM(NSInteger, UIViewAnimatingPosition) {
    JS_ASSIGN_ENUM(UIViewAnimatingPositionEnd, NSInteger);
    JS_ASSIGN_ENUM(UIViewAnimatingPositionStart, NSInteger);
    JS_ASSIGN_ENUM(UIViewAnimatingPositionCurrent, NSInteger);
  //} NS_ENUM_AVAILABLE_IOS(10_0);

JS_INIT_PROTOCOL_END(UIViewAnimating, NSObject);

NAN_METHOD(NUIViewAnimating::New) {
  JS_RECONSTRUCT_PROTOCOL(UIViewAnimating);
  @autoreleasepool {
    id<UIViewAnimating> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UIViewAnimating>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UIViewAnimating> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UIViewAnimating, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UIViewAnimatingType alloc] init];
    }
    if (self) {
      NUIViewAnimating *wrapper = new NUIViewAnimating();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIViewAnimating::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUIViewAnimating::stateGetter) {
  JS_UNWRAP_PROTOCOL(UIViewAnimating, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewAnimatingState([self state]));
  }
}

NAN_GETTER(NUIViewAnimating::isRunningGetter) {
  JS_UNWRAP_PROTOCOL(UIViewAnimating, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isRunning]));
  }
}

NAN_GETTER(NUIViewAnimating::isReversedGetter) {
  JS_UNWRAP_PROTOCOL(UIViewAnimating, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isReversed]));
  }
}

NAN_SETTER(NUIViewAnimating::isReversedSetter) {
  JS_UNWRAP_PROTOCOL(UIViewAnimating, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setReversed: input];
  }
}

NAN_GETTER(NUIViewAnimating::fractionCompleteGetter) {
  JS_UNWRAP_PROTOCOL(UIViewAnimating, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self fractionComplete]));
  }
}

NAN_SETTER(NUIViewAnimating::fractionCompleteSetter) {
  JS_UNWRAP_PROTOCOL(UIViewAnimating, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setFractionComplete: input];
  }
}

#define DELEGATE_PROTOCOL_PROP_2(type, key) \
NAN_GETTER(N##type::key##Getter) { \
  JS_UNWRAP_PROTOCOL(type, self); \
  declare_autoreleasepool { \
    if ([self isKindOfClass:[type##Type class]]) { \
      get_persistent_function(self_, callback, @#key); \
      if (callback) { \
        JS_SET_RETURN([callback jsFunction]->Get()); \
      } \
    } else { \
      JS_SET_RETURN(JS_FUNC(Nan::New<v8::FunctionTemplate>(N##type::key, info.This()))); \
    } \
  } \
} \
\
NAN_SETTER(N##type::key##Setter) { \
  JS_UNWRAP_PROTOCOL(type, self); \
  declare_autoreleasepool { \
    declare_setter(); \
    declare_persistent_function_on(self_, callback, @#key); \
  } \
}

NAN_METHOD(NUIViewAnimating::startAnimation) {
  JS_UNWRAP_PROTOCOL(UIViewAnimating, self);
  declare_autoreleasepool {
    [self startAnimation];
  }
}

NAN_METHOD(NUIViewAnimating::startAnimationAfterDelay) {
  JS_UNWRAP_PROTOCOL(UIViewAnimating, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, delay);
    [self startAnimationAfterDelay: delay];
  }
}

NAN_METHOD(NUIViewAnimating::pauseAnimation) {
  JS_UNWRAP_PROTOCOL(UIViewAnimating, self);
  declare_autoreleasepool {
    [self pauseAnimation];
  }
}

NAN_METHOD(NUIViewAnimating::stopAnimation) {
  JS_UNWRAP_PROTOCOL(UIViewAnimating, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, withoutFinishing);
    [self stopAnimation: withoutFinishing];
  }
}

NAN_METHOD(NUIViewAnimating::finishAnimationAtPosition) {
  JS_UNWRAP_PROTOCOL(UIViewAnimating, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIViewAnimatingPosition, finalPosition);
    [self finishAnimationAtPosition: finalPosition];
  }
}

DELEGATE_PROTOCOL_PROP_2(UIViewAnimating, startAnimation);
DELEGATE_PROTOCOL_PROP_2(UIViewAnimating, startAnimationAfterDelay);
DELEGATE_PROTOCOL_PROP_2(UIViewAnimating, pauseAnimation);
DELEGATE_PROTOCOL_PROP_2(UIViewAnimating, stopAnimation);
DELEGATE_PROTOCOL_PROP_2(UIViewAnimating, finishAnimationAtPosition);

@implementation UIViewAnimatingType

// Starts the animation either from an inactive state, or if the animation has been paused.
- (void)startAnimation
{
  call_delegate_0(noop(), startAnimation);
}

// Starts the animation after the given delay.
- (void)startAnimationAfterDelay:(NSTimeInterval)delay
{
  call_delegate(noop(), startAnimationAfterDelay,
    js_value_NSTimeInterval(delay));
}

// Pauses an active, running animation, or start the animation as paused. This is different
// than stopping an animation.
- (void)pauseAnimation
{
  call_delegate_0(noop(), pauseAnimation);
}

// Stops the animation.  The values of a view's animated property values are
// updated to correspond to the values that were last rendered. If
// withoutFinishing == YES, then the animator immediately becomes
// inactive. Otherwise it enters the stopped state and it is incumbent on the
// client to explicitly finish the animation by calling finishAnimationAtPosition:. Note
// when an animation finishes naturally this method is not called.
- (void)stopAnimation:(BOOL) withoutFinishing
{
  call_delegate(noop(), stopAnimation,
    js_value_BOOL(withoutFinishing));
}

// This method may only be called if the animator is in the stopped state.
// The finalPosition argument should indicate the final values of the animated properties.
- (void)finishAnimationAtPosition:(UIViewAnimatingPosition)finalPosition
{
  call_delegate(noop(), finishAnimationAtPosition,
    js_value_UIViewAnimatingPosition(finalPosition));
}

@end
