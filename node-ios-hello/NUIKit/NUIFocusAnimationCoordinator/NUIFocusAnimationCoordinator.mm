//
//  NUIFocusAnimationCoordinator.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIFocusAnimationCoordinator.h"

#define instancetype UIFocusAnimationCoordinator
#define js_value_instancetype js_value_UIFocusAnimationCoordinator

NUIFocusAnimationCoordinator::NUIFocusAnimationCoordinator() {}
NUIFocusAnimationCoordinator::~NUIFocusAnimationCoordinator() {}

JS_INIT_CLASS(UIFocusAnimationCoordinator, NSObject);
  JS_ASSIGN_PROTO_METHOD(addCoordinatedAnimationsCompletion);
  JS_ASSIGN_PROTO_METHOD(addCoordinatedFocusingAnimationsCompletion);
  JS_ASSIGN_PROTO_METHOD(addCoordinatedUnfocusingAnimationsCompletion);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIFocusAnimationCoordinator, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UIFocusAnimationCoordinator, NSObject);

NAN_METHOD(NUIFocusAnimationCoordinator::New) {
  JS_RECONSTRUCT(UIFocusAnimationCoordinator);
  @autoreleasepool {
    UIFocusAnimationCoordinator* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIFocusAnimationCoordinator *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIFocusAnimationCoordinator alloc] init];
    }
    if (self) {
      NUIFocusAnimationCoordinator *wrapper = new NUIFocusAnimationCoordinator();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIFocusAnimationCoordinator::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIFocusAnimationCoordinator::addCoordinatedAnimationsCompletion) {
  JS_UNWRAP(UIFocusAnimationCoordinator, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(animations);
    declare_callback(completion);
    [self addCoordinatedAnimations:^{
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIFocusAnimationCoordinator::addCoordinatedAnimationsCompletion::animations");
        }
      });
    } completion:^{
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIFocusAnimationCoordinator::addCoordinatedAnimationsCompletion::completion");
        }
        clear_callback(animations);
        clear_callback(completion);
      });
    }];
  }
}

#include "NUIFocusAnimationContext.h"

NAN_METHOD(NUIFocusAnimationCoordinator::addCoordinatedFocusingAnimationsCompletion) {
  JS_UNWRAP(UIFocusAnimationCoordinator, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(animations);
    declare_callback(completion);
    [self addCoordinatedFocusingAnimations:^(id<UIFocusAnimationContext>  _Nonnull animationContext) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIFocusAnimationCoordinator::addCoordinatedFocusingAnimationsCompletion::animations",
            js_value_UIFocusAnimationContext(animationContext));
        }
      });
    } completion:^{
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIFocusAnimationCoordinator::addCoordinatedFocusingAnimationsCompletion::completion");
        }
        clear_callback(animations);
        clear_callback(completion);
      });
    }];
  }
}

NAN_METHOD(NUIFocusAnimationCoordinator::addCoordinatedUnfocusingAnimationsCompletion) {
  JS_UNWRAP(UIFocusAnimationCoordinator, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(animations);
    declare_callback(completion);
    [self addCoordinatedUnfocusingAnimations:^(id<UIFocusAnimationContext>  _Nonnull animationContext) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIFocusAnimationCoordinator::addCoordinatedUnfocusingAnimationsCompletion::animations",
            js_value_UIFocusAnimationContext(animationContext));
        }
      });
    } completion:^{
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIFocusAnimationCoordinator::addCoordinatedUnfocusingAnimationsCompletion::completion");
        }
        clear_callback(animations);
        clear_callback(completion);
      });
    }];
  }
}
