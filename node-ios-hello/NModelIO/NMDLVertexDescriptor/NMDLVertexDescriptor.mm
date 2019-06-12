//
//  NMDLVertexDescriptor.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLVertexDescriptor.h"

#define instancetype MDLVertexDescriptor
#define js_value_instancetype js_value_MDLVertexDescriptor

NMDLVertexDescriptor::NMDLVertexDescriptor() {}
NMDLVertexDescriptor::~NMDLVertexDescriptor() {}

JS_INIT_CLASS(MDLVertexDescriptor, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(attributes);
  JS_ASSIGN_PROTO_PROP(layouts);
  // static members (ctor)
  JS_INIT_CTOR(MDLVertexDescriptor, NSObject);
  JS_ASSIGN_STATIC_METHOD(initWithVertexDescriptor);
  JS_ASSIGN_PROTO_METHOD(attributeNamed);
  JS_ASSIGN_PROTO_METHOD(addOrReplaceAttribute);
  JS_ASSIGN_PROTO_METHOD(removeAttributeNamed);
  JS_ASSIGN_PROTO_METHOD(reset);
  JS_ASSIGN_PROTO_METHOD(setPackedStrides);
  JS_ASSIGN_PROTO_METHOD(setPackedOffsets);
  // constants
#define JS_ASSIGN_ENUM(name, type) \
  exports->Set(JS_STR(#name), js_value_##type(name))
  
    JS_ASSIGN_ENUM(MDLVertexFormatInvalid, NSUInteger);
    
    JS_ASSIGN_ENUM(MDLVertexFormatPackedBit, NSUInteger);

    JS_ASSIGN_ENUM(MDLVertexFormatUCharBits, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatCharBits, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUCharNormalizedBits, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatCharNormalizedBits, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUShortBits, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatShortBits, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUShortNormalizedBits, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatShortNormalizedBits, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUIntBits, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatIntBits, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatHalfBits, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatFloatBits, NSUInteger);
    
    JS_ASSIGN_ENUM(MDLVertexFormatUChar, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUChar2, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUChar3, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUChar4, NSUInteger);

    JS_ASSIGN_ENUM(MDLVertexFormatChar, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatChar2, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatChar3, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatChar4, NSUInteger);

    JS_ASSIGN_ENUM(MDLVertexFormatUCharNormalized, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUChar2Normalized, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUChar3Normalized, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUChar4Normalized, NSUInteger);

    JS_ASSIGN_ENUM(MDLVertexFormatCharNormalized, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatChar2Normalized, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatChar3Normalized, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatChar4Normalized, NSUInteger);

    JS_ASSIGN_ENUM(MDLVertexFormatUShort, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUShort2, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUShort3, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUShort4, NSUInteger);

    JS_ASSIGN_ENUM(MDLVertexFormatShort, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatShort2, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatShort3, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatShort4, NSUInteger);

    JS_ASSIGN_ENUM(MDLVertexFormatUShortNormalized, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUShort2Normalized, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUShort3Normalized, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUShort4Normalized, NSUInteger);

    JS_ASSIGN_ENUM(MDLVertexFormatShortNormalized, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatShort2Normalized, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatShort3Normalized, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatShort4Normalized, NSUInteger);

    JS_ASSIGN_ENUM(MDLVertexFormatUInt, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUInt2, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUInt3, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUInt4, NSUInteger);

    JS_ASSIGN_ENUM(MDLVertexFormatInt, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatInt2, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatInt3, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatInt4, NSUInteger);

    JS_ASSIGN_ENUM(MDLVertexFormatHalf, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatHalf2, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatHalf3, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatHalf4, NSUInteger);

    JS_ASSIGN_ENUM(MDLVertexFormatFloat, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatFloat2, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatFloat3, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatFloat4, NSUInteger);

    JS_ASSIGN_ENUM(MDLVertexFormatInt1010102Normalized, NSUInteger);
    JS_ASSIGN_ENUM(MDLVertexFormatUInt1010102Normalized, NSUInteger);

JS_INIT_CLASS_END(MDLVertexDescriptor, NSObject);

NAN_METHOD(NMDLVertexDescriptor::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLVertexDescriptor(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLVertexDescriptor, info);
      return;
    }

    MDLVertexDescriptor* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLVertexDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLVertexDescriptor alloc] init];
    }
    if (self) {
      NMDLVertexDescriptor *wrapper = new NMDLVertexDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLVertexDescriptor::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMDLVertexDescriptor::initWithVertexDescriptor) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLVertexDescriptor, vertexDescriptor);
    JS_SET_RETURN(js_value_instancetype([[MDLVertexDescriptor alloc] initWithVertexDescriptor: vertexDescriptor]));
  }
}

#include "NMDLVertexAttribute.h"

NAN_METHOD(NMDLVertexDescriptor::attributeNamed) {
  JS_UNWRAP(MDLVertexDescriptor, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    JS_SET_RETURN(js_value_MDLVertexAttribute([self attributeNamed: name]));
  }
}

NAN_METHOD(NMDLVertexDescriptor::addOrReplaceAttribute) {
  JS_UNWRAP(MDLVertexDescriptor, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLVertexAttribute, attribute);
    [self addOrReplaceAttribute: attribute];
  }
}

NAN_METHOD(NMDLVertexDescriptor::removeAttributeNamed) {
  JS_UNWRAP(MDLVertexDescriptor, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    [self removeAttributeNamed: name];
  }
}

NAN_METHOD(NMDLVertexDescriptor::reset) {
  JS_UNWRAP(MDLVertexDescriptor, self);
  declare_autoreleasepool {
    [self reset];
  }
}

NAN_METHOD(NMDLVertexDescriptor::setPackedStrides) {
  JS_UNWRAP(MDLVertexDescriptor, self);
  declare_autoreleasepool {
    [self setPackedStrides];
  }
}

NAN_METHOD(NMDLVertexDescriptor::setPackedOffsets) {
  JS_UNWRAP(MDLVertexDescriptor, self);
  declare_autoreleasepool {
    [self setPackedOffsets];
  }
}

NAN_GETTER(NMDLVertexDescriptor::attributesGetter) {
  JS_UNWRAP(MDLVertexDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableArray<MDLVertexAttribute*>([self attributes]));
  }
}

NAN_SETTER(NMDLVertexDescriptor::attributesSetter) {
  JS_UNWRAP(MDLVertexDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSMutableArray<MDLVertexAttribute*>, input);
    [self setAttributes: input];
  }
}

NAN_GETTER(NMDLVertexDescriptor::layoutsGetter) {
  JS_UNWRAP(MDLVertexDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableArray<MDLVertexBufferLayout*>([self layouts]));
  }
}

NAN_SETTER(NMDLVertexDescriptor::layoutsSetter) {
  JS_UNWRAP(MDLVertexDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSMutableArray<MDLVertexBufferLayout*>, input);
    [self setLayouts: input];
  }
}

