//
//  NUITimingCurveProvider.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITimingCurveProvider.h"

#define instancetype UITimingCurveProvider
#define js_value_instancetype js_value_UITimingCurveProvider

NUITimingCurveProvider::NUITimingCurveProvider() {}
NUITimingCurveProvider::~NUITimingCurveProvider() {}

JS_INIT_PROTOCOL(UITimingCurveProvider, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITimingCurveProvider, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, UITimingCurveType) {
    JS_ASSIGN_ENUM(UITimingCurveTypeBuiltin, NSInteger);
    JS_ASSIGN_ENUM(UITimingCurveTypeCubic, NSInteger);
    JS_ASSIGN_ENUM(UITimingCurveTypeSpring, NSInteger);
    JS_ASSIGN_ENUM(UITimingCurveTypeComposed, NSInteger);
  //} NS_ENUM_AVAILABLE_IOS(10_0);

JS_INIT_PROTOCOL_END(UITimingCurveProvider, NSObject);

NAN_METHOD(NUITimingCurveProvider::New) {
  JS_RECONSTRUCT_PROTOCOL(UITimingCurveProvider);
  @autoreleasepool {
    id<UITimingCurveProvider> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UITimingCurveProvider>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UITimingCurveProvider> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UITimingCurveProvider, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UITimingCurveProviderType alloc] init];
    }
    if (self) {
      NUITimingCurveProvider *wrapper = new NUITimingCurveProvider();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITimingCurveProvider::New: invalid arguments");
    }
  }
}

@implementation UITimingCurveProviderType
@end
