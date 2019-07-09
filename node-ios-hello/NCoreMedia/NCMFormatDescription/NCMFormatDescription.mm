//
//  NCMFormatDescription.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCMFormatDescription.h"

#include "NMacTypes.h"

Local<Value> js_value_CMVideoDimensions(const CMVideoDimensions& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  js_struct_value(int32_t, width);
  js_struct_value(int32_t, height);
  return scope.Escape(result);
}

CMVideoDimensions to_value_CMVideoDimensions(const Local<Value>& value, bool * _Nullable failed) {
  CMVideoDimensions result;
  to_struct_init_value(int32_t, width, 0);
  to_struct_init_value(int32_t, height, 0);
  check_struct_type(CMVideoDimensions);
  to_struct_value(int32_t, width);
  to_struct_value(int32_t, height);
  return result;
}

bool is_value_CMVideoDimensions(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  check_struct_value(int32_t, width);
  check_struct_value(int32_t, height);
  return true;
}


JS_INIT_GLOBALS(CMFormatDescription);
  // global values (exports)
  
  JS_ASSIGN_ENUM(kCMFormatDescriptionError_InvalidParameter, OSStatus); //     = -12710,
  JS_ASSIGN_ENUM(kCMFormatDescriptionError_AllocationFailed, OSStatus); //     = -12711,
  JS_ASSIGN_ENUM(kCMFormatDescriptionError_ValueNotAvailable, OSStatus); //     = -12718,

JS_INIT_GLOBALS_END(CMFormatDescription);
