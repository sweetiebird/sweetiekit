//
//  NMTLTexture.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLTexture_h
#define NMTLTexture_h    

#include "NMTLResource.h"

#define js_value_MTLTextureType(x) JS_ENUM(MTLTextureType, NSUInteger, x)
#define to_value_MTLTextureType(x) TO_ENUM(MTLTextureType, NSUInteger, x)
#define is_value_MTLTextureType(x) IS_ENUM(MTLTextureType, NSUInteger, x)

#define js_value_MTLTextureSwizzle(x) JS_ENUM(MTLTextureSwizzle, uint8_t, x)
#define to_value_MTLTextureSwizzle(x) TO_ENUM(MTLTextureSwizzle, uint8_t, x)
#define is_value_MTLTextureSwizzle(x) IS_ENUM(MTLTextureSwizzle, uint8_t, x)

#define js_value_MTLTextureUsage(x) JS_OPTS(MTLTextureUsage, NSUInteger, x)
#define to_value_MTLTextureUsage(x) TO_OPTS(MTLTextureUsage, NSUInteger, x)
#define is_value_MTLTextureUsage(x) IS_OPTS(MTLTextureUsage, NSUInteger, x)

#define js_value_MTLTexture(x) js_protocol_wrapper(x, MTLTexture)
#define to_value_MTLTexture(x) to_protocol_wrapper(x, MTLTexture)
#define is_value_MTLTexture(x) is_protocol_wrapper(x, MTLTexture)

JS_DECLARE_STRUCT(MTLTextureSwizzleChannels);

JS_WRAP_PROTOCOL(MTLTexture, MTLResource);
  JS_METHOD(getBytesBytesPerRowBytesPerImageFromRegionMipmapLevelSlice);
  JS_METHOD(replaceRegionMipmapLevelSliceWithBytesBytesPerRowBytesPerImage);
  JS_METHOD(getBytesBytesPerRowFromRegionMipmapLevel);
  JS_METHOD(replaceRegionMipmapLevelWithBytesBytesPerRow);
  JS_METHOD(newTextureViewWithPixelFormat);
  JS_METHOD(newTextureViewWithPixelFormatTextureTypeLevelsSlices);
  JS_METHOD(newSharedTextureHandle);
  JS_METHOD(newTextureViewWithPixelFormatTextureTypeLevelsSlicesSwizzle);
  JS_PROP_READONLY(rootResource);
  JS_PROP_READONLY(parentTexture);
  JS_PROP_READONLY(parentRelativeLevel);
  JS_PROP_READONLY(parentRelativeSlice);
  JS_PROP_READONLY(buffer);
  JS_PROP_READONLY(bufferOffset);
  JS_PROP_READONLY(bufferBytesPerRow);
  JS_PROP_READONLY(iosurface);
  JS_PROP_READONLY(iosurfacePlane);
  JS_PROP_READONLY(textureType);
  JS_PROP_READONLY(pixelFormat);
  JS_PROP_READONLY(width);
  JS_PROP_READONLY(height);
  JS_PROP_READONLY(depth);
  JS_PROP_READONLY(mipmapLevelCount);
  JS_PROP_READONLY(sampleCount);
  JS_PROP_READONLY(arrayLength);
  JS_PROP_READONLY(usage);
  JS_PROP_READONLY(isShareable);
  JS_PROP_READONLY(isFramebufferOnly);
  JS_PROP_READONLY(allowGPUOptimizedContents);
  JS_PROP_READONLY(swizzle);
JS_WRAP_PROTOCOL_END(MTLTexture, MTLResource);

#endif /* NMTLTexture_h */
