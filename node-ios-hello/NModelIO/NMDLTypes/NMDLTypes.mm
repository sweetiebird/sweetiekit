//
//  NMDLTypes.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLTypes.h"

/*
typedef struct MDL_CLASS_EXPORT {
    vector_float3 maxBounds;
    vector_float3 minBounds;
} MDLAxisAlignedBoundingBox;
*/

Local<Value> js_value_MDLAxisAlignedBoundingBox(const MDLAxisAlignedBoundingBox& value)
{
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("maxBounds"), js_value_vector_float3(value.maxBounds));
  result->Set(JS_STR("minBounds"), js_value_vector_float3(value.minBounds));
  return scope.Escape(result);
}

MDLAxisAlignedBoundingBox to_value_MDLAxisAlignedBoundingBox(Local<Value> value, bool* _Nullable failed)
{
  MDLAxisAlignedBoundingBox result;
  if (failed) {
    *failed = false;
  }
  if (!is_value_MDLAxisAlignedBoundingBox(value))
  {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected a MDLAxisAlignedBoundingBox");
    }
    return result;
  }
  Local<Object> object(JS_OBJ(value));
  result.maxBounds = to_value_vector_float3(object->Get(JS_STR("maxBounds")));
  result.minBounds = to_value_vector_float3(object->Get(JS_STR("minBounds")));
  return result;
}

bool is_value_MDLAxisAlignedBoundingBox(Local<Value> value)
{
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> object(JS_OBJ(value));
  if (!is_value_vector_float3(object->Get(JS_STR("maxBounds")))) {
    return false;
  }
  if (!is_value_vector_float3(object->Get(JS_STR("minBounds")))) {
    return false;
  }
  return true;
}

@implementation MDLTypes : NSObject
@end

NMDLTypes::NMDLTypes() {}
NMDLTypes::~NMDLTypes() {}

JS_INIT_CLASS(MDLTypes, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MDLTypes, NSObject);
JS_INIT_CLASS_END(MDLTypes, NSObject);

NAN_METHOD(NMDLTypes::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLTypes(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLTypes, info);
      return;
    }

    MDLTypes* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLTypes *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLTypes alloc] init];
    }
    if (self) {
      NMDLTypes *wrapper = new NMDLTypes();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLTypes::New: invalid arguments");
    }
  }
}
