//
//  NMTLVertexAttributeDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLVertexAttributeDescriptor.h"

#define instancetype MTLVertexAttributeDescriptor
#define js_value_instancetype js_value_MTLVertexAttributeDescriptor

NMTLVertexAttributeDescriptor::NMTLVertexAttributeDescriptor() {}
NMTLVertexAttributeDescriptor::~NMTLVertexAttributeDescriptor() {}

JS_INIT_CLASS(MTLVertexAttributeDescriptor, NSObject);
  JS_ASSIGN_PROTO_PROP(format);
  JS_ASSIGN_PROTO_PROP(offset);
  JS_ASSIGN_PROTO_PROP(bufferIndex);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLVertexAttributeDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLVertexAttributeDescriptor, NSObject);

NAN_METHOD(NMTLVertexAttributeDescriptor::New) {
  JS_RECONSTRUCT(MTLVertexAttributeDescriptor);
  @autoreleasepool {
    MTLVertexAttributeDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLVertexAttributeDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLVertexAttributeDescriptor alloc] init];
    }
    if (self) {
      NMTLVertexAttributeDescriptor *wrapper = new NMTLVertexAttributeDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLVertexAttributeDescriptor::New: invalid arguments");
    }
  }
}

#include "NMTLVertexDescriptor.h"

NAN_GETTER(NMTLVertexAttributeDescriptor::formatGetter) {
  JS_UNWRAP(MTLVertexAttributeDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLVertexFormat([self format]));
  }
}

NAN_SETTER(NMTLVertexAttributeDescriptor::formatSetter) {
  JS_UNWRAP(MTLVertexAttributeDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLVertexFormat, input);
    [self setFormat: input];
  }
}

NAN_GETTER(NMTLVertexAttributeDescriptor::offsetGetter) {
  JS_UNWRAP(MTLVertexAttributeDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self offset]));
  }
}

NAN_SETTER(NMTLVertexAttributeDescriptor::offsetSetter) {
  JS_UNWRAP(MTLVertexAttributeDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setOffset: input];
  }
}

NAN_GETTER(NMTLVertexAttributeDescriptor::bufferIndexGetter) {
  JS_UNWRAP(MTLVertexAttributeDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self bufferIndex]));
  }
}

NAN_SETTER(NMTLVertexAttributeDescriptor::bufferIndexSetter) {
  JS_UNWRAP(MTLVertexAttributeDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setBufferIndex: input];
  }
}
