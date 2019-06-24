//
//  NCADisplayLink.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCADisplayLink.h"

#define instancetype CADisplayLink
#define js_value_instancetype js_value_CADisplayLink

NCADisplayLink::NCADisplayLink() {}
NCADisplayLink::~NCADisplayLink() {}

JS_INIT_CLASS(CADisplayLink, NSObject);
  JS_ASSIGN_STATIC_METHOD(displayLinkWithTargetSelector);
  JS_ASSIGN_PROTO_METHOD(addToRunLoopForMode);
  JS_ASSIGN_PROTO_METHOD(removeFromRunLoopForMode);
  JS_ASSIGN_PROTO_METHOD(invalidate);
  JS_ASSIGN_PROTO_PROP_READONLY(timestamp);
  JS_ASSIGN_PROTO_PROP_READONLY(duration);
  JS_ASSIGN_PROTO_PROP_READONLY(targetTimestamp);
  JS_ASSIGN_PROTO_PROP(isPaused);
  JS_ASSIGN_PROTO_PROP(frameInterval);
  JS_ASSIGN_PROTO_PROP(preferredFramesPerSecond);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CADisplayLink, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(CADisplayLink, NSObject);

NAN_METHOD(NCADisplayLink::New) {
  JS_RECONSTRUCT(CADisplayLink);
  @autoreleasepool {
    CADisplayLink* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CADisplayLink *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CADisplayLink alloc] init];
    }
    if (self) {
      NCADisplayLink *wrapper = new NCADisplayLink();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CADisplayLink::New: invalid arguments");
    }
  }
}

NAN_METHOD(NCADisplayLink::displayLinkWithTargetSelector) {
  declare_autoreleasepool {
    declare_args();
    declare_value(id, target);
    declare_value(SEL, sel);
    CADisplayLink* result = [CADisplayLink displayLinkWithTarget: target selector: sel];
    if (result) {
      [result associateValue:target withKey:@"NCADisplayLink::displayLinkWithTargetSelector"];
      JS_SET_RETURN(js_value_CADisplayLink(result));
    }
  }
}

#include "NNSRunLoop.h"
#include "NNSObjCRuntime.h"

NAN_METHOD(NCADisplayLink::addToRunLoopForMode) {
  JS_UNWRAP(CADisplayLink, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSRunLoop, runloop);
    declare_value(NSRunLoopMode, mode);
    [self addToRunLoop: runloop forMode: mode];
  }
}

NAN_METHOD(NCADisplayLink::removeFromRunLoopForMode) {
  JS_UNWRAP(CADisplayLink, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSRunLoop, runloop);
    declare_value(NSRunLoopMode, mode);
    [self removeFromRunLoop: runloop forMode: mode];
  }
}

NAN_METHOD(NCADisplayLink::invalidate) {
  JS_UNWRAP(CADisplayLink, self);
  declare_autoreleasepool {
    [self invalidate];
  }
}

NAN_GETTER(NCADisplayLink::timestampGetter) {
  JS_UNWRAP(CADisplayLink, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CFTimeInterval([self timestamp]));
  }
}

NAN_GETTER(NCADisplayLink::durationGetter) {
  JS_UNWRAP(CADisplayLink, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CFTimeInterval([self duration]));
  }
}

NAN_GETTER(NCADisplayLink::targetTimestampGetter) {
  JS_UNWRAP(CADisplayLink, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CFTimeInterval([self targetTimestamp]));
  }
}

NAN_GETTER(NCADisplayLink::isPausedGetter) {
  JS_UNWRAP(CADisplayLink, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPaused]));
  }
}

NAN_SETTER(NCADisplayLink::isPausedSetter) {
  JS_UNWRAP(CADisplayLink, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPaused: input];
  }
}

NAN_GETTER(NCADisplayLink::frameIntervalGetter) {
  JS_UNWRAP(CADisplayLink, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self frameInterval]));
  }
}

NAN_SETTER(NCADisplayLink::frameIntervalSetter) {
  JS_UNWRAP(CADisplayLink, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setFrameInterval: input];
  }
}

NAN_GETTER(NCADisplayLink::preferredFramesPerSecondGetter) {
  JS_UNWRAP(CADisplayLink, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self preferredFramesPerSecond]));
  }
}

NAN_SETTER(NCADisplayLink::preferredFramesPerSecondSetter) {
  JS_UNWRAP(CADisplayLink, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setPreferredFramesPerSecond: input];
  }
}

