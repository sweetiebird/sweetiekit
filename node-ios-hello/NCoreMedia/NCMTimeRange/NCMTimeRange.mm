//
//  NCMTimeRange.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCMTimeRange.h"

#include "NMacTypes.h"

#include "NCMTime.h"

Local<Value> js_value_CMTimeRange(const CMTimeRange& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  js_struct_value(CMTime, start);
  js_struct_value(CMTime, duration);
  return scope.Escape(result);
}

CMTimeRange to_value_CMTimeRange(const Local<Value>& value, bool * _Nullable failed) {
  CMTimeRange result;
  to_struct_init_value(CMTime, start, kCMTimeZero);
  to_struct_init_value(CMTime, duration, kCMTimeZero);
  check_struct_type(CMTimeRange);
  to_struct_value(CMTime, start);
  to_struct_value(CMTime, duration);
  return result;
}

bool is_value_CMTimeRange(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  check_struct_value(CMTime, start);
  check_struct_value(CMTime, duration);
  return true;
}

JS_INIT_GLOBALS(CMTimeRange);
  // global values (exports)
JS_INIT_GLOBALS_END(CMTimeRange);
