//
//  NNSTimer.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSTimer.h"

#define instancetype NSTimer
#define js_value_instancetype js_value_NSTimer

NNSTimer::NNSTimer() {}
NNSTimer::~NNSTimer() {}

JS_INIT_CLASS(NSTimer, NSObject);
  JS_ASSIGN_STATIC_METHOD(timerWithTimeIntervalInvocationRepeats);
  JS_ASSIGN_STATIC_METHOD(scheduledTimerWithTimeIntervalInvocationRepeats);
  JS_ASSIGN_STATIC_METHOD(timerWithTimeIntervalTargetSelectorUserInfoRepeats);
  JS_ASSIGN_STATIC_METHOD(scheduledTimerWithTimeIntervalTargetSelectorUserInfoRepeats);
  JS_ASSIGN_STATIC_METHOD(timerWithTimeIntervalRepeatsBlock);
  JS_ASSIGN_STATIC_METHOD(scheduledTimerWithTimeIntervalRepeatsBlock);
  JS_ASSIGN_PROTO_METHOD(initWithFireDateIntervalRepeatsBlock);
  JS_ASSIGN_PROTO_METHOD(initWithFireDateIntervalTargetSelectorUserInfoRepeats);
  JS_ASSIGN_PROTO_METHOD(fire);
  JS_ASSIGN_PROTO_METHOD(invalidate);
  JS_ASSIGN_PROTO_PROP(fireDate);
  JS_ASSIGN_PROTO_PROP_READONLY(timeInterval);
  JS_ASSIGN_PROTO_PROP(tolerance);
  JS_ASSIGN_PROTO_PROP_READONLY(isValid);
  JS_ASSIGN_PROTO_PROP_READONLY(userInfo);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSTimer, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(NSTimer, NSObject);

NAN_METHOD(NNSTimer::New) {
  JS_RECONSTRUCT(NSTimer);
  @autoreleasepool {
    NSTimer* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSTimer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSTimer alloc] init];
    }
    if (self) {
      NNSTimer *wrapper = new NNSTimer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSTimer::New: invalid arguments");
    }
  }
}

#include "NNSInvocation.h"

NAN_METHOD(NNSTimer::timerWithTimeIntervalInvocationRepeats) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, ti);
    declare_pointer(NSInvocation, invocation);
    declare_value(BOOL, yesOrNo);
    JS_SET_RETURN(js_value_NSTimer([NSTimer timerWithTimeInterval: ti invocation: invocation repeats: yesOrNo]));
  }
}

NAN_METHOD(NNSTimer::scheduledTimerWithTimeIntervalInvocationRepeats) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, ti);
    declare_pointer(NSInvocation, invocation);
    declare_value(BOOL, yesOrNo);
    JS_SET_RETURN(js_value_NSTimer([NSTimer scheduledTimerWithTimeInterval: ti invocation: invocation repeats: yesOrNo]));
  }
}

NAN_METHOD(NNSTimer::timerWithTimeIntervalTargetSelectorUserInfoRepeats) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, ti);
    declare_value(id, aTarget);
    declare_value(SEL, aSelector);
    declare_nullable_value(id, userInfo);
    declare_value(BOOL, yesOrNo);
    JS_SET_RETURN(js_value_NSTimer([NSTimer timerWithTimeInterval: ti target: aTarget selector: aSelector userInfo: userInfo repeats: yesOrNo]));
  }
}

NAN_METHOD(NNSTimer::scheduledTimerWithTimeIntervalTargetSelectorUserInfoRepeats) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, ti);
    declare_value(id, aTarget);
    declare_value(SEL, aSelector);
    declare_nullable_value(id, userInfo);
    declare_value(BOOL, yesOrNo);
    JS_SET_RETURN(js_value_NSTimer([NSTimer scheduledTimerWithTimeInterval: ti target: aTarget selector: aSelector userInfo: userInfo repeats: yesOrNo]));
  }
}

NAN_METHOD(NNSTimer::timerWithTimeIntervalRepeatsBlock) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, interval);
    declare_value(BOOL, repeats);
    declare_callback(block);
    JS_SET_RETURN(js_value_NSTimer([NSTimer timerWithTimeInterval: interval repeats: repeats block:^(NSTimer * _Nonnull timer) {
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NNSTimer::timerWithTimeIntervalRepeatsBlock",
            js_value_NSTimer(timer));
        }
      });
    }]));
  }
}

NAN_METHOD(NNSTimer::scheduledTimerWithTimeIntervalRepeatsBlock) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, interval);
    declare_value(BOOL, repeats);
    declare_callback(block);
    JS_SET_RETURN(js_value_NSTimer([NSTimer scheduledTimerWithTimeInterval: interval repeats: repeats block:^(NSTimer * _Nonnull timer) {
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NNSTimer::scheduledTimerWithTimeIntervalRepeatsBlock",
            js_value_NSTimer(timer));
        }
      });
    }]));
  }
}

NAN_METHOD(NNSTimer::initWithFireDateIntervalRepeatsBlock) {
  JS_UNWRAP_OR_ALLOC(NSTimer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, date);
    declare_value(NSTimeInterval, interval);
    declare_value(BOOL, repeats);
    declare_callback(block);
    JS_SET_RETURN(js_value_instancetype([self initWithFireDate: date interval: interval repeats: repeats block:^(NSTimer * _Nonnull timer) {
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NNSTimer::initWithFireDateIntervalRepeatsBlock",
            js_value_NSTimer(timer));
        }
      });
    }]));
  }
}

NAN_METHOD(NNSTimer::initWithFireDateIntervalTargetSelectorUserInfoRepeats) {
  JS_UNWRAP_OR_ALLOC(NSTimer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, date);
    declare_value(NSTimeInterval, ti);
    declare_value(id, t);
    declare_value(SEL, s);
    declare_nullable_value(id, ui);
    declare_value(BOOL, rep);
    JS_SET_RETURN(js_value_instancetype([self initWithFireDate: date interval: ti target: t selector: s userInfo: ui repeats: rep]));
  }
}

NAN_METHOD(NNSTimer::fire) {
  JS_UNWRAP(NSTimer, self);
  declare_autoreleasepool {
    [self fire];
  }
}

NAN_METHOD(NNSTimer::invalidate) {
  JS_UNWRAP(NSTimer, self);
  declare_autoreleasepool {
    [self invalidate];
  }
}

NAN_GETTER(NNSTimer::fireDateGetter) {
  JS_UNWRAP(NSTimer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDate([self fireDate]));
  }
}

NAN_SETTER(NNSTimer::fireDateSetter) {
  JS_UNWRAP(NSTimer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDate, input);
    [self setFireDate: input];
  }
}

NAN_GETTER(NNSTimer::timeIntervalGetter) {
  JS_UNWRAP(NSTimer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self timeInterval]));
  }
}

NAN_GETTER(NNSTimer::toleranceGetter) {
  JS_UNWRAP(NSTimer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self tolerance]));
  }
}

NAN_SETTER(NNSTimer::toleranceSetter) {
  JS_UNWRAP(NSTimer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTimeInterval, input);
    [self setTolerance: input];
  }
}

NAN_GETTER(NNSTimer::isValidGetter) {
  JS_UNWRAP(NSTimer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isValid]));
  }
}

NAN_GETTER(NNSTimer::userInfoGetter) {
  JS_UNWRAP(NSTimer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self userInfo]));
  }
}
