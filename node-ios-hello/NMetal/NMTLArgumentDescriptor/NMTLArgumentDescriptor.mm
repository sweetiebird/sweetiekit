//
//  NMTLArgumentDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLArgumentDescriptor.h"

#define instancetype MTLArgumentDescriptor
#define js_value_instancetype js_value_MTLArgumentDescriptor

NMTLArgumentDescriptor::NMTLArgumentDescriptor() {}
NMTLArgumentDescriptor::~NMTLArgumentDescriptor() {}

JS_INIT_CLASS(MTLArgumentDescriptor, NSObject);
  JS_ASSIGN_STATIC_METHOD(argumentDescriptor);
  JS_ASSIGN_PROTO_PROP(dataType);
  JS_ASSIGN_PROTO_PROP(index);
  JS_ASSIGN_PROTO_PROP(arrayLength);
  JS_ASSIGN_PROTO_PROP(access);
  JS_ASSIGN_PROTO_PROP(textureType);
  JS_ASSIGN_PROTO_PROP(constantBlockAlignment);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLArgumentDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLArgumentDescriptor, NSObject);

NAN_METHOD(NMTLArgumentDescriptor::New) {
  JS_RECONSTRUCT(MTLArgumentDescriptor);
  @autoreleasepool {
    MTLArgumentDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLArgumentDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLArgumentDescriptor alloc] init];
    }
    if (self) {
      NMTLArgumentDescriptor *wrapper = new NMTLArgumentDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLArgumentDescriptor::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMTLArgumentDescriptor::argumentDescriptor) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLArgumentDescriptor([MTLArgumentDescriptor argumentDescriptor]));
  }
}

#include "NMTLArgument.h"

NAN_GETTER(NMTLArgumentDescriptor::dataTypeGetter) {
  JS_UNWRAP(MTLArgumentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDataType([self dataType]));
  }
}

NAN_SETTER(NMTLArgumentDescriptor::dataTypeSetter) {
  JS_UNWRAP(MTLArgumentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLDataType, input);
    [self setDataType: input];
  }
}

NAN_GETTER(NMTLArgumentDescriptor::indexGetter) {
  JS_UNWRAP(MTLArgumentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self index]));
  }
}

NAN_SETTER(NMTLArgumentDescriptor::indexSetter) {
  JS_UNWRAP(MTLArgumentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setIndex: input];
  }
}

NAN_GETTER(NMTLArgumentDescriptor::arrayLengthGetter) {
  JS_UNWRAP(MTLArgumentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self arrayLength]));
  }
}

NAN_SETTER(NMTLArgumentDescriptor::arrayLengthSetter) {
  JS_UNWRAP(MTLArgumentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setArrayLength: input];
  }
}

NAN_GETTER(NMTLArgumentDescriptor::accessGetter) {
  JS_UNWRAP(MTLArgumentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLArgumentAccess([self access]));
  }
}

NAN_SETTER(NMTLArgumentDescriptor::accessSetter) {
  JS_UNWRAP(MTLArgumentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLArgumentAccess, input);
    [self setAccess: input];
  }
}

#include "NMTLTexture.h"

NAN_GETTER(NMTLArgumentDescriptor::textureTypeGetter) {
  JS_UNWRAP(MTLArgumentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTextureType([self textureType]));
  }
}

NAN_SETTER(NMTLArgumentDescriptor::textureTypeSetter) {
  JS_UNWRAP(MTLArgumentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLTextureType, input);
    [self setTextureType: input];
  }
}

NAN_GETTER(NMTLArgumentDescriptor::constantBlockAlignmentGetter) {
  JS_UNWRAP(MTLArgumentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self constantBlockAlignment]));
  }
}

NAN_SETTER(NMTLArgumentDescriptor::constantBlockAlignmentSetter) {
  JS_UNWRAP(MTLArgumentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setConstantBlockAlignment: input];
  }
}
