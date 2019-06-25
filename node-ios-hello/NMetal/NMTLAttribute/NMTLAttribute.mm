//
//  NMTLAttribute.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLAttribute.h"

#define instancetype MTLAttribute
#define js_value_instancetype js_value_MTLAttribute

NMTLAttribute::NMTLAttribute() {}
NMTLAttribute::~NMTLAttribute() {}

JS_INIT_CLASS(MTLAttribute, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(name);
  JS_ASSIGN_PROTO_PROP_READONLY(attributeIndex);
  JS_ASSIGN_PROTO_PROP_READONLY(attributeType);
  JS_ASSIGN_PROTO_PROP_READONLY(isActive);
  JS_ASSIGN_PROTO_PROP_READONLY(isPatchData);
  JS_ASSIGN_PROTO_PROP_READONLY(isPatchControlPointData);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLAttribute, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLAttribute, NSObject);

NAN_METHOD(NMTLAttribute::New) {
  JS_RECONSTRUCT(MTLAttribute);
  @autoreleasepool {
    MTLAttribute* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLAttribute *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLAttribute alloc] init];
    }
    if (self) {
      NMTLAttribute *wrapper = new NMTLAttribute();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLAttribute::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMTLAttribute::nameGetter) {
  JS_UNWRAP(MTLAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_GETTER(NMTLAttribute::attributeIndexGetter) {
  JS_UNWRAP(MTLAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self attributeIndex]));
  }
}

#include "NMTLArgument.h"

NAN_GETTER(NMTLAttribute::attributeTypeGetter) {
  JS_UNWRAP(MTLAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDataType([self attributeType]));
  }
}

NAN_GETTER(NMTLAttribute::isActiveGetter) {
  JS_UNWRAP(MTLAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isActive]));
  }
}

NAN_GETTER(NMTLAttribute::isPatchDataGetter) {
  JS_UNWRAP(MTLAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPatchData]));
  }
}

NAN_GETTER(NMTLAttribute::isPatchControlPointDataGetter) {
  JS_UNWRAP(MTLAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPatchControlPointData]));
  }
}
