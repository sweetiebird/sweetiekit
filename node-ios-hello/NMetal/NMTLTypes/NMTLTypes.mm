//
//  NMTLTypes.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLTypes.h"

Local<Value> js_value_MTLSize(const MTLSize& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("width"), js_value_NSUInteger(value.width));
  result->Set(JS_STR("height"), js_value_NSUInteger(value.height));
  result->Set(JS_STR("depth"), js_value_NSUInteger(value.depth));
  return scope.Escape(result);
}

MTLSize to_value_MTLSize(const Local<Value>& value, bool * _Nullable failed) {
  MTLSize result(MTLSizeMake(0,0,0));
  if (failed) {
    *failed = false;
  }
  if (!is_value_MTLSize(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected MTLSize");
    }
    return result;
  }
  result.width = to_value_NSUInteger(JS_OBJ(value)->Get(JS_STR("width")));
  result.height = to_value_NSUInteger(JS_OBJ(value)->Get(JS_STR("height")));
  result.depth = to_value_NSUInteger(JS_OBJ(value)->Get(JS_STR("depth")));
  return result;
}

bool is_value_MTLSize(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  auto obj(JS_OBJ(value));
  if (!is_value_NSUInteger(obj->Get(JS_STR("width")))) {
    return false;
  }
  if (!is_value_NSUInteger(obj->Get(JS_STR("height")))) {
    return false;
  }
  if (!is_value_NSUInteger(obj->Get(JS_STR("depth")))) {
    return false;
  }
  return true;
}

JS_INIT_GLOBALS(MTLTypes);
  // global values (exports)
JS_INIT_GLOBALS_END(MTLTypes);
