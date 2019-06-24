//
//  NMTLVertexAttribute.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLVertexAttribute.h"

#define instancetype MTLVertexAttribute
#define js_value_instancetype js_value_MTLVertexAttribute

NMTLVertexAttribute::NMTLVertexAttribute() {}
NMTLVertexAttribute::~NMTLVertexAttribute() {}

JS_INIT_CLASS(MTLVertexAttribute, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(name);
  JS_ASSIGN_PROTO_PROP_READONLY(attributeIndex);
  JS_ASSIGN_PROTO_PROP_READONLY(attributeType);
  JS_ASSIGN_PROTO_PROP_READONLY(isActive);
  JS_ASSIGN_PROTO_PROP_READONLY(isPatchData);
  JS_ASSIGN_PROTO_PROP_READONLY(isPatchControlPointData);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLVertexAttribute, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLVertexAttribute, NSObject);

NAN_METHOD(NMTLVertexAttribute::New) {
  JS_RECONSTRUCT(MTLVertexAttribute);
  @autoreleasepool {
    MTLVertexAttribute* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLVertexAttribute *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLVertexAttribute alloc] init];
    }
    if (self) {
      NMTLVertexAttribute *wrapper = new NMTLVertexAttribute();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLVertexAttribute::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMTLVertexAttribute::nameGetter) {
  JS_UNWRAP(MTLVertexAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_GETTER(NMTLVertexAttribute::attributeIndexGetter) {
  JS_UNWRAP(MTLVertexAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self attributeIndex]));
  }
}

#include "NMTLArgument.h"

NAN_GETTER(NMTLVertexAttribute::attributeTypeGetter) {
  JS_UNWRAP(MTLVertexAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDataType([self attributeType]));
  }
}

NAN_GETTER(NMTLVertexAttribute::isActiveGetter) {
  JS_UNWRAP(MTLVertexAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isActive]));
  }
}

NAN_GETTER(NMTLVertexAttribute::isPatchDataGetter) {
  JS_UNWRAP(MTLVertexAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPatchData]));
  }
}

NAN_GETTER(NMTLVertexAttribute::isPatchControlPointDataGetter) {
  JS_UNWRAP(MTLVertexAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPatchControlPointData]));
  }
}
