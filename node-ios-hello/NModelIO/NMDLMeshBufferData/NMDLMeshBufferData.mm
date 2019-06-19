//
//  NMDLMeshBufferData.mm
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLMeshBufferData.h"

#include "NMDLTypes.h"

#define instancetype MDLMeshBufferData
#define js_value_instancetype js_value_MDLMeshBufferData

NMDLMeshBufferData::NMDLMeshBufferData() {}
NMDLMeshBufferData::~NMDLMeshBufferData() {}

JS_INIT_CLASS(MDLMeshBufferData, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP_READONLY(data);
// MDLMeshBuffer
  JS_ASSIGN_PROTO_METHOD(fillDataOffset);
  JS_ASSIGN_PROTO_METHOD(map);
  // static members (ctor)
  JS_INIT_CTOR(MDLMeshBufferData, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithTypeLength);
  JS_ASSIGN_PROTO_METHOD(initWithTypeData);
JS_INIT_CLASS_END(MDLMeshBufferData, NSObject);

NAN_METHOD(NMDLMeshBufferData::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLMeshBufferData(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLMeshBufferData, info);
      return;
    }

    MDLMeshBufferData* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLMeshBufferData *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLMeshBufferData alloc] init];
    }
    if (self) {
      NMDLMeshBufferData *wrapper = new NMDLMeshBufferData();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLMeshBufferData::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMDLMeshBufferData::initWithTypeLength) {
  JS_UNWRAP_OR_ALLOC(MDLMeshBufferData, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MDLMeshBufferType, type);
    declare_value(NSUInteger, length);
    JS_SET_RETURN(js_value_instancetype([self initWithType: type length: length]));
  }
}

NAN_METHOD(NMDLMeshBufferData::initWithTypeData) {
  JS_UNWRAP_OR_ALLOC(MDLMeshBufferData, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MDLMeshBufferType, type);
    declare_nullable_pointer(NSData, data);
    JS_SET_RETURN(js_value_instancetype([self initWithType: type data: data]));
  }
}

NAN_GETTER(NMDLMeshBufferData::dataGetter) {
  JS_UNWRAP(MDLMeshBufferData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self data]));
  }
}

NAN_METHOD(NMDLMeshBufferData::fillDataOffset) {
  JS_UNWRAP(MDLMeshBufferData, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_value(NSUInteger, offset);
    [self fillData: data offset: offset];
  }
}

#include "NMDLMeshBufferMap.h"

NAN_METHOD(NMDLMeshBufferData::map) {
  JS_UNWRAP(MDLMeshBufferData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMeshBufferMap([self map]));
  }
}
