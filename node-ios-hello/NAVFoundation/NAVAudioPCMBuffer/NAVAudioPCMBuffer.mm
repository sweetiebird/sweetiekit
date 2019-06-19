//
//  NAVAudioPCMBuffer.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioPCMBuffer.h"

#define instancetype AVAudioPCMBuffer
#define js_value_instancetype js_value_AVAudioPCMBuffer

NAVAudioPCMBuffer::NAVAudioPCMBuffer() {}
NAVAudioPCMBuffer::~NAVAudioPCMBuffer() {}

JS_INIT_CLASS(AVAudioPCMBuffer, AVAudioBuffer);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP_READONLY(frameCapacity);
  JS_ASSIGN_PROTO_PROP(frameLength);
  JS_ASSIGN_PROTO_PROP_READONLY(stride);
  JS_ASSIGN_PROTO_PROP_READONLY(floatChannelData);
  JS_ASSIGN_PROTO_PROP_READONLY(int16ChannelData);
  JS_ASSIGN_PROTO_PROP_READONLY(int32ChannelData);
  // static members (ctor)
  JS_INIT_CTOR(AVAudioPCMBuffer, AVAudioBuffer);
  JS_ASSIGN_PROTO_METHOD(initWithPCMFormatFrameCapacity);
JS_INIT_CLASS_END(AVAudioPCMBuffer, AVAudioBuffer);

NAN_METHOD(NAVAudioPCMBuffer::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioPCMBuffer(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioPCMBuffer, info);
      return;
    }

    AVAudioPCMBuffer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioPCMBuffer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioPCMBuffer alloc] init];
    }
    if (self) {
      NAVAudioPCMBuffer *wrapper = new NAVAudioPCMBuffer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioPCMBuffer::New: invalid arguments");
    }
  }
}

#include "NAVAudioFormat.h"
#include "NAVAudioNode.h"

NAN_METHOD(NAVAudioPCMBuffer::initWithPCMFormatFrameCapacity) {
  JS_UNWRAP_OR_ALLOC(AVAudioPCMBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioFormat, format);
    declare_value(AVAudioFrameCount, frameCapacity);
    JS_SET_RETURN(js_value_instancetype([self initWithPCMFormat: format frameCapacity: frameCapacity]));
  }
}

NAN_GETTER(NAVAudioPCMBuffer::frameCapacityGetter) {
  JS_UNWRAP(AVAudioPCMBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioFrameCount([self frameCapacity]));
  }
}

NAN_GETTER(NAVAudioPCMBuffer::frameLengthGetter) {
  JS_UNWRAP(AVAudioPCMBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioFrameCount([self frameLength]));
  }
}

NAN_SETTER(NAVAudioPCMBuffer::frameLengthSetter) {
  JS_UNWRAP(AVAudioPCMBuffer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVAudioFrameCount, input);
    [self setFrameLength: input];
  }
}

NAN_GETTER(NAVAudioPCMBuffer::strideGetter) {
  JS_UNWRAP(AVAudioPCMBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self stride]));
  }
}

NAN_GETTER(NAVAudioPCMBuffer::floatChannelDataGetter) {
  JS_UNWRAP(AVAudioPCMBuffer, self);
  declare_autoreleasepool {
    auto channelData = [self floatChannelData];
    auto channelCount = [self format].channelCount;
    Local<Array> result(Array::New(JS_ISOLATE(), channelCount));
    for (uint32_t i = 0, n = channelCount; i < n; i++) {
      result->Set(i, createExternalTypedArray<Float32Array>(
        static_cast<size_t>([self frameLength]),
        static_cast<size_t>([self stride]),
        channelData[0]));
    }
    JS_SET_RETURN(result);
  }
}

NAN_GETTER(NAVAudioPCMBuffer::int16ChannelDataGetter) {
  JS_UNWRAP(AVAudioPCMBuffer, self);
  declare_autoreleasepool {
    auto channelData = [self int16ChannelData];
    auto channelCount = [self format].channelCount;
    Local<Array> result(Array::New(JS_ISOLATE(), channelCount));
    for (uint32_t i = 0, n = channelCount; i < n; i++) {
      result->Set(i, createExternalTypedArray<Int16Array>(
        static_cast<size_t>([self frameLength]),
        static_cast<size_t>([self stride]),
        channelData[i]));
    }
    JS_SET_RETURN(result);
  }
}

NAN_GETTER(NAVAudioPCMBuffer::int32ChannelDataGetter) {
  JS_UNWRAP(AVAudioPCMBuffer, self);
  declare_autoreleasepool {
    auto channelData = [self int32ChannelData];
    auto channelCount = [self format].channelCount;
    Local<Array> result(Array::New(JS_ISOLATE(), channelCount));
    for (uint32_t i = 0, n = channelCount; i < n; i++) {
      result->Set(i, createExternalTypedArray<Int32Array>(
        static_cast<size_t>([self frameLength]),
        static_cast<size_t>([self stride]),
        channelData[i]));
    }
    JS_SET_RETURN(result);
  }
}
