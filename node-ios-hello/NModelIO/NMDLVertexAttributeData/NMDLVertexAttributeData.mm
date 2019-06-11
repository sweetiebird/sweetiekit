//
//  NMDLVertexAttributeData.mm
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLVertexAttributeData.h"

#include "NMDLTypes.h"

NMDLVertexAttributeData::NMDLVertexAttributeData() {}
NMDLVertexAttributeData::~NMDLVertexAttributeData() {}

JS_INIT_CLASS(MDLVertexAttributeData, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(map);
  JS_ASSIGN_PROTO_PROP(dataStart);
  JS_ASSIGN_PROTO_PROP(stride);
  JS_ASSIGN_PROTO_PROP(format);
  JS_ASSIGN_PROTO_PROP(bufferSize);
  // static members (ctor)
  JS_INIT_CTOR(MDLVertexAttributeData, NSObject);
JS_INIT_CLASS_END(MDLVertexAttributeData, NSObject);

NAN_METHOD(NMDLVertexAttributeData::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLVertexAttributeData(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLVertexAttributeData, info);
      return;
    }

    MDLVertexAttributeData* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLVertexAttributeData *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLVertexAttributeData alloc] init];
    }
    if (self) {
      NMDLVertexAttributeData *wrapper = new NMDLVertexAttributeData();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLVertexAttributeData::New: invalid arguments");
    }
  }
}

#include "NMDLMeshBufferMap.h"

NAN_GETTER(NMDLVertexAttributeData::mapGetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMeshBufferMap([self map]));
  }
}

NAN_SETTER(NMDLVertexAttributeData::mapSetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MDLMeshBufferMap, input);
    [self setMap: input];
  }
}

NAN_GETTER(NMDLVertexAttributeData::dataStartGetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_void_pointer([self dataStart]));
    #endif
  }
}

NAN_SETTER(NMDLVertexAttributeData::dataStartSetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_setter();
    declare_pointer(void, input);
    [self setDataStart: input];
    #endif
  }
}

NAN_GETTER(NMDLVertexAttributeData::strideGetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self stride]));
  }
}

NAN_SETTER(NMDLVertexAttributeData::strideSetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setStride: input];
  }
}

#include "NMDLVertexDescriptor.h"

NAN_GETTER(NMDLVertexAttributeData::formatGetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLVertexFormat([self format]));
  }
}

NAN_SETTER(NMDLVertexAttributeData::formatSetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MDLVertexFormat, input);
    [self setFormat: input];
  }
}

NAN_GETTER(NMDLVertexAttributeData::bufferSizeGetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self bufferSize]));
  }
}

NAN_SETTER(NMDLVertexAttributeData::bufferSizeSetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setBufferSize: input];
  }
}
