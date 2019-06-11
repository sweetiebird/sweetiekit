//
//  NCoreAudioTypes.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCoreAudioTypes.h"

/*
struct  AudioStreamPacketDescription
{
    SInt64  mStartOffset;
    UInt32  mVariableFramesInPacket;
    UInt32  mDataByteSize;
};
*/

Local<Value>
js_value_AudioStreamPacketDescription(const AudioStreamPacketDescription* value)
{
  if (!value) {
    return Nan::Undefined();
  }
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("StartOffset"), js_value_int64_t(value->mStartOffset));
  result->Set(JS_STR("VariableFramesInPacket"), js_value_uint32_t(value->mVariableFramesInPacket));
  result->Set(JS_STR("DataByteSize"), js_value_uint32_t(value->mDataByteSize));
  return scope.Escape(result);
}

AudioStreamPacketDescription
to_value_AudioStreamPacketDescription(Local<Value> value, bool* _Nullable failed)
{
  AudioStreamPacketDescription result;
  if (failed) {
    *failed = false;
  }
  if (!is_value_AudioStreamPacketDescription(value))
  {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected a AudioStreamPacketDescription");
    }
    return result;
  }
  Local<Object> object(JS_OBJ(value));
  result.mStartOffset = to_value_int64_t(object->Get(JS_STR("StartOffset")));
  result.mVariableFramesInPacket = to_value_uint32_t(object->Get(JS_STR("VariableFramesInPacket")));
  result.mDataByteSize = to_value_uint32_t(object->Get(JS_STR("DataByteSize")));
  return result;
}

bool
is_value_AudioStreamPacketDescription(Local<Value> value)
{
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> object(JS_OBJ(value));
  if (!is_value_int64_t(object->Get(JS_STR("StartOffset")))) {
    return false;
  }
  if (!is_value_uint32_t(object->Get(JS_STR("VariableFramesInPacket")))) {
    return false;
  }
  if (!is_value_uint32_t(object->Get(JS_STR("DataByteSize")))) {
    return false;
  }
  return true;
}

/*
struct AudioStreamBasicDescription
{
    Float64             mSampleRate;
    AudioFormatID       mFormatID;
    AudioFormatFlags    mFormatFlags;
    UInt32              mBytesPerPacket;
    UInt32              mFramesPerPacket;
    UInt32              mBytesPerFrame;
    UInt32              mChannelsPerFrame;
    UInt32              mBitsPerChannel;
    UInt32              mReserved;
};
*/

Local<Value>
js_value_AudioStreamBasicDescription(const AudioStreamBasicDescription* value)
{
  if (!value) {
    return Nan::Undefined();
  }
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("SampleRate"), js_value_double(value->mSampleRate));
  result->Set(JS_STR("FormatID"), js_value_uint32_t(value->mFormatID));
  result->Set(JS_STR("FormatFlags"), js_value_uint32_t(value->mFormatFlags));
  result->Set(JS_STR("BytesPerPacket"), js_value_uint32_t(value->mBytesPerPacket));
  result->Set(JS_STR("FramesPerPacket"), js_value_uint32_t(value->mFramesPerPacket));
  result->Set(JS_STR("BytesPerFrame"), js_value_uint32_t(value->mBytesPerFrame));
  result->Set(JS_STR("ChannelsPerFrame"), js_value_uint32_t(value->mChannelsPerFrame));
  result->Set(JS_STR("BitsPerChannel"), js_value_uint32_t(value->mBitsPerChannel));
  result->Set(JS_STR("Reserved"), js_value_uint32_t(value->mReserved));
  return scope.Escape(result);
}

AudioStreamBasicDescription
to_value_AudioStreamBasicDescription(Local<Value> value, bool* _Nullable failed)
{
  AudioStreamBasicDescription result;
  if (failed) {
    *failed = false;
  }
  if (!is_value_AudioStreamBasicDescription(value))
  {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected a AudioStreamBasicDescription");
    }
    return result;
  }
  Local<Object> object(JS_OBJ(value));
  result.mSampleRate = to_value_double(object->Get(JS_STR("SampleRate")));
  result.mFormatID = to_value_uint32_t(object->Get(JS_STR("FormatID")));
  result.mFormatFlags = to_value_uint32_t(object->Get(JS_STR("FormatFlags")));
  result.mBytesPerPacket = to_value_uint32_t(object->Get(JS_STR("BytesPerPacket")));
  result.mFramesPerPacket = to_value_uint32_t(object->Get(JS_STR("FramesPerPacket")));
  result.mBytesPerFrame = to_value_uint32_t(object->Get(JS_STR("BytesPerFrame")));
  result.mChannelsPerFrame = to_value_uint32_t(object->Get(JS_STR("ChannelsPerFrame")));
  result.mBitsPerChannel = to_value_uint32_t(object->Get(JS_STR("BitsPerChannel")));
  result.mReserved = to_value_uint32_t(object->Get(JS_STR("Reserved")));
  return result;
}

bool
is_value_AudioStreamBasicDescription(Local<Value> value)
{
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> object(JS_OBJ(value));
  if (!is_value_double(object->Get(JS_STR("SampleRate")))) {
    return false;
  }
  if (!is_value_uint32_t(object->Get(JS_STR("FormatID")))) {
    return false;
  }
  if (!is_value_uint32_t(object->Get(JS_STR("FormatFlags")))) {
    return false;
  }
  if (!is_value_uint32_t(object->Get(JS_STR("BytesPerPacket")))) {
    return false;
  }
  if (!is_value_uint32_t(object->Get(JS_STR("FramesPerPacket")))) {
    return false;
  }
  if (!is_value_uint32_t(object->Get(JS_STR("BytesPerFrame")))) {
    return false;
  }
  if (!is_value_uint32_t(object->Get(JS_STR("ChannelsPerFrame")))) {
    return false;
  }
  if (!is_value_uint32_t(object->Get(JS_STR("BitsPerChannel")))) {
    return false;
  }
  if (!is_value_uint32_t(object->Get(JS_STR("Reserved")))) {
    return false;
  }
  return true;
}

/*
typedef struct AudioComponentDescription {
    OSType              componentType;
    OSType              componentSubType;
    OSType              componentManufacturer;
    UInt32              componentFlags;
    UInt32              componentFlagsMask;
} AudioComponentDescription;
*/

#include "NAUAudioUnit.h"

Local<Value>
js_value_AudioComponentDescription(const AudioComponentDescription& value)
{
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("componentType"), js_value_OSType(value.componentType));
  result->Set(JS_STR("componentSubType"), js_value_OSType(value.componentSubType));
  result->Set(JS_STR("componentManufacturer"), js_value_OSType(value.componentManufacturer));
  result->Set(JS_STR("componentFlags"), js_value_uint32_t(value.componentFlags));
  result->Set(JS_STR("componentFlagsMask"), js_value_uint32_t(value.componentFlagsMask));
  return scope.Escape(result);
}

AudioComponentDescription
to_value_AudioComponentDescription(Local<Value> value, bool* _Nullable failed)
{
  AudioComponentDescription result;
  if (failed) {
    *failed = false;
  }
  if (!is_value_AudioComponentDescription(value))
  {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected a AudioComponentDescription");
    }
    return result;
  }
  Local<Object> object(JS_OBJ(value));
  result.componentType = to_value_OSType(object->Get(JS_STR("componentType")));
  result.componentSubType = to_value_OSType(object->Get(JS_STR("componentSubType")));
  result.componentManufacturer = to_value_OSType(object->Get(JS_STR("componentManufacturer")));
  result.componentFlags = to_value_uint32_t(object->Get(JS_STR("componentFlags")));
  result.componentFlagsMask = to_value_uint32_t(object->Get(JS_STR("componentFlagsMask")));
  return result;
}

bool
is_value_AudioComponentDescription(Local<Value> value)
{
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> object(JS_OBJ(value));
  if (!is_value_OSType(object->Get(JS_STR("componentType")))) {
    return false;
  }
  if (!is_value_OSType(object->Get(JS_STR("componentSubType")))) {
    return false;
  }
  if (!is_value_OSType(object->Get(JS_STR("componentManufacturer")))) {
    return false;
  }
  if (!is_value_uint32_t(object->Get(JS_STR("componentFlags")))) {
    return false;
  }
  if (!is_value_uint32_t(object->Get(JS_STR("componentFlagsMask")))) {
    return false;
  }
  return true;
}

@implementation CoreAudioTypes : NSObject
@end

NCoreAudioTypes::NCoreAudioTypes() {}
NCoreAudioTypes::~NCoreAudioTypes() {}

JS_INIT_CLASS(CoreAudioTypes, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CoreAudioTypes, NSObject);
JS_INIT_CLASS_END(CoreAudioTypes, NSObject);

NAN_METHOD(NCoreAudioTypes::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'CoreAudioTypes(...)', turn into construct call.
      JS_SET_RETURN_NEW(CoreAudioTypes, info);
      return;
    }

    CoreAudioTypes* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge CoreAudioTypes *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CoreAudioTypes alloc] init];
    }
    if (self) {
      NCoreAudioTypes *wrapper = new NCoreAudioTypes();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CoreAudioTypes::New: invalid arguments");
    }
  }
}
