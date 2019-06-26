//
//  NCAAction.mm
//
//  Created by Shawn Presser on 6/25/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCAAction.h"

#define instancetype CAAction
#define js_value_instancetype js_value_CAAction

NCAAction::NCAAction() {}
NCAAction::~NCAAction() {}

JS_INIT_PROTOCOL(CAAction, NSObject);
  JS_ASSIGN_PROTO_PROP(runActionForKeyObjectArguments);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CAAction, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(CAAction, NSObject);

DELEGATE_PROTOCOL_PROP(CAAction, runActionForKeyObjectArguments);

NAN_METHOD(NCAAction::New) {
  JS_RECONSTRUCT_PROTOCOL(CAAction);
  @autoreleasepool {
    id<CAAction> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<CAAction>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<CAAction> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], CAAction, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[CAActionType alloc] init];
    }
    if (self) {
      NCAAction *wrapper = new NCAAction();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CAAction::New: invalid arguments");
    }
  }
}

@implementation CAActionType

/* Called to trigger the event named 'path' on the receiver. The object
 * (e.g. the layer) on which the event happened is 'anObject'. The
 * arguments dictionary may be nil, if non-nil it carries parameters
 * associated with the event. */

- (void)runActionForKey:(NSString * _Null_unspecified)event object:(id _Null_unspecified)anObject
    arguments:(nullable NSDictionary *)dict
{
  call_delegate(noop(), runActionForKeyObjectArguments,
    js_value_NSString(event),
    js_value_id(anObject),
    js_value_NSDictionary(dict));
}

@end
