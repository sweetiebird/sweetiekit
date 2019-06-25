//
//  NNSTarget.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSTarget.h"

#define instancetype NSTarget
#define js_value_instancetype js_value_NSTarget

NNSTarget::NNSTarget() {}
NNSTarget::~NNSTarget() {}

JS_INIT_CLASS(NSTarget, NSObject);
  JS_ASSIGN_PROTO_PROP(callback);
  JS_ASSIGN_PROTO_PROP_READONLY(selector);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSTarget, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(NSTarget, NSObject);

DELEGATE_PROP(NSTarget, callback);

NAN_METHOD(NNSTarget::New) {
  JS_RECONSTRUCT(NSTarget);
  @autoreleasepool {
    NSTarget* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSTarget *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 0 && info[0]->IsFunction()) {
      Local<Value> that(JS_NEW(NNSTarget, 0, nullptr));
      JS_OBJ(that)->Set(JS_STR("callback"), info[0]);
      JS_SET_RETURN(that);
      return;
    } else if (info.Length() <= 0) {
      self = [[NSTarget alloc] init];
    }
    if (self) {
      NNSTarget *wrapper = new NNSTarget();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSTarget::New: invalid arguments");
    }
  }
}

NAN_GETTER(NNSTarget::selectorGetter)
{
  JS_UNWRAP(NSTarget, self);
  declare_autoreleasepool {
    SEL selector([self selector]);
    if (selector) {
      NSString* selectorString(NSStringFromSelector(selector));
      if (selectorString) {
        JS_SET_RETURN(js_value_NSString(selectorString));
      }
    }
  }
}

@implementation NSTarget
- (IBAction)callback:(id)sender
{
  call_delegate(noop(), callback,
    js_value_id(sender));
}

- (SEL)selector
{
  return @selector(callback:);
}
@end
