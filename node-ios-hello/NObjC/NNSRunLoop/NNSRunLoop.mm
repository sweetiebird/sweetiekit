//
//  NNSRunLoop.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSRunLoop.h"

#define instancetype NSRunLoop
#define js_value_instancetype js_value_NSRunLoop

NNSRunLoop::NNSRunLoop() {}
NNSRunLoop::~NNSRunLoop() {}

#include "NNSObjCRuntime.h"

JS_INIT_CLASS(NSRunLoop, NSObject);
  JS_ASSIGN_PROTO_METHOD(getCFRunLoop);
  JS_ASSIGN_PROTO_METHOD(addTimerForMode);
  JS_ASSIGN_PROTO_METHOD(addPortForMode);
  JS_ASSIGN_PROTO_METHOD(removePortForMode);
  JS_ASSIGN_PROTO_METHOD(limitDateForMode);
  JS_ASSIGN_PROTO_METHOD(acceptInputForModeBeforeDate);
  JS_ASSIGN_PROTO_METHOD(run);
  JS_ASSIGN_PROTO_METHOD(runUntilDate);
  JS_ASSIGN_PROTO_METHOD(runModeBeforeDate);
#if DEPRECATED
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
  JS_ASSIGN_PROTO_METHOD(configureAsServer);
#endif
#endif
  JS_ASSIGN_PROTO_METHOD(performInModesBlock);
  JS_ASSIGN_PROTO_METHOD(performBlock);
  JS_ASSIGN_PROTO_METHOD(performSelectorTargetArgumentOrderModes);
  JS_ASSIGN_PROTO_METHOD(cancelPerformSelectorTargetArgument);
  JS_ASSIGN_PROTO_METHOD(cancelPerformSelectorsWithTarget);
  JS_ASSIGN_STATIC_PROP_READONLY(currentRunLoop);
  JS_ASSIGN_STATIC_PROP_READONLY(mainRunLoop);
  JS_ASSIGN_PROTO_PROP_READONLY(currentMode);
#if TODO
// NSObject
  JS_ASSIGN_STATIC_METHOD(cancelPreviousPerformRequestsWithTargetSelectorObject);
  JS_ASSIGN_STATIC_METHOD(cancelPreviousPerformRequestsWithTarget);
  JS_ASSIGN_PROTO_METHOD(performSelectorWithObjectAfterDelayInModes);
  JS_ASSIGN_PROTO_METHOD(performSelectorWithObjectAfterDelay);
#endif

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSRunLoop, NSObject);
  // constant values (exports)
  
  JS_ASSIGN_ENUM(NSDefaultRunLoopMode, NSRunLoopMode);
  JS_ASSIGN_ENUM(NSRunLoopCommonModes, NSRunLoopMode);
JS_INIT_CLASS_END(NSRunLoop, NSObject);

NAN_METHOD(NNSRunLoop::New) {
  JS_RECONSTRUCT(NSRunLoop);
  @autoreleasepool {
    NSRunLoop* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSRunLoop *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSRunLoop alloc] init];
    }
    if (self) {
      NNSRunLoop *wrapper = new NNSRunLoop();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSRunLoop::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSRunLoop::getCFRunLoop) {
  JS_UNWRAP(NSRunLoop, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CFRunLoopRef([self getCFRunLoop]));
  }
}

#include "NNSTimer.h"

NAN_METHOD(NNSRunLoop::addTimerForMode) {
  JS_UNWRAP(NSRunLoop, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSTimer, timer);
    declare_value(NSRunLoopMode, mode);
    [self addTimer: timer forMode: mode];
  }
}

#include "NNSPort.h"

NAN_METHOD(NNSRunLoop::addPortForMode) {
  JS_UNWRAP(NSRunLoop, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSPort, aPort);
    declare_value(NSRunLoopMode, mode);
    [self addPort: aPort forMode: mode];
  }
}

NAN_METHOD(NNSRunLoop::removePortForMode) {
  JS_UNWRAP(NSRunLoop, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSPort, aPort);
    declare_value(NSRunLoopMode, mode);
    [self removePort: aPort forMode: mode];
  }
}

NAN_METHOD(NNSRunLoop::limitDateForMode) {
  JS_UNWRAP(NSRunLoop, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRunLoopMode, mode);
    JS_SET_RETURN(js_value_NSDate([self limitDateForMode: mode]));
  }
}

NAN_METHOD(NNSRunLoop::acceptInputForModeBeforeDate) {
  JS_UNWRAP(NSRunLoop, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRunLoopMode, mode);
    declare_pointer(NSDate, limitDate);
    [self acceptInputForMode: mode beforeDate: limitDate];
  }
}

NAN_METHOD(NNSRunLoop::run) {
  JS_UNWRAP(NSRunLoop, self);
  declare_autoreleasepool {
    [self run];
  }
}

NAN_METHOD(NNSRunLoop::runUntilDate) {
  JS_UNWRAP(NSRunLoop, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, limitDate);
    [self runUntilDate: limitDate];
  }
}

NAN_METHOD(NNSRunLoop::runModeBeforeDate) {
  JS_UNWRAP(NSRunLoop, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRunLoopMode, mode);
    declare_pointer(NSDate, limitDate);
    JS_SET_RETURN(js_value_BOOL([self runMode: mode beforeDate: limitDate]));
  }
}

#if DEPRECATED
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
NAN_METHOD(NNSRunLoop::configureAsServer) {
  JS_UNWRAP(NSRunLoop, self);
  declare_autoreleasepool {
    [self configureAsServer];
  }
}
#endif
#endif

NAN_METHOD(NNSRunLoop::performInModesBlock) {
  JS_UNWRAP(NSRunLoop, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSRunLoopMode>, modes);
    declare_callback(block);
    [self performInModes: modes block:^{
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NNSRunLoop::performInModesBlock");
        }
      });
    }];
  }
}

NAN_METHOD(NNSRunLoop::performBlock) {
  JS_UNWRAP(NSRunLoop, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(block);
    [self performBlock:^{
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NNSRunLoop::performBlock");
        }
      });
    }];
  }
}

NAN_METHOD(NNSRunLoop::performSelectorTargetArgumentOrderModes) {
  JS_UNWRAP(NSRunLoop, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SEL, aSelector);
    declare_value(id, target);
    declare_nullable_value(id, arg);
    declare_value(NSUInteger, order);
    declare_pointer(NSArray<NSRunLoopMode>, modes);
    [self performSelector: aSelector target: target argument: arg order: order modes: modes];
  }
}

NAN_METHOD(NNSRunLoop::cancelPerformSelectorTargetArgument) {
  JS_UNWRAP(NSRunLoop, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SEL, aSelector);
    declare_value(id, target);
    declare_nullable_value(id, arg);
    [self cancelPerformSelector: aSelector target: target argument: arg];
  }
}

NAN_METHOD(NNSRunLoop::cancelPerformSelectorsWithTarget) {
  JS_UNWRAP(NSRunLoop, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id, target);
    [self cancelPerformSelectorsWithTarget: target];
  }
}

NAN_GETTER(NNSRunLoop::currentRunLoopGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSRunLoop([NSRunLoop currentRunLoop]));
  }
}

NAN_GETTER(NNSRunLoop::mainRunLoopGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSRunLoop([NSRunLoop mainRunLoop]));
  }
}

NAN_GETTER(NNSRunLoop::currentModeGetter) {
  JS_UNWRAP(NSRunLoop, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSRunLoopMode([self currentMode]));
  }
}

#if TODO
NAN_METHOD(NNSObject::cancelPreviousPerformRequestsWithTargetSelectorObject) {
  declare_autoreleasepool {
    declare_args();
    declare_value(id, aTarget);
    declare_value(SEL, aSelector);
    declare_nullable_value(id, anArgument);
    [NSObject cancelPreviousPerformRequestsWithTarget: aTarget selector: aSelector object: anArgument];
  }
}

NAN_METHOD(NNSObject::cancelPreviousPerformRequestsWithTarget) {
  declare_autoreleasepool {
    declare_args();
    declare_value(id, aTarget);
    [NSObject cancelPreviousPerformRequestsWithTarget: aTarget];
  }
}

NAN_METHOD(NNSObject::performSelectorWithObjectAfterDelayInModes) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SEL, aSelector);
    declare_nullable_value(id, anArgument);
    declare_value(NSTimeInterval, delay);
    declare_pointer(NSArray<NSRunLoopMode>, modes);
    [self performSelector: aSelector withObject: anArgument afterDelay: delay inModes: modes];
  }
}

NAN_METHOD(NNSObject::performSelectorWithObjectAfterDelay) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SEL, aSelector);
    declare_nullable_value(id, anArgument);
    declare_value(NSTimeInterval, delay);
    [self performSelector: aSelector withObject: anArgument afterDelay: delay];
  }
}
#endif
