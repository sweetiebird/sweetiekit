//
//  NAVAudioCompressedBuffer.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioCompressedBuffer.h"

#define instancetype AVAudioCompressedBuffer
#define js_value_instancetype js_value_AVAudioCompressedBuffer

NAVAudioCompressedBuffer::NAVAudioCompressedBuffer() {}
NAVAudioCompressedBuffer::~NAVAudioCompressedBuffer() {}

JS_INIT_CLASS(AVAudioCompressedBuffer, AVAudioBuffer);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP_READONLY(packetCapacity);
  JS_ASSIGN_PROTO_PROP(packetCount);
  JS_ASSIGN_PROTO_PROP_READONLY(maximumPacketSize);
  JS_ASSIGN_PROTO_PROP_READONLY(data);
  JS_ASSIGN_PROTO_PROP_READONLY(byteCapacity);
  JS_ASSIGN_PROTO_PROP(byteLength);
  JS_ASSIGN_PROTO_PROP_READONLY(packetDescriptions);
  // static members (ctor)
  JS_INIT_CTOR(AVAudioCompressedBuffer, AVAudioBuffer);
  JS_ASSIGN_PROTO_METHOD(initWithFormatPacketCapacityMaximumPacketSize);
  JS_ASSIGN_PROTO_METHOD(initWithFormatPacketCapacity);
JS_INIT_CLASS_END(AVAudioCompressedBuffer, AVAudioBuffer);

NAN_METHOD(NAVAudioCompressedBuffer::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioCompressedBuffer(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioCompressedBuffer, info);
      return;
    }

    AVAudioCompressedBuffer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioCompressedBuffer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioCompressedBuffer alloc] init];
    }
    if (self) {
      NAVAudioCompressedBuffer *wrapper = new NAVAudioCompressedBuffer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioCompressedBuffer::New: invalid arguments");
    }
  }
}

#include "NAVAudioFormat.h"
#include "NAVAudioNode.h"

NAN_METHOD(NAVAudioCompressedBuffer::initWithFormatPacketCapacityMaximumPacketSize) {
  JS_UNWRAP_OR_ALLOC(AVAudioCompressedBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioFormat, format);
    declare_value(AVAudioPacketCount, packetCapacity);
    declare_value(NSInteger, maximumPacketSize);
    JS_SET_RETURN(js_value_instancetype([self initWithFormat: format packetCapacity: packetCapacity maximumPacketSize: maximumPacketSize]));
  }
}

NAN_METHOD(NAVAudioCompressedBuffer::initWithFormatPacketCapacity) {
  JS_UNWRAP_OR_ALLOC(AVAudioCompressedBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioFormat, format);
    declare_value(AVAudioPacketCount, packetCapacity);
    JS_SET_RETURN(js_value_instancetype([self initWithFormat: format packetCapacity: packetCapacity]));
  }
}

NAN_GETTER(NAVAudioCompressedBuffer::packetCapacityGetter) {
  JS_UNWRAP(AVAudioCompressedBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioPacketCount([self packetCapacity]));
  }
}

NAN_GETTER(NAVAudioCompressedBuffer::packetCountGetter) {
  JS_UNWRAP(AVAudioCompressedBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioPacketCount([self packetCount]));
  }
}

NAN_SETTER(NAVAudioCompressedBuffer::packetCountSetter) {
  JS_UNWRAP(AVAudioCompressedBuffer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVAudioPacketCount, input);
    [self setPacketCount: input];
  }
}

NAN_GETTER(NAVAudioCompressedBuffer::maximumPacketSizeGetter) {
  JS_UNWRAP(AVAudioCompressedBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self maximumPacketSize]));
  }
}

NAN_GETTER(NAVAudioCompressedBuffer::dataGetter) {
  JS_UNWRAP(AVAudioCompressedBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_void_pointer([self data]));
  }
}

NAN_GETTER(NAVAudioCompressedBuffer::byteCapacityGetter) {
  JS_UNWRAP(AVAudioCompressedBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_uint32_t([self byteCapacity]));
  }
}

NAN_GETTER(NAVAudioCompressedBuffer::byteLengthGetter) {
  JS_UNWRAP(AVAudioCompressedBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_uint32_t([self byteLength]));
  }
}

NAN_SETTER(NAVAudioCompressedBuffer::byteLengthSetter) {
  JS_UNWRAP(AVAudioCompressedBuffer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(uint32_t, input);
    [self setByteLength: input];
  }
}

#include "NCoreAudioTypes.h"

NAN_GETTER(NAVAudioCompressedBuffer::packetDescriptionsGetter) {
  JS_UNWRAP(AVAudioCompressedBuffer, self);
  declare_autoreleasepool {
    auto result = [self packetDescriptions];
    if (result) {
      JS_SET_RETURN(js_value_AudioStreamPacketDescription(*result));
    }
  }
}


