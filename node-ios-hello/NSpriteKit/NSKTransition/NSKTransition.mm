//
//  NSKTransition.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKTransition.h"

#define instancetype SKTransition
#define js_value_instancetype js_value_SKTransition

NSKTransition::NSKTransition() {}
NSKTransition::~NSKTransition() {}

JS_INIT_CLASS(SKTransition, NSObject);
  JS_ASSIGN_STATIC_METHOD(crossFadeWithDuration);
  JS_ASSIGN_STATIC_METHOD(fadeWithDuration);
  JS_ASSIGN_STATIC_METHOD(fadeWithColorDuration);
  JS_ASSIGN_STATIC_METHOD(flipHorizontalWithDuration);
  JS_ASSIGN_STATIC_METHOD(flipVerticalWithDuration);
  JS_ASSIGN_STATIC_METHOD(revealWithDirectionDuration);
  JS_ASSIGN_STATIC_METHOD(moveInWithDirectionDuration);
  JS_ASSIGN_STATIC_METHOD(pushWithDirectionDuration);
  JS_ASSIGN_STATIC_METHOD(doorsOpenHorizontalWithDuration);
  JS_ASSIGN_STATIC_METHOD(doorsOpenVerticalWithDuration);
  JS_ASSIGN_STATIC_METHOD(doorsCloseHorizontalWithDuration);
  JS_ASSIGN_STATIC_METHOD(doorsCloseVerticalWithDuration);
  JS_ASSIGN_STATIC_METHOD(doorwayWithDuration);
  JS_ASSIGN_STATIC_METHOD(transitionWithCIFilterDuration);
  JS_ASSIGN_PROTO_PROP(pausesIncomingScene);
  JS_ASSIGN_PROTO_PROP(pausesOutgoingScene);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKTransition, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, SKTransitionDirection) {
    JS_ASSIGN_ENUM(SKTransitionDirectionUp, NSInteger);
    JS_ASSIGN_ENUM(SKTransitionDirectionDown, NSInteger);
    JS_ASSIGN_ENUM(SKTransitionDirectionRight, NSInteger);
    JS_ASSIGN_ENUM(SKTransitionDirectionLeft, NSInteger);
  //} NS_ENUM_AVAILABLE(10_9, 7_0);

JS_INIT_CLASS_END(SKTransition, NSObject);

NAN_METHOD(NSKTransition::New) {
  JS_RECONSTRUCT(SKTransition);
  @autoreleasepool {
    SKTransition* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SKTransition *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SKTransition alloc] init];
    }
    if (self) {
      NSKTransition *wrapper = new NSKTransition();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SKTransition::New: invalid arguments");
    }
  }
}

NAN_METHOD(NSKTransition::crossFadeWithDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKTransition([SKTransition crossFadeWithDuration: sec]));
  }
}

NAN_METHOD(NSKTransition::fadeWithDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKTransition([SKTransition fadeWithDuration: sec]));
  }
}

NAN_METHOD(NSKTransition::fadeWithColorDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKColor, color);
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKTransition([SKTransition fadeWithColor: color duration: sec]));
  }
}

NAN_METHOD(NSKTransition::flipHorizontalWithDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKTransition([SKTransition flipHorizontalWithDuration: sec]));
  }
}

NAN_METHOD(NSKTransition::flipVerticalWithDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKTransition([SKTransition flipVerticalWithDuration: sec]));
  }
}

NAN_METHOD(NSKTransition::revealWithDirectionDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(SKTransitionDirection, direction);
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKTransition([SKTransition revealWithDirection: direction duration: sec]));
  }
}

NAN_METHOD(NSKTransition::moveInWithDirectionDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(SKTransitionDirection, direction);
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKTransition([SKTransition moveInWithDirection: direction duration: sec]));
  }
}

NAN_METHOD(NSKTransition::pushWithDirectionDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(SKTransitionDirection, direction);
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKTransition([SKTransition pushWithDirection: direction duration: sec]));
  }
}

NAN_METHOD(NSKTransition::doorsOpenHorizontalWithDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKTransition([SKTransition doorsOpenHorizontalWithDuration: sec]));
  }
}

NAN_METHOD(NSKTransition::doorsOpenVerticalWithDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKTransition([SKTransition doorsOpenVerticalWithDuration: sec]));
  }
}

NAN_METHOD(NSKTransition::doorsCloseHorizontalWithDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKTransition([SKTransition doorsCloseHorizontalWithDuration: sec]));
  }
}

NAN_METHOD(NSKTransition::doorsCloseVerticalWithDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKTransition([SKTransition doorsCloseVerticalWithDuration: sec]));
  }
}

NAN_METHOD(NSKTransition::doorwayWithDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKTransition([SKTransition doorwayWithDuration: sec]));
  }
}

#include "NCIFilter.h"

NAN_METHOD(NSKTransition::transitionWithCIFilterDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CIFilter, filter);
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKTransition([SKTransition transitionWithCIFilter: filter duration: sec]));
  }
}

NAN_GETTER(NSKTransition::pausesIncomingSceneGetter) {
  JS_UNWRAP(SKTransition, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self pausesIncomingScene]));
  }
}

NAN_SETTER(NSKTransition::pausesIncomingSceneSetter) {
  JS_UNWRAP(SKTransition, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPausesIncomingScene: input];
  }
}

NAN_GETTER(NSKTransition::pausesOutgoingSceneGetter) {
  JS_UNWRAP(SKTransition, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self pausesOutgoingScene]));
  }
}

NAN_SETTER(NSKTransition::pausesOutgoingSceneSetter) {
  JS_UNWRAP(SKTransition, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPausesOutgoingScene: input];
  }
}

