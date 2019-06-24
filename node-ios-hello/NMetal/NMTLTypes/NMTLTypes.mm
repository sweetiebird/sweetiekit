//
//  NMTLTypes.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLTypes.h"

Local<Value> js_value_MTLOrigin(const MTLOrigin& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("x"), js_value_NSUInteger(value.x));
  result->Set(JS_STR("y"), js_value_NSUInteger(value.y));
  result->Set(JS_STR("z"), js_value_NSUInteger(value.z));
  return scope.Escape(result);
}

MTLOrigin to_value_MTLOrigin(const Local<Value>& value, bool * _Nullable failed) {
  MTLOrigin result(MTLOriginMake(0,0,0));
  if (failed) {
    *failed = false;
  }
  if (!is_value_MTLOrigin(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected MTLOrigin");
    }
    return result;
  }
  result.x = to_value_NSUInteger(JS_OBJ(value)->Get(JS_STR("x")));
  result.y = to_value_NSUInteger(JS_OBJ(value)->Get(JS_STR("y")));
  result.z = to_value_NSUInteger(JS_OBJ(value)->Get(JS_STR("z")));
  return result;
}

bool is_value_MTLOrigin(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  auto obj(JS_OBJ(value));
  if (!is_value_NSUInteger(obj->Get(JS_STR("x")))) {
    return false;
  }
  if (!is_value_NSUInteger(obj->Get(JS_STR("y")))) {
    return false;
  }
  if (!is_value_NSUInteger(obj->Get(JS_STR("z")))) {
    return false;
  }
  return true;
}

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

Local<Value> js_value_MTLRegion(const MTLRegion& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("origin"), js_value_MTLOrigin(value.origin));
  result->Set(JS_STR("size"), js_value_MTLSize(value.size));
  return scope.Escape(result);
}

MTLRegion to_value_MTLRegion(const Local<Value>& value, bool * _Nullable failed) {
  MTLRegion result;
  result.origin = MTLOriginMake(0, 0, 0);
  result.size = MTLSizeMake(0, 0, 0);
  if (failed) {
    *failed = false;
  }
  if (!is_value_MTLRegion(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected MTLRegion");
    }
    return result;
  }
  result.origin = to_value_MTLOrigin(JS_OBJ(value)->Get(JS_STR("origin")));
  result.size = to_value_MTLSize(JS_OBJ(value)->Get(JS_STR("size")));
  return result;
}

bool is_value_MTLRegion(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  auto obj(JS_OBJ(value));
  if (!is_value_MTLOrigin(obj->Get(JS_STR("origin")))) {
    return false;
  }
  if (!is_value_MTLSize(obj->Get(JS_STR("size")))) {
    return false;
  }
  return true;
}

JS_INIT_GLOBALS(MTLTypes);
  // global values (exports)
JS_INIT_GLOBALS_END(MTLTypes);
