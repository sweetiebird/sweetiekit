//
//  NMTLLibrary.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLLibrary.h"

#define instancetype MTLLibrary
#define js_value_instancetype js_value_MTLLibrary

NMTLLibrary::NMTLLibrary() {}
NMTLLibrary::~NMTLLibrary() {}

JS_INIT_PROTOCOL(MTLLibrary, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLLibrary, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSUInteger, MTLPatchType) {
    JS_ASSIGN_ENUM(MTLPatchTypeNone, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLPatchTypeTriangle, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLPatchTypeQuad, NSUInteger); // = 2,
  //} API_AVAILABLE(macos(10.12), ios(10.0));

  /*!
   @enum MTLFunctionType
   @abstract An identifier for a top-level Metal function.
   @discussion Each location in the API where a program is used requires a function written for that specific usage.
   
   @constant MTLFunctionTypeVertex
   A vertex shader, usable for a MTLRenderPipelineState.
   
   @constant MTLFunctionTypeFragment
   A fragment shader, usable for a MTLRenderPipelineState.
   
   @constant MTLFunctionTypeKernel
   A compute kernel, usable to create a MTLComputePipelineState.
   */
  //typedef NS_ENUM(NSUInteger, MTLFunctionType) {
    JS_ASSIGN_ENUM(MTLFunctionTypeVertex, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLFunctionTypeFragment, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLFunctionTypeKernel, NSUInteger); // = 3,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_ENUM(NSUInteger, MTLLanguageVersion) {
#if TARGET_OS_IPHONE
    JS_ASSIGN_ENUM(MTLLanguageVersion1_0, NSUInteger); // API_AVAILABLE(ios(9.0)) API_UNAVAILABLE(macos) = (1 << 16),
#endif
    JS_ASSIGN_ENUM(MTLLanguageVersion1_1, NSUInteger); // API_AVAILABLE(macos(10.11), ios(9.0)) = (1 << 16) + 1,
    JS_ASSIGN_ENUM(MTLLanguageVersion1_2, NSUInteger); // API_AVAILABLE(macos(10.12), ios(10.0)) = (1 << 16) + 2,
    JS_ASSIGN_ENUM(MTLLanguageVersion2_0, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = (2 << 16),
    JS_ASSIGN_ENUM(MTLLanguageVersion2_1, NSUInteger); // API_AVAILABLE(macos(10.14), ios(12.0)) = (2 << 16) + 1,
  //} API_AVAILABLE(macos(10.11), ios(9.0));

  /*!
   @constant MTLLibraryErrorDomain
   @abstract NSErrors raised when creating a library.
   */
  //API_AVAILABLE(macos(10.11), ios(8.0))
  JS_ASSIGN_ENUM(MTLLibraryErrorDomain, NSString);

  /*!
   @enum MTLLibraryError
   @abstract NSErrors raised when creating a library.
   */
  //typedef NS_ENUM(NSUInteger, MTLLibraryError) {
    JS_ASSIGN_ENUM(MTLLibraryErrorUnsupported, NSUInteger); //      = 1,
    JS_ASSIGN_ENUM(MTLLibraryErrorInternal, NSUInteger); //         = 2,
    JS_ASSIGN_ENUM(MTLLibraryErrorCompileFailure, NSUInteger); //   = 3,
    JS_ASSIGN_ENUM(MTLLibraryErrorCompileWarning, NSUInteger); //   = 4,
    JS_ASSIGN_ENUM(MTLLibraryErrorFunctionNotFound, NSUInteger); // API_AVAILABLE(macos(10.12), ios(10.0)) = 5,
    JS_ASSIGN_ENUM(MTLLibraryErrorFileNotFound, NSUInteger); // API_AVAILABLE(macos(10.12), ios(10.0)) = 6,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

JS_INIT_PROTOCOL_END(MTLLibrary, NSObject);

NAN_METHOD(NMTLLibrary::New) {
  JS_RECONSTRUCT(MTLLibrary);
  @autoreleasepool {
    id<MTLLibrary> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLLibrary>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLLibrary> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLLibrary, value);
      self = value;
    }
    if (self) {
      NMTLLibrary *wrapper = new NMTLLibrary();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLLibrary::New: invalid arguments");
    }
  }
}
