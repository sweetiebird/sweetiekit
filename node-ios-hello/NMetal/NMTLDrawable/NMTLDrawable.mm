//
//  NMTLDrawable.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLDrawable.h"

#define instancetype MTLDrawable
#define js_value_instancetype js_value_MTLDrawable

NMTLDrawable::NMTLDrawable() {}
NMTLDrawable::~NMTLDrawable() {}

JS_INIT_PROTOCOL(MTLDrawable, NSObject);
  JS_ASSIGN_PROTO_METHOD(present);
  JS_ASSIGN_PROTO_METHOD(presentAtTime);
  JS_ASSIGN_PROTO_METHOD(presentAfterMinimumDuration);
  JS_ASSIGN_PROTO_METHOD(addPresentedHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(presentedTime);
  JS_ASSIGN_PROTO_PROP_READONLY(drawableID);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLDrawable, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLDrawable, NSObject);


NAN_METHOD(NMTLDrawable::New) {
  JS_RECONSTRUCT_PROTOCOL(MTLDrawable);
  @autoreleasepool {
    id<MTLDrawable> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLDrawable>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLDrawable> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLDrawable, value);
      self = value;
    }
    if (self) {
      NMTLDrawable *wrapper = new NMTLDrawable();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLDrawable::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMTLDrawable::present) {
  JS_UNWRAP_PROTOCOL(MTLDrawable, self);
  declare_autoreleasepool {
    [self present];
  }
}

NAN_METHOD(NMTLDrawable::presentAtTime) {
  JS_UNWRAP_PROTOCOL(MTLDrawable, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CFTimeInterval, presentationTime);
    [self presentAtTime: presentationTime];
  }
}

NAN_METHOD(NMTLDrawable::presentAfterMinimumDuration) {
  JS_UNWRAP_PROTOCOL(MTLDrawable, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CFTimeInterval, duration);
    [self presentAfterMinimumDuration: duration];
  }
}

NAN_METHOD(NMTLDrawable::addPresentedHandler) {
  JS_UNWRAP_PROTOCOL(MTLDrawable, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(block);
    [self addPresentedHandler:^(id<MTLDrawable> _Nonnull drawable) {
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NMTLDrawable::addPresentedHandler",
            js_value_MTLDrawable(drawable));
        }
      });
    }];
  }
}

NAN_GETTER(NMTLDrawable::presentedTimeGetter) {
  JS_UNWRAP_PROTOCOL(MTLDrawable, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CFTimeInterval([self presentedTime]));
  }
}

NAN_GETTER(NMTLDrawable::drawableIDGetter) {
  JS_UNWRAP_PROTOCOL(MTLDrawable, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self drawableID]));
  }
}
