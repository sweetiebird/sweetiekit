//
//  NMTLAttributeDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLAttributeDescriptor.h"

#define instancetype MTLAttributeDescriptor
#define js_value_instancetype js_value_MTLAttributeDescriptor

NMTLAttributeDescriptor::NMTLAttributeDescriptor() {}
NMTLAttributeDescriptor::~NMTLAttributeDescriptor() {}

JS_INIT_CLASS(MTLAttributeDescriptor, NSObject);
  JS_ASSIGN_PROTO_PROP(format);
  JS_ASSIGN_PROTO_PROP(offset);
  JS_ASSIGN_PROTO_PROP(bufferIndex);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLAttributeDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLAttributeDescriptor, NSObject);

NAN_METHOD(NMTLAttributeDescriptor::New) {
  JS_RECONSTRUCT(MTLAttributeDescriptor);
  @autoreleasepool {
    MTLAttributeDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLAttributeDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLAttributeDescriptor alloc] init];
    }
    if (self) {
      NMTLAttributeDescriptor *wrapper = new NMTLAttributeDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLAttributeDescriptor::New: invalid arguments");
    }
  }
}

#include "NMTLStageInputOutputDescriptor.h"

NAN_GETTER(NMTLAttributeDescriptor::formatGetter) {
  JS_UNWRAP(MTLAttributeDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLAttributeFormat([self format]));
  }
}

NAN_SETTER(NMTLAttributeDescriptor::formatSetter) {
  JS_UNWRAP(MTLAttributeDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLAttributeFormat, input);
    [self setFormat: input];
  }
}

NAN_GETTER(NMTLAttributeDescriptor::offsetGetter) {
  JS_UNWRAP(MTLAttributeDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self offset]));
  }
}

NAN_SETTER(NMTLAttributeDescriptor::offsetSetter) {
  JS_UNWRAP(MTLAttributeDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setOffset: input];
  }
}

NAN_GETTER(NMTLAttributeDescriptor::bufferIndexGetter) {
  JS_UNWRAP(MTLAttributeDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self bufferIndex]));
  }
}

NAN_SETTER(NMTLAttributeDescriptor::bufferIndexSetter) {
  JS_UNWRAP(MTLAttributeDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setBufferIndex: input];
  }
}
