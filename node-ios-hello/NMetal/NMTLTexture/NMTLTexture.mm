//
//  NMTLTexture.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLTexture.h"

#define instancetype MTLTexture
#define js_value_instancetype js_value_MTLTexture

NMTLTexture::NMTLTexture() {}
NMTLTexture::~NMTLTexture() {}

#include "NMacTypes.h"

/*
    MTLTextureSwizzle red;
    MTLTextureSwizzle green;
    MTLTextureSwizzle blue;
    MTLTextureSwizzle alpha;
 */
Local<Value> js_value_MTLTextureSwizzleChannels(const MTLTextureSwizzleChannels& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  js_struct_value(MTLTextureSwizzle, red);
  js_struct_value(MTLTextureSwizzle, green);
  js_struct_value(MTLTextureSwizzle, blue);
  js_struct_value(MTLTextureSwizzle, alpha);
  return scope.Escape(result);
}

MTLTextureSwizzleChannels to_value_MTLTextureSwizzleChannels(const Local<Value>& value, bool * _Nullable failed) {
  MTLTextureSwizzleChannels result;
  memset(&result, 0, sizeof(MTLTextureSwizzleChannels));
  check_struct_type(MTLTextureSwizzleChannels);
  to_struct_value(MTLTextureSwizzle, red);
  to_struct_value(MTLTextureSwizzle, green);
  to_struct_value(MTLTextureSwizzle, blue);
  to_struct_value(MTLTextureSwizzle, alpha);
  return result;
}

bool is_value_MTLTextureSwizzleChannels(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  check_struct_value(MTLTextureSwizzle, red);
  check_struct_value(MTLTextureSwizzle, green);
  check_struct_value(MTLTextureSwizzle, blue);
  check_struct_value(MTLTextureSwizzle, alpha);
  return true;
}

JS_INIT_PROTOCOL(MTLTexture, MTLResource);
  JS_ASSIGN_PROTO_METHOD(getBytesBytesPerRowBytesPerImageFromRegionMipmapLevelSlice);
  JS_ASSIGN_PROTO_METHOD(replaceRegionMipmapLevelSliceWithBytesBytesPerRowBytesPerImage);
  JS_ASSIGN_PROTO_METHOD(getBytesBytesPerRowFromRegionMipmapLevel);
  JS_ASSIGN_PROTO_METHOD(replaceRegionMipmapLevelWithBytesBytesPerRow);
  JS_ASSIGN_PROTO_METHOD(newTextureViewWithPixelFormat);
  JS_ASSIGN_PROTO_METHOD(newTextureViewWithPixelFormatTextureTypeLevelsSlices);
#if TODO
  JS_ASSIGN_PROTO_METHOD(newSharedTextureHandle);
#endif
  if (@available(iOS 13.0, *)) {
    JS_ASSIGN_PROTO_METHOD(newTextureViewWithPixelFormatTextureTypeLevelsSlicesSwizzle);
  }
  JS_ASSIGN_PROTO_PROP_READONLY(rootResource);
  JS_ASSIGN_PROTO_PROP_READONLY(parentTexture);
  JS_ASSIGN_PROTO_PROP_READONLY(parentRelativeLevel);
  JS_ASSIGN_PROTO_PROP_READONLY(parentRelativeSlice);
  JS_ASSIGN_PROTO_PROP_READONLY(buffer);
  JS_ASSIGN_PROTO_PROP_READONLY(bufferOffset);
  JS_ASSIGN_PROTO_PROP_READONLY(bufferBytesPerRow);
  JS_ASSIGN_PROTO_PROP_READONLY(iosurface);
  JS_ASSIGN_PROTO_PROP_READONLY(iosurfacePlane);
  JS_ASSIGN_PROTO_PROP_READONLY(textureType);
  JS_ASSIGN_PROTO_PROP_READONLY(pixelFormat);
  JS_ASSIGN_PROTO_PROP_READONLY(width);
  JS_ASSIGN_PROTO_PROP_READONLY(height);
  JS_ASSIGN_PROTO_PROP_READONLY(depth);
  JS_ASSIGN_PROTO_PROP_READONLY(mipmapLevelCount);
  JS_ASSIGN_PROTO_PROP_READONLY(sampleCount);
  JS_ASSIGN_PROTO_PROP_READONLY(arrayLength);
  JS_ASSIGN_PROTO_PROP_READONLY(usage);
  if (@available(iOS 13.0, *)) {
    JS_ASSIGN_PROTO_PROP_READONLY(isShareable);
  }
  JS_ASSIGN_PROTO_PROP_READONLY(isFramebufferOnly);
  JS_ASSIGN_PROTO_PROP_READONLY(allowGPUOptimizedContents);
  if (@available(iOS 13.0, *)) {
    JS_ASSIGN_PROTO_PROP_READONLY(swizzle);
  }

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLTexture, MTLResource);
  // constant values (exports)
  /*!
   @enum MTLTextureType
   @abstract MTLTextureType describes the dimensionality of each image, and if multiple images are arranged into an array or cube.
   */
  //typedef NS_ENUM(NSUInteger, MTLTextureType) {
    JS_ASSIGN_ENUM(MTLTextureType1D, NSUInteger); //  = 0,
    JS_ASSIGN_ENUM(MTLTextureType1DArray, NSUInteger); //  = 1,
    JS_ASSIGN_ENUM(MTLTextureType2D, NSUInteger); //  = 2,
    JS_ASSIGN_ENUM(MTLTextureType2DArray, NSUInteger); //  = 3,
    JS_ASSIGN_ENUM(MTLTextureType2DMultisample, NSUInteger); //  = 4,
    JS_ASSIGN_ENUM(MTLTextureTypeCube, NSUInteger); //  = 5,
    JS_ASSIGN_ENUM(MTLTextureTypeCubeArray, NSUInteger); //  API_AVAILABLE(macos(10.11), ios(11.0)) = 6,
    JS_ASSIGN_ENUM(MTLTextureType3D, NSUInteger); //  = 7,
#if !TARGET_OS_IOS
    JS_ASSIGN_ENUM(MTLTextureType2DMultisampleArray, NSUInteger); //  API_AVAILABLE(macos(10.14)) API_UNAVAILABLE(ios) = 8,
#endif
    JS_ASSIGN_ENUM(MTLTextureTypeTextureBuffer, NSUInteger); //  API_AVAILABLE(macos(10.14), ios(12.0)) = 9
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  if (@available(iOS 13.0, *)) {
    //typedef NS_ENUM(uint8_t, MTLTextureSwizzle) {
      JS_ASSIGN_ENUM(MTLTextureSwizzleZero, uint8_t); //  = 0,
      JS_ASSIGN_ENUM(MTLTextureSwizzleOne, uint8_t); //  = 1,
      JS_ASSIGN_ENUM(MTLTextureSwizzleRed, uint8_t); //  = 2,
      JS_ASSIGN_ENUM(MTLTextureSwizzleGreen, uint8_t); //  = 3,
      JS_ASSIGN_ENUM(MTLTextureSwizzleBlue, uint8_t); //  = 4,
      JS_ASSIGN_ENUM(MTLTextureSwizzleAlpha, uint8_t); //  = 5,
    //} API_AVAILABLE(macos(10.15), ios(13.0));
  }

  /*
   @enum MTLTextureUsage
   @abstract MTLTextureUsage declares how the texture will be used over its lifetime (bitwise OR for multiple uses).
   @discussion This information may be used by the driver to make optimization decisions.
  */
  //typedef NS_OPTIONS(NSUInteger, MTLTextureUsage) {
    JS_ASSIGN_ENUM(MTLTextureUsageUnknown, NSUInteger); //          = 0x0000,
    JS_ASSIGN_ENUM(MTLTextureUsageShaderRead, NSUInteger); //       = 0x0001,
    JS_ASSIGN_ENUM(MTLTextureUsageShaderWrite, NSUInteger); //      = 0x0002,
    JS_ASSIGN_ENUM(MTLTextureUsageRenderTarget, NSUInteger); //     = 0x0004,
    JS_ASSIGN_ENUM(MTLTextureUsagePixelFormatView, NSUInteger); //  = 0x0010,
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

#include "NMTLTypes.h"

inline void* getArrayData(Local<Value> arg, size_t* num = NULL) {
  void *data=NULL;
  if (num) {
    *num = 0;
  }

  if (!arg->IsNullOrUndefined()) {
    if (arg->IsArrayBufferView()) {
      Local<ArrayBufferView> arr = Local<ArrayBufferView>::Cast(arg);
      if (num) {
        *num = arr->ByteLength();
      }
      data = reinterpret_cast<void*>((char *)arr->Buffer()->GetContents().Data() + arr->ByteOffset());
    } else if(arg->IsArrayBuffer()) {
      Local<ArrayBuffer> arr = Local<ArrayBuffer>::Cast(arg);
      if (num) {
        *num = arr->ByteLength();
      }
      data = reinterpret_cast<void*>((char *)arr->GetContents().Data());
    } else {
      Nan::ThrowError("Bad array argument");
    }
  }

  return data;
}

typedef void* void_ptr;
Local<Value> js_value_void_ptr(void_ptr _Nullable value, Uint32 count);
void_ptr _Nullable to_value_void_ptr(const Local<Value>& value, bool* _Nullable failed = nullptr);
bool is_value_void_ptr(const Local<Value>& value);

typedef const void* const_void_ptr;
Local<Value> js_value_const_void_ptr(const_void_ptr _Nullable value, Uint32 count);
const_void_ptr _Nullable to_value_const_void_ptr(const Local<Value>& value, bool* _Nullable failed = nullptr);
bool is_value_const_void_ptr(const Local<Value>& value);

void_ptr _Nullable to_value_void_ptr(const Local<Value>& value, bool* _Nullable failed)
{
  void_ptr result = nullptr;
  if (failed) {
    *failed = false;
  }
  if (!is_value_void_ptr(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected void_ptr");
    }
    return result;
  }
  
  result = getArrayData(value);
  
  return result;
}

bool is_value_void_ptr(const Local<Value>& value)
{
  if (value->IsArrayBufferView()) {
    return true;
  }
  if (value->IsArrayBuffer()) {
    return true;
  }
  return false;
}

const_void_ptr _Nullable to_value_const_void_ptr(const Local<Value>& value, bool* _Nullable failed)
{
  const_void_ptr result = nullptr;
  if (failed) {
    *failed = false;
  }
  if (!is_value_const_void_ptr(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected const_void_ptr");
    }
    return result;
  }
  
  result = getArrayData(value);
  
  return result;
}

bool is_value_const_void_ptr(const Local<Value>& value)
{
  if (value->IsArrayBufferView()) {
    return true;
  }
  if (value->IsArrayBuffer()) {
    return true;
  }
  return false;
}

NAN_METHOD(NMTLTexture::getBytesBytesPerRowBytesPerImageFromRegionMipmapLevelSlice) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(void_ptr, pixelBytes);
    declare_value(NSUInteger, bytesPerRow);
    declare_value(NSUInteger, bytesPerImage);
    declare_value(MTLRegion, region);
    declare_value(NSUInteger, level);
    declare_value(NSUInteger, slice);
    [self getBytes: pixelBytes bytesPerRow: bytesPerRow bytesPerImage: bytesPerImage fromRegion: region mipmapLevel: level slice: slice];
  }
}

NAN_METHOD(NMTLTexture::replaceRegionMipmapLevelSliceWithBytesBytesPerRowBytesPerImage) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLRegion, region);
    declare_value(NSUInteger, level);
    declare_value(NSUInteger, slice);
    declare_value(const_void_ptr, pixelBytes);
    declare_value(NSUInteger, bytesPerRow);
    declare_value(NSUInteger, bytesPerImage);
    [self replaceRegion: region mipmapLevel: level slice: slice withBytes: pixelBytes bytesPerRow: bytesPerRow bytesPerImage: bytesPerImage];
  }
}

NAN_METHOD(NMTLTexture::getBytesBytesPerRowFromRegionMipmapLevel) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(void_ptr, pixelBytes);
    declare_value(NSUInteger, bytesPerRow);
    declare_value(MTLRegion, region);
    declare_value(NSUInteger, level);
    [self getBytes: pixelBytes bytesPerRow: bytesPerRow fromRegion: region mipmapLevel: level];
  }
}

NAN_METHOD(NMTLTexture::replaceRegionMipmapLevelWithBytesBytesPerRow) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLRegion, region);
    declare_value(NSUInteger, level);
    declare_value(const_void_ptr, pixelBytes);
    declare_value(NSUInteger, bytesPerRow);
    [self replaceRegion: region mipmapLevel: level withBytes: pixelBytes bytesPerRow: bytesPerRow];
  }
}

#include "NMTLPixelFormat.h"

NAN_METHOD(NMTLTexture::newTextureViewWithPixelFormat) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPixelFormat, pixelFormat);
    JS_SET_RETURN(js_value_MTLTexture([self newTextureViewWithPixelFormat: pixelFormat]));
  }
}

NAN_METHOD(NMTLTexture::newTextureViewWithPixelFormatTextureTypeLevelsSlices) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPixelFormat, pixelFormat);
    declare_value(MTLTextureType, textureType);
    declare_value(NSRange, levelRange);
    declare_value(NSRange, sliceRange);
    JS_SET_RETURN(js_value_MTLTexture([self newTextureViewWithPixelFormat: pixelFormat textureType: textureType levels: levelRange slices: sliceRange]));
  }
}

#if TODO
NAN_METHOD(NMTLTexture::newSharedTextureHandle) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLSharedTextureHandle([self newSharedTextureHandle]));
  }
}
#endif

NAN_METHOD(NMTLTexture::newTextureViewWithPixelFormatTextureTypeLevelsSlicesSwizzle) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPixelFormat, pixelFormat);
    declare_value(MTLTextureType, textureType);
    declare_value(NSRange, levelRange);
    declare_value(NSRange, sliceRange);
    declare_value(MTLTextureSwizzleChannels, swizzle);
    JS_SET_RETURN(js_value_MTLTexture([self newTextureViewWithPixelFormat: pixelFormat textureType: textureType levels: levelRange slices: sliceRange swizzle: swizzle]));
  }
}

#include "NMTLResource.h"

NAN_GETTER(NMTLTexture::rootResourceGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLResource([self rootResource]));
  }
}

NAN_GETTER(NMTLTexture::parentTextureGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTexture([self parentTexture]));
  }
}

NAN_GETTER(NMTLTexture::parentRelativeLevelGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self parentRelativeLevel]));
  }
}

NAN_GETTER(NMTLTexture::parentRelativeSliceGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self parentRelativeSlice]));
  }
}

#include "NMTLBuffer.h"

NAN_GETTER(NMTLTexture::bufferGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLBuffer([self buffer]));
  }
}

NAN_GETTER(NMTLTexture::bufferOffsetGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self bufferOffset]));
  }
}

NAN_GETTER(NMTLTexture::bufferBytesPerRowGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self bufferBytesPerRow]));
  }
}

#include "NIOSurfaceRef.h"

NAN_GETTER(NMTLTexture::iosurfaceGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_IOSurfaceRef([self iosurface]));
  }
}

NAN_GETTER(NMTLTexture::iosurfacePlaneGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self iosurfacePlane]));
  }
}

NAN_GETTER(NMTLTexture::textureTypeGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTextureType([self textureType]));
  }
}

#include "NMTLPixelFormat.h"

NAN_GETTER(NMTLTexture::pixelFormatGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLPixelFormat([self pixelFormat]));
  }
}

NAN_GETTER(NMTLTexture::widthGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self width]));
  }
}

NAN_GETTER(NMTLTexture::heightGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self height]));
  }
}

NAN_GETTER(NMTLTexture::depthGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self depth]));
  }
}

NAN_GETTER(NMTLTexture::mipmapLevelCountGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self mipmapLevelCount]));
  }
}

NAN_GETTER(NMTLTexture::sampleCountGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self sampleCount]));
  }
}

NAN_GETTER(NMTLTexture::arrayLengthGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self arrayLength]));
  }
}

#include "NMTLTextureDescriptor.h"

NAN_GETTER(NMTLTexture::usageGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTextureUsage([self usage]));
  }
}

NAN_GETTER(NMTLTexture::isShareableGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isShareable]));
  }
}

NAN_GETTER(NMTLTexture::isFramebufferOnlyGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isFramebufferOnly]));
  }
}

NAN_GETTER(NMTLTexture::allowGPUOptimizedContentsGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowGPUOptimizedContents]));
  }
}

NAN_GETTER(NMTLTexture::swizzleGetter) {
  JS_UNWRAP_PROTOCOL(MTLTexture, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTextureSwizzleChannels([self swizzle]));
  }
}
