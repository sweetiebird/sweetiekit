//
//  NUIViewImplicitlyAnimating.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIViewImplicitlyAnimating.h"

#define instancetype UIViewImplicitlyAnimating
#define js_value_instancetype js_value_UIViewImplicitlyAnimating

NUIViewImplicitlyAnimating::NUIViewImplicitlyAnimating() {}
NUIViewImplicitlyAnimating::~NUIViewImplicitlyAnimating() {}

JS_INIT_PROTOCOL(UIViewImplicitlyAnimating, UIViewAnimating);
  JS_ASSIGN_PROTO_PROP(addAnimationsDelayFactor);
  JS_ASSIGN_PROTO_PROP(addAnimations);
  JS_ASSIGN_PROTO_PROP(addCompletion);
  JS_ASSIGN_PROTO_PROP(continueAnimationWithTimingParametersDurationFactor);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIViewImplicitlyAnimating, UIViewAnimating);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UIViewImplicitlyAnimating, UIViewAnimating);

NAN_METHOD(NUIViewImplicitlyAnimating::New) {
  JS_RECONSTRUCT_PROTOCOL(UIViewImplicitlyAnimating);
  @autoreleasepool {
    id<UIViewImplicitlyAnimating> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UIViewImplicitlyAnimating>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UIViewImplicitlyAnimating> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UIViewImplicitlyAnimating, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UIViewImplicitlyAnimatingType alloc] init];
    }
    if (self) {
      NUIViewImplicitlyAnimating *wrapper = new NUIViewImplicitlyAnimating();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIViewImplicitlyAnimating::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIViewImplicitlyAnimating::addAnimationsDelayFactor) {
  JS_UNWRAP_PROTOCOL(UIViewImplicitlyAnimating, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(animation);
    declare_value(CGFloat, delayFactor);
    [self addAnimations:^{
      dispatch_main(^{
        if (animation) {
          [animation jsFunction]->Call("NUIViewImplicitlyAnimating::addAnimationsDelayFactor");
        }
      });
    } delayFactor: delayFactor];
  }
}

NAN_METHOD(NUIViewImplicitlyAnimating::addAnimations) {
  JS_UNWRAP_PROTOCOL(UIViewImplicitlyAnimating, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(animation);
    [self addAnimations:^{
      dispatch_main(^{
        if (animation) {
          [animation jsFunction]->Call("NUIViewImplicitlyAnimating::addAnimations");
        }
      });
    }];
  }
}

NAN_METHOD(NUIViewImplicitlyAnimating::addCompletion) {
  JS_UNWRAP_PROTOCOL(UIViewImplicitlyAnimating, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(completion);
    [self addCompletion:^(UIViewAnimatingPosition finalPosition) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIViewImplicitlyAnimating::addCompletion",
            js_value_UIViewAnimatingPosition(finalPosition));
        }
      });
    }];
  }
}

#include "NUITimingCurveProvider.h"

NAN_METHOD(NUIViewImplicitlyAnimating::continueAnimationWithTimingParametersDurationFactor) {
  JS_UNWRAP_PROTOCOL(UIViewImplicitlyAnimating, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(UITimingCurveProvider, parameters);
    declare_value(CGFloat, durationFactor);
    [self continueAnimationWithTimingParameters: parameters durationFactor: durationFactor];
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

DELEGATE_PROTOCOL_PROP_2(UIViewImplicitlyAnimating, addAnimationsDelayFactor);
DELEGATE_PROTOCOL_PROP_2(UIViewImplicitlyAnimating, addAnimations);
DELEGATE_PROTOCOL_PROP_2(UIViewImplicitlyAnimating, addCompletion);
DELEGATE_PROTOCOL_PROP_2(UIViewImplicitlyAnimating, continueAnimationWithTimingParametersDurationFactor);

#include "NUIViewAnimating.h"
#include "NUITimingCurveProvider.h"

@implementation UIViewImplicitlyAnimatingType

- (void)addAnimations:(void (^)(void))animation delayFactor:(CGFloat)delayFactor
{
  dispatch_main(^{
    Local<Value> animationCallback(sweetiekit::FromBlock("addAnimationsDelayFactor::animation", ^(JSInfo info){
      if (animation) {
        animation();
      }
    }));
    
    call_delegate(noop(), addAnimationsDelayFactor,
      animationCallback,
      js_value_CGFloat(delayFactor));
  });
}

- (void)addAnimations:(void (^)(void))animation
{
  dispatch_main(^{
    Local<Value> animationCallback(sweetiekit::FromBlock("addAnimations::animation", ^(JSInfo info){
      if (animation) {
        animation();
      }
    }));
    
    call_delegate(noop(), addAnimations,
      animationCallback);
  });
}

- (void)addCompletion:(void (^)(UIViewAnimatingPosition finalPosition))completion
{
  dispatch_main(^{
    Local<Value> completionCallback(sweetiekit::FromBlock("addCompletion::completion", ^(JSInfo info){
      declare_args();
      declare_value(UIViewAnimatingPosition, finalPosition);
      if (completion) {
        completion(finalPosition);
      }
    }));
    
    call_delegate(noop(), addCompletion,
      completionCallback);
  });
}

- (void)continueAnimationWithTimingParameters:(nullable id <UITimingCurveProvider>)parameters durationFactor:(CGFloat)durationFactor
{
  call_delegate(noop(), continueAnimationWithTimingParametersDurationFactor,
    js_value_UITimingCurveProvider(parameters),
    js_value_CGFloat(durationFactor));
}

@end
