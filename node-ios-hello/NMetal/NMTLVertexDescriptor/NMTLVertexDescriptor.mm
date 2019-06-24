//
//  NMTLVertexDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLVertexDescriptor.h"

#define instancetype MTLVertexDescriptor
#define js_value_instancetype js_value_MTLVertexDescriptor

NMTLVertexDescriptor::NMTLVertexDescriptor() {}
NMTLVertexDescriptor::~NMTLVertexDescriptor() {}

JS_INIT_CLASS(MTLVertexDescriptor, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(layouts);
  JS_ASSIGN_PROTO_PROP_READONLY(attributes);

  JS_ASSIGN_STATIC_METHOD(vertexDescriptor);
  JS_ASSIGN_PROTO_METHOD(reset);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLVertexDescriptor, NSObject);
  // constant values (exports)

  /*!
   @enum MTLVertexFormat
   @abstract specifies how the vertex attribute data is laid out in memory.
  */

  //typedef NS_ENUM(NSUInteger, MTLVertexFormat) {
    JS_ASSIGN_ENUM(MTLVertexFormatInvalid, NSUInteger); // = 0,
    
    JS_ASSIGN_ENUM(MTLVertexFormatUChar2, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLVertexFormatUChar3, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLVertexFormatUChar4, NSUInteger); // = 3,
    
    JS_ASSIGN_ENUM(MTLVertexFormatChar2, NSUInteger); // = 4,
    JS_ASSIGN_ENUM(MTLVertexFormatChar3, NSUInteger); // = 5,
    JS_ASSIGN_ENUM(MTLVertexFormatChar4, NSUInteger); // = 6,
    
    JS_ASSIGN_ENUM(MTLVertexFormatUChar2Normalized, NSUInteger); // = 7,
    JS_ASSIGN_ENUM(MTLVertexFormatUChar3Normalized, NSUInteger); // = 8,
    JS_ASSIGN_ENUM(MTLVertexFormatUChar4Normalized, NSUInteger); // = 9,
    
    JS_ASSIGN_ENUM(MTLVertexFormatChar2Normalized, NSUInteger); // = 10,
    JS_ASSIGN_ENUM(MTLVertexFormatChar3Normalized, NSUInteger); // = 11,
    JS_ASSIGN_ENUM(MTLVertexFormatChar4Normalized, NSUInteger); // = 12,
    
    JS_ASSIGN_ENUM(MTLVertexFormatUShort2, NSUInteger); // = 13,
    JS_ASSIGN_ENUM(MTLVertexFormatUShort3, NSUInteger); // = 14,
    JS_ASSIGN_ENUM(MTLVertexFormatUShort4, NSUInteger); // = 15,
    
    JS_ASSIGN_ENUM(MTLVertexFormatShort2, NSUInteger); // = 16,
    JS_ASSIGN_ENUM(MTLVertexFormatShort3, NSUInteger); // = 17,
    JS_ASSIGN_ENUM(MTLVertexFormatShort4, NSUInteger); // = 18,
    
    JS_ASSIGN_ENUM(MTLVertexFormatUShort2Normalized, NSUInteger); // = 19,
    JS_ASSIGN_ENUM(MTLVertexFormatUShort3Normalized, NSUInteger); // = 20,
    JS_ASSIGN_ENUM(MTLVertexFormatUShort4Normalized, NSUInteger); // = 21,
    
    JS_ASSIGN_ENUM(MTLVertexFormatShort2Normalized, NSUInteger); // = 22,
    JS_ASSIGN_ENUM(MTLVertexFormatShort3Normalized, NSUInteger); // = 23,
    JS_ASSIGN_ENUM(MTLVertexFormatShort4Normalized, NSUInteger); // = 24,
    
    JS_ASSIGN_ENUM(MTLVertexFormatHalf2, NSUInteger); // = 25,
    JS_ASSIGN_ENUM(MTLVertexFormatHalf3, NSUInteger); // = 26,
    JS_ASSIGN_ENUM(MTLVertexFormatHalf4, NSUInteger); // = 27,
    
    JS_ASSIGN_ENUM(MTLVertexFormatFloat, NSUInteger); // = 28,
    JS_ASSIGN_ENUM(MTLVertexFormatFloat2, NSUInteger); // = 29,
    JS_ASSIGN_ENUM(MTLVertexFormatFloat3, NSUInteger); // = 30,
    JS_ASSIGN_ENUM(MTLVertexFormatFloat4, NSUInteger); // = 31,
    
    JS_ASSIGN_ENUM(MTLVertexFormatInt, NSUInteger); // = 32,
    JS_ASSIGN_ENUM(MTLVertexFormatInt2, NSUInteger); // = 33,
    JS_ASSIGN_ENUM(MTLVertexFormatInt3, NSUInteger); // = 34,
    JS_ASSIGN_ENUM(MTLVertexFormatInt4, NSUInteger); // = 35,
    
    JS_ASSIGN_ENUM(MTLVertexFormatUInt, NSUInteger); // = 36,
    JS_ASSIGN_ENUM(MTLVertexFormatUInt2, NSUInteger); // = 37,
    JS_ASSIGN_ENUM(MTLVertexFormatUInt3, NSUInteger); // = 38,
    JS_ASSIGN_ENUM(MTLVertexFormatUInt4, NSUInteger); // = 39,
    
    JS_ASSIGN_ENUM(MTLVertexFormatInt1010102Normalized, NSUInteger); // = 40,
    JS_ASSIGN_ENUM(MTLVertexFormatUInt1010102Normalized, NSUInteger); // = 41,
    
    JS_ASSIGN_ENUM(MTLVertexFormatUChar4Normalized_BGRA, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 42,
    
    JS_ASSIGN_ENUM(MTLVertexFormatUChar, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 45,
    JS_ASSIGN_ENUM(MTLVertexFormatChar, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 46,
    JS_ASSIGN_ENUM(MTLVertexFormatUCharNormalized, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 47,
    JS_ASSIGN_ENUM(MTLVertexFormatCharNormalized, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 48,
    
    JS_ASSIGN_ENUM(MTLVertexFormatUShort, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 49,
    JS_ASSIGN_ENUM(MTLVertexFormatShort, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 50,
    JS_ASSIGN_ENUM(MTLVertexFormatUShortNormalized, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 51,
    JS_ASSIGN_ENUM(MTLVertexFormatShortNormalized, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 52,
    
    JS_ASSIGN_ENUM(MTLVertexFormatHalf, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 53,
    
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_ENUM(NSUInteger, MTLVertexStepFunction) {
    JS_ASSIGN_ENUM(MTLVertexStepFunctionConstant, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLVertexStepFunctionPerVertex, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLVertexStepFunctionPerInstance, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLVertexStepFunctionPerPatch, NSUInteger); // API_AVAILABLE(macos(10.12), ios(10.0)) = 3,
    JS_ASSIGN_ENUM(MTLVertexStepFunctionPerPatchControlPoint, NSUInteger); // API_AVAILABLE(macos(10.12), ios(10.0)) = 4,
  //} API_AVAILABLE(macos(10.11), ios(8.0));



JS_INIT_CLASS_END(MTLVertexDescriptor, NSObject);

NAN_METHOD(NMTLVertexDescriptor::New) {
  JS_RECONSTRUCT(MTLVertexDescriptor);
  @autoreleasepool {
    MTLVertexDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLVertexDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLVertexDescriptor alloc] init];
    }
    if (self) {
      NMTLVertexDescriptor *wrapper = new NMTLVertexDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLVertexDescriptor::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMTLVertexDescriptor::vertexDescriptor) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLVertexDescriptor([MTLVertexDescriptor vertexDescriptor]));
  }
}

NAN_METHOD(NMTLVertexDescriptor::reset) {
  JS_UNWRAP(MTLVertexDescriptor, self);
  declare_autoreleasepool {
    [self reset];
  }
}

#include "NMTLVertexBufferLayoutDescriptorArray.h"

NAN_GETTER(NMTLVertexDescriptor::layoutsGetter) {
  JS_UNWRAP(MTLVertexDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLVertexBufferLayoutDescriptorArray([self layouts]));
  }
}

#include "NMTLVertexAttributeDescriptorArray.h"

NAN_GETTER(NMTLVertexDescriptor::attributesGetter) {
  JS_UNWRAP(MTLVertexDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLVertexAttributeDescriptorArray([self attributes]));
  }
}
