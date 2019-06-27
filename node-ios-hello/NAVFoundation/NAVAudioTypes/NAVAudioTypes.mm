//
//  NAVAudioTypes.mm
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioTypes.h"

JS_INIT_GLOBALS(AVAudioTypes);
  // global values (exports)
JS_INIT_GLOBALS_END(AVAudioTypes);

Local<Value>
js_value_AVAudio3DPoint(const AVAudio3DPoint& value)
{
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("x"), js_value_float(value.x));
  result->Set(JS_STR("y"), js_value_float(value.y));
  result->Set(JS_STR("z"), js_value_float(value.z));
  return scope.Escape(result);
}

AVAudio3DPoint
to_value_AVAudio3DPoint(const Local<Value>& value, bool* _Nullable failed)
{
  AVAudio3DPoint result;
  if (failed) {
    *failed = false;
  }
  if (!is_value_AVAudio3DPoint(value))
  {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected a AVAudio3DPoint");
    }
    return result;
  }
  Local<Object> object(JS_OBJ(value));
  result.x = to_value_float(object->Get(JS_STR("x")));
  result.y = to_value_float(object->Get(JS_STR("y")));
  result.z = to_value_float(object->Get(JS_STR("z")));
  return result;
}

bool
is_value_AVAudio3DPoint(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> object(JS_OBJ(value));
  if (!is_value_float(object->Get(JS_STR("x")))) {
    return false;
  }
  if (!is_value_float(object->Get(JS_STR("y")))) {
    return false;
  }
  if (!is_value_float(object->Get(JS_STR("z")))) {
    return false;
  }
  return true;
}


Local<Value>
js_value_AVAudio3DVector(const AVAudio3DVector& value)
{
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("x"), js_value_float(value.x));
  result->Set(JS_STR("y"), js_value_float(value.y));
  result->Set(JS_STR("z"), js_value_float(value.z));
  return scope.Escape(result);
}

AVAudio3DVector
to_value_AVAudio3DVector(const Local<Value>& value, bool* _Nullable failed)
{
  AVAudio3DVector result;
  if (failed) {
    *failed = false;
  }
  if (!is_value_AVAudio3DVector(value))
  {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected a AVAudio3DVector");
    }
    return result;
  }
  Local<Object> object(JS_OBJ(value));
  result.x = to_value_float(object->Get(JS_STR("x")));
  result.y = to_value_float(object->Get(JS_STR("y")));
  result.z = to_value_float(object->Get(JS_STR("z")));
  return result;
}

bool
is_value_AVAudio3DVector(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> object(JS_OBJ(value));
  if (!is_value_float(object->Get(JS_STR("x")))) {
    return false;
  }
  if (!is_value_float(object->Get(JS_STR("y")))) {
    return false;
  }
  if (!is_value_float(object->Get(JS_STR("z")))) {
    return false;
  }
  return true;
}



Local<Value>
js_value_AVAudio3DVectorOrientation(const AVAudio3DVectorOrientation& value)
{
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("forward"), js_value_AVAudio3DVector(value.forward));
  result->Set(JS_STR("up"), js_value_AVAudio3DVector(value.up));
  return scope.Escape(result);
}

AVAudio3DVectorOrientation
to_value_AVAudio3DVectorOrientation(const Local<Value>& value, bool* _Nullable failed)
{
  AVAudio3DVectorOrientation result;
  if (failed) {
    *failed = false;
  }
  if (!is_value_AVAudio3DVectorOrientation(value))
  {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected a AVAudio3DVectorOrientation");
    }
    return result;
  }
  Local<Object> object(JS_OBJ(value));
  result.forward = to_value_AVAudio3DVector(object->Get(JS_STR("forward")));
  result.up = to_value_AVAudio3DVector(object->Get(JS_STR("up")));
  return result;
}

bool
is_value_AVAudio3DVectorOrientation(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> object(JS_OBJ(value));
  if (!is_value_AVAudio3DVector(object->Get(JS_STR("forward")))) {
    return false;
  }
  if (!is_value_AVAudio3DVector(object->Get(JS_STR("up")))) {
    return false;
  }
  return true;
}

Local<Value>
js_value_AVAudio3DAngularOrientation(const AVAudio3DAngularOrientation& value)
{
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("yaw"), js_value_float(value.yaw));
  result->Set(JS_STR("pitch"), js_value_float(value.pitch));
  result->Set(JS_STR("roll"), js_value_float(value.roll));
  return scope.Escape(result);
}

AVAudio3DAngularOrientation
to_value_AVAudio3DAngularOrientation(const Local<Value>& value, bool* _Nullable failed)
{
  AVAudio3DAngularOrientation result;
  if (failed) {
    *failed = false;
  }
  if (!is_value_AVAudio3DAngularOrientation(value))
  {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected a AVAudio3DAngularOrientation");
    }
    return result;
  }
  Local<Object> object(JS_OBJ(value));
  result.yaw = to_value_float(object->Get(JS_STR("yaw")));
  result.pitch = to_value_float(object->Get(JS_STR("pitch")));
  result.roll = to_value_float(object->Get(JS_STR("roll")));
  return result;
}

bool
is_value_AVAudio3DAngularOrientation(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> object(JS_OBJ(value));
  if (!is_value_float(object->Get(JS_STR("yaw")))) {
    return false;
  }
  if (!is_value_float(object->Get(JS_STR("pitch")))) {
    return false;
  }
  if (!is_value_float(object->Get(JS_STR("roll")))) {
    return false;
  }
  return true;
}
