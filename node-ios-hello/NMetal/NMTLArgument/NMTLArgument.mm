//
//  NMTLArgument.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLArgument.h"

#define instancetype MTLArgument
#define js_value_instancetype js_value_MTLArgument

NMTLArgument::NMTLArgument() {}
NMTLArgument::~NMTLArgument() {}

JS_INIT_CLASS(MTLArgument, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLArgument, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSUInteger, MTLDataType) {
    
    JS_ASSIGN_ENUM(MTLDataTypeNone, NSInteger); // = 0,
    
    JS_ASSIGN_ENUM(MTLDataTypeStruct, NSInteger); // = 1,
    JS_ASSIGN_ENUM(MTLDataTypeArray, NSInteger); //  = 2,
    
    JS_ASSIGN_ENUM(MTLDataTypeFloat, NSInteger); //  = 3,
    JS_ASSIGN_ENUM(MTLDataTypeFloat2, NSInteger); // = 4,
    JS_ASSIGN_ENUM(MTLDataTypeFloat3, NSInteger); // = 5,
    JS_ASSIGN_ENUM(MTLDataTypeFloat4, NSInteger); // = 6,
    
    JS_ASSIGN_ENUM(MTLDataTypeFloat2x2, NSInteger); // = 7,
    JS_ASSIGN_ENUM(MTLDataTypeFloat2x3, NSInteger); // = 8,
    JS_ASSIGN_ENUM(MTLDataTypeFloat2x4, NSInteger); // = 9,
    
    JS_ASSIGN_ENUM(MTLDataTypeFloat3x2, NSInteger); // = 10,
    JS_ASSIGN_ENUM(MTLDataTypeFloat3x3, NSInteger); // = 11,
    JS_ASSIGN_ENUM(MTLDataTypeFloat3x4, NSInteger); // = 12,
    
    JS_ASSIGN_ENUM(MTLDataTypeFloat4x2, NSInteger); // = 13,
    JS_ASSIGN_ENUM(MTLDataTypeFloat4x3, NSInteger); // = 14,
    JS_ASSIGN_ENUM(MTLDataTypeFloat4x4, NSInteger); // = 15,
    
    JS_ASSIGN_ENUM(MTLDataTypeHalf, NSInteger); //  = 16,
    JS_ASSIGN_ENUM(MTLDataTypeHalf2, NSInteger); // = 17,
    JS_ASSIGN_ENUM(MTLDataTypeHalf3, NSInteger); // = 18,
    JS_ASSIGN_ENUM(MTLDataTypeHalf4, NSInteger); // = 19,
    
    JS_ASSIGN_ENUM(MTLDataTypeHalf2x2, NSInteger); // = 20,
    JS_ASSIGN_ENUM(MTLDataTypeHalf2x3, NSInteger); // = 21,
    JS_ASSIGN_ENUM(MTLDataTypeHalf2x4, NSInteger); // = 22,
    
    JS_ASSIGN_ENUM(MTLDataTypeHalf3x2, NSInteger); // = 23,
    JS_ASSIGN_ENUM(MTLDataTypeHalf3x3, NSInteger); // = 24,
    JS_ASSIGN_ENUM(MTLDataTypeHalf3x4, NSInteger); // = 25,
    
    JS_ASSIGN_ENUM(MTLDataTypeHalf4x2, NSInteger); // = 26,
    JS_ASSIGN_ENUM(MTLDataTypeHalf4x3, NSInteger); // = 27,
    JS_ASSIGN_ENUM(MTLDataTypeHalf4x4, NSInteger); // = 28,
    
    JS_ASSIGN_ENUM(MTLDataTypeInt, NSInteger); //  = 29,
    JS_ASSIGN_ENUM(MTLDataTypeInt2, NSInteger); // = 30,
    JS_ASSIGN_ENUM(MTLDataTypeInt3, NSInteger); // = 31,
    JS_ASSIGN_ENUM(MTLDataTypeInt4, NSInteger); // = 32,
    
    JS_ASSIGN_ENUM(MTLDataTypeUInt, NSInteger); //  = 33,
    JS_ASSIGN_ENUM(MTLDataTypeUInt2, NSInteger); // = 34,
    JS_ASSIGN_ENUM(MTLDataTypeUInt3, NSInteger); // = 35,
    JS_ASSIGN_ENUM(MTLDataTypeUInt4, NSInteger); // = 36,
    
    JS_ASSIGN_ENUM(MTLDataTypeShort, NSInteger); //  = 37,
    JS_ASSIGN_ENUM(MTLDataTypeShort2, NSInteger); // = 38,
    JS_ASSIGN_ENUM(MTLDataTypeShort3, NSInteger); // = 39,
    JS_ASSIGN_ENUM(MTLDataTypeShort4, NSInteger); // = 40,
    
    JS_ASSIGN_ENUM(MTLDataTypeUShort, NSInteger); // = 41,
    JS_ASSIGN_ENUM(MTLDataTypeUShort2, NSInteger); // = 42,
    JS_ASSIGN_ENUM(MTLDataTypeUShort3, NSInteger); // = 43,
    JS_ASSIGN_ENUM(MTLDataTypeUShort4, NSInteger); // = 44,
    
    JS_ASSIGN_ENUM(MTLDataTypeChar, NSInteger); //  = 45,
    JS_ASSIGN_ENUM(MTLDataTypeChar2, NSInteger); // = 46,
    JS_ASSIGN_ENUM(MTLDataTypeChar3, NSInteger); // = 47,
    JS_ASSIGN_ENUM(MTLDataTypeChar4, NSInteger); // = 48,
    
    JS_ASSIGN_ENUM(MTLDataTypeUChar, NSInteger); //  = 49,
    JS_ASSIGN_ENUM(MTLDataTypeUChar2, NSInteger); // = 50,
    JS_ASSIGN_ENUM(MTLDataTypeUChar3, NSInteger); // = 51,
    JS_ASSIGN_ENUM(MTLDataTypeUChar4, NSInteger); // = 52,
    
    JS_ASSIGN_ENUM(MTLDataTypeBool, NSInteger); //  = 53,
    JS_ASSIGN_ENUM(MTLDataTypeBool2, NSInteger); // = 54,
    JS_ASSIGN_ENUM(MTLDataTypeBool3, NSInteger); // = 55,
    JS_ASSIGN_ENUM(MTLDataTypeBool4, NSInteger); // = 56,

    
    JS_ASSIGN_ENUM(MTLDataTypeTexture, NSInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 58,
    JS_ASSIGN_ENUM(MTLDataTypeSampler, NSInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 59,
    JS_ASSIGN_ENUM(MTLDataTypePointer, NSInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 60,

    JS_ASSIGN_ENUM(MTLDataTypeR8Unorm, NSInteger); //         API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos) = 62,
    JS_ASSIGN_ENUM(MTLDataTypeR8Snorm, NSInteger); //         API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos) = 63,
    JS_ASSIGN_ENUM(MTLDataTypeR16Unorm, NSInteger); //        API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos) = 64,
    JS_ASSIGN_ENUM(MTLDataTypeR16Snorm, NSInteger); //        API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos) = 65,
    JS_ASSIGN_ENUM(MTLDataTypeRG8Unorm, NSInteger); //        API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos) = 66,
    JS_ASSIGN_ENUM(MTLDataTypeRG8Snorm, NSInteger); //        API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos) = 67,
    JS_ASSIGN_ENUM(MTLDataTypeRG16Unorm, NSInteger); //       API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos) = 68,
    JS_ASSIGN_ENUM(MTLDataTypeRG16Snorm, NSInteger); //       API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos) = 69,
    JS_ASSIGN_ENUM(MTLDataTypeRGBA8Unorm, NSInteger); //      API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos) = 70,
    JS_ASSIGN_ENUM(MTLDataTypeRGBA8Unorm_sRGB, NSInteger); // API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos) = 71,
    JS_ASSIGN_ENUM(MTLDataTypeRGBA8Snorm, NSInteger); //      API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos) = 72,
    JS_ASSIGN_ENUM(MTLDataTypeRGBA16Unorm, NSInteger); //     API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos) = 73,
    JS_ASSIGN_ENUM(MTLDataTypeRGBA16Snorm, NSInteger); //     API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos) = 74,
    JS_ASSIGN_ENUM(MTLDataTypeRGB10A2Unorm, NSInteger); //    API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos) = 75,
    JS_ASSIGN_ENUM(MTLDataTypeRG11B10Float, NSInteger); //    API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos) = 76,
    JS_ASSIGN_ENUM(MTLDataTypeRGB9E5Float, NSInteger); //     API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos) = 77,
#if !TARGET_OS_IPHONE
    JS_ASSIGN_ENUM(MTLDataTypeRenderPipeline, NSInteger); //  API_AVAILABLE(macos(10.14)) API_UNAVAILABLE(ios) = 78,
#endif
    JS_ASSIGN_ENUM(MTLDataTypeIndirectCommandBuffer, NSInteger); //   API_AVAILABLE(macos(10.14), ios(12.0)) = 80,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_ENUM(NSUInteger, MTLArgumentType) {
    
    JS_ASSIGN_ENUM(MTLArgumentTypeBuffer, NSInteger); // = 0,
    JS_ASSIGN_ENUM(MTLArgumentTypeThreadgroupMemory, NSInteger); //= 1,
    JS_ASSIGN_ENUM(MTLArgumentTypeTexture, NSInteger); // = 2,
    JS_ASSIGN_ENUM(MTLArgumentTypeSampler, NSInteger); // = 3,

    JS_ASSIGN_ENUM(MTLArgumentTypeImageblockData, NSInteger); // API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos)     = 16,
    JS_ASSIGN_ENUM(MTLArgumentTypeImageblock, NSInteger); // API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos)         = 17,

  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_ENUM(NSUInteger, MTLArgumentAccess) {
    
    JS_ASSIGN_ENUM(MTLArgumentAccessReadOnly, NSInteger); //   = 0,
    JS_ASSIGN_ENUM(MTLArgumentAccessReadWrite, NSInteger); //  = 1,
    JS_ASSIGN_ENUM(MTLArgumentAccessWriteOnly, NSInteger); //  = 2,
    
  //} API_AVAILABLE(macos(10.11), ios(8.0));


JS_INIT_CLASS_END(MTLArgument, NSObject);

NAN_METHOD(NMTLArgument::New) {
  JS_RECONSTRUCT(MTLArgument);
  @autoreleasepool {
    MTLArgument* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLArgument *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLArgument alloc] init];
    }
    if (self) {
      NMTLArgument *wrapper = new NMTLArgument();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLArgument::New: invalid arguments");
    }
  }
}
