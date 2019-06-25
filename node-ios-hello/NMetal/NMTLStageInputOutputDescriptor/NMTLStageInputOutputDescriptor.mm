//
//  NMTLStageInputOutputDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLStageInputOutputDescriptor.h"

#define instancetype MTLStageInputOutputDescriptor
#define js_value_instancetype js_value_MTLStageInputOutputDescriptor

NMTLStageInputOutputDescriptor::NMTLStageInputOutputDescriptor() {}
NMTLStageInputOutputDescriptor::~NMTLStageInputOutputDescriptor() {}

JS_INIT_CLASS(MTLStageInputOutputDescriptor, NSObject);
  JS_ASSIGN_STATIC_METHOD(stageInputOutputDescriptor);
  JS_ASSIGN_PROTO_METHOD(reset);
  JS_ASSIGN_PROTO_PROP_READONLY(layouts);
  JS_ASSIGN_PROTO_PROP_READONLY(attributes);
  JS_ASSIGN_PROTO_PROP(indexType);
  JS_ASSIGN_PROTO_PROP(indexBufferIndex);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLStageInputOutputDescriptor, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSUInteger, MTLAttributeFormat) {
    JS_ASSIGN_ENUM(MTLAttributeFormatInvalid, NSUInteger); // = 0,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatUChar2, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLAttributeFormatUChar3, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLAttributeFormatUChar4, NSUInteger); // = 3,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatChar2, NSUInteger); // = 4,
    JS_ASSIGN_ENUM(MTLAttributeFormatChar3, NSUInteger); // = 5,
    JS_ASSIGN_ENUM(MTLAttributeFormatChar4, NSUInteger); // = 6,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatUChar2Normalized, NSUInteger); // = 7,
    JS_ASSIGN_ENUM(MTLAttributeFormatUChar3Normalized, NSUInteger); // = 8,
    JS_ASSIGN_ENUM(MTLAttributeFormatUChar4Normalized, NSUInteger); // = 9,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatChar2Normalized, NSUInteger); // = 10,
    JS_ASSIGN_ENUM(MTLAttributeFormatChar3Normalized, NSUInteger); // = 11,
    JS_ASSIGN_ENUM(MTLAttributeFormatChar4Normalized, NSUInteger); // = 12,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatUShort2, NSUInteger); // = 13,
    JS_ASSIGN_ENUM(MTLAttributeFormatUShort3, NSUInteger); // = 14,
    JS_ASSIGN_ENUM(MTLAttributeFormatUShort4, NSUInteger); // = 15,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatShort2, NSUInteger); // = 16,
    JS_ASSIGN_ENUM(MTLAttributeFormatShort3, NSUInteger); // = 17,
    JS_ASSIGN_ENUM(MTLAttributeFormatShort4, NSUInteger); // = 18,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatUShort2Normalized, NSUInteger); // = 19,
    JS_ASSIGN_ENUM(MTLAttributeFormatUShort3Normalized, NSUInteger); // = 20,
    JS_ASSIGN_ENUM(MTLAttributeFormatUShort4Normalized, NSUInteger); // = 21,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatShort2Normalized, NSUInteger); // = 22,
    JS_ASSIGN_ENUM(MTLAttributeFormatShort3Normalized, NSUInteger); // = 23,
    JS_ASSIGN_ENUM(MTLAttributeFormatShort4Normalized, NSUInteger); // = 24,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatHalf2, NSUInteger); // = 25,
    JS_ASSIGN_ENUM(MTLAttributeFormatHalf3, NSUInteger); // = 26,
    JS_ASSIGN_ENUM(MTLAttributeFormatHalf4, NSUInteger); // = 27,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatFloat, NSUInteger); // = 28,
    JS_ASSIGN_ENUM(MTLAttributeFormatFloat2, NSUInteger); // = 29,
    JS_ASSIGN_ENUM(MTLAttributeFormatFloat3, NSUInteger); // = 30,
    JS_ASSIGN_ENUM(MTLAttributeFormatFloat4, NSUInteger); // = 31,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatInt, NSUInteger); // = 32,
    JS_ASSIGN_ENUM(MTLAttributeFormatInt2, NSUInteger); // = 33,
    JS_ASSIGN_ENUM(MTLAttributeFormatInt3, NSUInteger); // = 34,
    JS_ASSIGN_ENUM(MTLAttributeFormatInt4, NSUInteger); // = 35,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatUInt, NSUInteger); // = 36,
    JS_ASSIGN_ENUM(MTLAttributeFormatUInt2, NSUInteger); // = 37,
    JS_ASSIGN_ENUM(MTLAttributeFormatUInt3, NSUInteger); // = 38,
    JS_ASSIGN_ENUM(MTLAttributeFormatUInt4, NSUInteger); // = 39,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatInt1010102Normalized, NSUInteger); // = 40,
    JS_ASSIGN_ENUM(MTLAttributeFormatUInt1010102Normalized, NSUInteger); // = 41,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatUChar4Normalized_BGRA, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 42,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatUChar, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 45,
    JS_ASSIGN_ENUM(MTLAttributeFormatChar, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 46,
    JS_ASSIGN_ENUM(MTLAttributeFormatUCharNormalized, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 47,
    JS_ASSIGN_ENUM(MTLAttributeFormatCharNormalized, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 48,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatUShort, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 49,
    JS_ASSIGN_ENUM(MTLAttributeFormatShort, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 50,
    JS_ASSIGN_ENUM(MTLAttributeFormatUShortNormalized, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 51,
    JS_ASSIGN_ENUM(MTLAttributeFormatShortNormalized, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 52,
    
    JS_ASSIGN_ENUM(MTLAttributeFormatHalf, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 53,
    
  //} API_AVAILABLE(macos(10.12), ios(10.0));

  //typedef NS_ENUM(NSUInteger, MTLIndexType) {
    JS_ASSIGN_ENUM(MTLIndexTypeUInt16, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLIndexTypeUInt32, NSUInteger); // = 1,
  //} API_AVAILABLE(macos(10.11), ios(8.0));


  //typedef NS_ENUM(NSUInteger, MTLStepFunction) {
    JS_ASSIGN_ENUM(MTLStepFunctionConstant, NSUInteger); // = 0,

    
    JS_ASSIGN_ENUM(MTLStepFunctionPerVertex, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLStepFunctionPerInstance, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLStepFunctionPerPatch, NSUInteger); // API_AVAILABLE(macos(10.12), ios(10.0)) = 3,
    JS_ASSIGN_ENUM(MTLStepFunctionPerPatchControlPoint, NSUInteger); // API_AVAILABLE(macos(10.12), ios(10.0)) = 4,

    
    JS_ASSIGN_ENUM(MTLStepFunctionThreadPositionInGridX, NSUInteger); // = 5,
    JS_ASSIGN_ENUM(MTLStepFunctionThreadPositionInGridY, NSUInteger); // = 6,
    JS_ASSIGN_ENUM(MTLStepFunctionThreadPositionInGridXIndexed, NSUInteger); // = 7,
    JS_ASSIGN_ENUM(MTLStepFunctionThreadPositionInGridYIndexed, NSUInteger); // = 8,
  //} API_AVAILABLE(macos(10.12), ios(10.0));

JS_INIT_CLASS_END(MTLStageInputOutputDescriptor, NSObject);

NAN_METHOD(NMTLStageInputOutputDescriptor::New) {
  JS_RECONSTRUCT(MTLStageInputOutputDescriptor);
  @autoreleasepool {
    MTLStageInputOutputDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLStageInputOutputDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLStageInputOutputDescriptor alloc] init];
    }
    if (self) {
      NMTLStageInputOutputDescriptor *wrapper = new NMTLStageInputOutputDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLStageInputOutputDescriptor::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMTLStageInputOutputDescriptor::stageInputOutputDescriptor) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLStageInputOutputDescriptor([MTLStageInputOutputDescriptor stageInputOutputDescriptor]));
  }
}

NAN_METHOD(NMTLStageInputOutputDescriptor::reset) {
  JS_UNWRAP(MTLStageInputOutputDescriptor, self);
  declare_autoreleasepool {
    [self reset];
  }
}

#include "NMTLBufferLayoutDescriptorArray.h"

NAN_GETTER(NMTLStageInputOutputDescriptor::layoutsGetter) {
  JS_UNWRAP(MTLStageInputOutputDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLBufferLayoutDescriptorArray([self layouts]));
  }
}

#include "NMTLAttributeDescriptorArray.h"

NAN_GETTER(NMTLStageInputOutputDescriptor::attributesGetter) {
  JS_UNWRAP(MTLStageInputOutputDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLAttributeDescriptorArray([self attributes]));
  }
}

NAN_GETTER(NMTLStageInputOutputDescriptor::indexTypeGetter) {
  JS_UNWRAP(MTLStageInputOutputDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLIndexType([self indexType]));
  }
}

NAN_SETTER(NMTLStageInputOutputDescriptor::indexTypeSetter) {
  JS_UNWRAP(MTLStageInputOutputDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLIndexType, input);
    [self setIndexType: input];
  }
}

NAN_GETTER(NMTLStageInputOutputDescriptor::indexBufferIndexGetter) {
  JS_UNWRAP(MTLStageInputOutputDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self indexBufferIndex]));
  }
}

NAN_SETTER(NMTLStageInputOutputDescriptor::indexBufferIndexSetter) {
  JS_UNWRAP(MTLStageInputOutputDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setIndexBufferIndex: input];
  }
}
