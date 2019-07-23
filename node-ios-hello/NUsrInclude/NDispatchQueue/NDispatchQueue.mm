//
//  NDispatchQueue.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NDispatchQueue.h"

Local<Value>
js_value_dispatch_queue_t(dispatch_queue_t value)
{
  if (!value) {
    return Nan::Undefined();
  }
  return Nan::New<External>((__bridge void*)value);
}

bool
is_value_dispatch_queue_t(Local<Value> value)
{
  if (value->IsExternal()) {
    return true;
  }
  return false;
}

dispatch_queue_t
to_value_dispatch_queue_t(Local<Value> value, bool* failed)
{
  dispatch_queue_t result = ::dispatch_get_main_queue();
  if (failed) {
    *failed = false;
  }
  if (!is_value_dispatch_queue_t(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected dispatch_queue_t");
    }
    return result;
  }
  result = (__bridge dispatch_queue_t)(value.As<External>()->Value());
  return result;
}

NAN_METHOD(dispatch_get_main_queue) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_dispatch_queue_t(::dispatch_get_main_queue()));
  }
}

NAN_METHOD(dispatch_get_global_queue) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, identifier);
    declare_value(NSUInteger, flags);
    JS_SET_RETURN(js_value_dispatch_queue_t(::dispatch_get_global_queue(identifier, flags)));
  }
}

JS_INIT_GLOBALS(DispatchQueue);
  // global values (exports)
  JS_ASSIGN_GLOBAL_METHOD(dispatch_get_main_queue);
  JS_ASSIGN_GLOBAL_METHOD(dispatch_get_global_queue);
JS_INIT_GLOBALS_END(DispatchQueue);
