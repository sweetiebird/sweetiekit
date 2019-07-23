//
//  NVNRequestProgressProviding.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNRequestProgressProviding.h"

#import <Vision/VNRequest.h>

#define instancetype VNRequestProgressProviding
#define js_value_instancetype js_value_VNRequestProgressProviding

NVNRequestProgressProviding::NVNRequestProgressProviding() {}
NVNRequestProgressProviding::~NVNRequestProgressProviding() {}

JS_INIT_PROTOCOL(VNRequestProgressProviding, NSObject);
  JS_ASSIGN_PROTO_PROP(progressHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(indeterminate);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNRequestProgressProviding, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(VNRequestProgressProviding, NSObject);

NAN_METHOD(NVNRequestProgressProviding::New) {
  JS_RECONSTRUCT_PROTOCOL(VNRequestProgressProviding);
  @autoreleasepool {
    id<VNRequestProgressProviding> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<VNRequestProgressProviding>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<VNRequestProgressProviding> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], VNRequestProgressProviding, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[VNRequestProgressProvidingType alloc] init];
    }
    if (self) {
      NVNRequestProgressProviding *wrapper = new NVNRequestProgressProviding();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNRequestProgressProviding::New: invalid arguments");
    }
  }
}

#include "NVNRequest.h"
#include "NNSError.h"


NAN_GETTER(NVNRequestProgressProviding::progressHandlerGetter) {
  JS_UNWRAP_PROTOCOL(VNRequestProgressProviding, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_VNRequestProgressHandler([self progressHandler]));
    #endif
  }
}

NAN_SETTER(NVNRequestProgressProviding::progressHandlerSetter) {
  JS_UNWRAP_PROTOCOL(VNRequestProgressProviding, self);
  declare_autoreleasepool {
    declare_setter();
    declare_callback(input);
    [self setProgressHandler:^(VNRequest * _Nonnull request, double fractionCompleted, NSError * _Nullable error) {
      dispatch_main(^{
        if (input) {
          [input jsFunction]->Call("NVNRequestProgressProviding::progressHandler",
            js_value_VNRequest(request),
            js_value_double(fractionCompleted),
            js_value_NSError(error));
        }
      });
    }];
  }
}

NAN_GETTER(NVNRequestProgressProviding::indeterminateGetter) {
  JS_UNWRAP_PROTOCOL(VNRequestProgressProviding, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self indeterminate]));
  }
}

@implementation VNRequestProgressProvidingType
@end
