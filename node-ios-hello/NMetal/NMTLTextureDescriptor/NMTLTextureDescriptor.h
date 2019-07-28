//
//  NMTLTextureDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLTextureDescriptor_h
#define NMTLTextureDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLTextureDescriptor(x) js_value_wrapper(x, MTLTextureDescriptor)
#define to_value_MTLTextureDescriptor(x) to_value_wrapper(x, MTLTextureDescriptor)
#define is_value_MTLTextureDescriptor(x) is_value_wrapper(x, MTLTextureDescriptor)

JS_WRAP_CLASS(MTLTextureDescriptor, NSObject);
  JS_STATIC_METHOD(texture2DDescriptorWithPixelFormatWidthHeightMipmapped);
  JS_STATIC_METHOD(textureCubeDescriptorWithPixelFormatSizeMipmapped);
  JS_STATIC_METHOD(textureBufferDescriptorWithPixelFormatWidthResourceOptionsUsage);
  JS_PROP(textureType);
  JS_PROP(pixelFormat);
  JS_PROP(width);
  JS_PROP(height);
  JS_PROP(depth);
  JS_PROP(mipmapLevelCount);
  JS_PROP(sampleCount);
  JS_PROP(arrayLength);
  JS_PROP(resourceOptions);
  JS_PROP(cpuCacheMode);
  JS_PROP(storageMode);
  JS_PROP(hazardTrackingMode);
  JS_PROP(usage);
  JS_PROP(allowGPUOptimizedContents);
  JS_PROP(swizzle);
JS_WRAP_CLASS_END(MTLTextureDescriptor);

#endif /* NMTLTextureDescriptor_h */
