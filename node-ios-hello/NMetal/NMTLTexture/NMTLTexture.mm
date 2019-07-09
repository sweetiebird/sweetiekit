//
//  NMTLTexture.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLTexture.h"

#define instancetype MTLTexture
#define js_value_instancetype js_value_MTLTexture

#import <Metal/MTLTexture.h>

NMTLTexture::NMTLTexture() {}
NMTLTexture::~NMTLTexture() {}

JS_INIT_PROTOCOL(MTLTexture, MTLResource);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLTexture, MTLResource);
  // constant values (exports)

  //typedef NS_ENUM(NSUInteger, MTLTextureType) {
    JS_ASSIGN_ENUM(MTLTextureType1D, NSInteger); // = 0,
    JS_ASSIGN_ENUM(MTLTextureType1DArray, NSInteger); // = 1,
    JS_ASSIGN_ENUM(MTLTextureType2D, NSInteger); // = 2,
    JS_ASSIGN_ENUM(MTLTextureType2DArray, NSInteger); // = 3,
    JS_ASSIGN_ENUM(MTLTextureType2DMultisample, NSInteger); // = 4,
    JS_ASSIGN_ENUM(MTLTextureTypeCube, NSInteger); // = 5,
    JS_ASSIGN_ENUM(MTLTextureTypeCubeArray, NSInteger); // API_AVAILABLE(macos(10.11), ios(11.0)) = 6,
    JS_ASSIGN_ENUM(MTLTextureType3D, NSInteger); // = 7,
#if TARGET_OS_MAC && !TARGET_OS_UIKITFORMAC
    JS_ASSIGN_ENUM(MTLTextureType2DMultisampleArray, NSInteger); // API_AVAILABLE(macos(10.14)) API_UNAVAILABLE(ios) = 8,
#endif
    JS_ASSIGN_ENUM(MTLTextureTypeTextureBuffer, NSInteger); // API_AVAILABLE(macos(10.14), ios(12.0)) = 9
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_OPTIONS(NSUInteger, MTLTextureUsage) {
    JS_ASSIGN_ENUM(MTLTextureUsageUnknown, NSInteger); //         = 0x0000,
    JS_ASSIGN_ENUM(MTLTextureUsageShaderRead, NSInteger); //      = 0x0001,
    JS_ASSIGN_ENUM(MTLTextureUsageShaderWrite, NSInteger); //     = 0x0002,
    JS_ASSIGN_ENUM(MTLTextureUsageRenderTarget, NSInteger); //    = 0x0004,
    JS_ASSIGN_ENUM(MTLTextureUsagePixelFormatView, NSInteger); // = 0x0010,
  //} API_AVAILABLE(macos(10.11), ios(9.0));

JS_INIT_PROTOCOL_END(MTLTexture, MTLResource);

NAN_METHOD(NMTLTexture::New) {
  JS_RECONSTRUCT_PROTOCOL(MTLTexture);
  @autoreleasepool {
    id<MTLTexture> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLTexture>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLTexture> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLTexture, value);
      self = value;
    }
    if (self) {
      NMTLTexture *wrapper = new NMTLTexture();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLTexture::New: invalid arguments");
    }
  }
}
