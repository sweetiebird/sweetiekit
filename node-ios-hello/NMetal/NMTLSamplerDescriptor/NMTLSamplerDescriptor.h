//
//  NMTLSamplerDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLSamplerDescriptor_h
#define NMTLSamplerDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLSamplerDescriptor(x) js_value_wrapper(x, MTLSamplerDescriptor)
#define to_value_MTLSamplerDescriptor(x) to_value_wrapper(x, MTLSamplerDescriptor)
#define is_value_MTLSamplerDescriptor(x) is_value_wrapper(x, MTLSamplerDescriptor)

#define js_value_MTLSamplerMinMagFilter(x) JS_ENUM(MTLSamplerMinMagFilter, NSUInteger, x)
#define to_value_MTLSamplerMinMagFilter(x) TO_ENUM(MTLSamplerMinMagFilter, NSUInteger, x)
#define is_value_MTLSamplerMinMagFilter(x) IS_ENUM(MTLSamplerMinMagFilter, NSUInteger, x)

#define js_value_MTLSamplerMipFilter(x) JS_ENUM(MTLSamplerMipFilter, NSUInteger, x)
#define to_value_MTLSamplerMipFilter(x) TO_ENUM(MTLSamplerMipFilter, NSUInteger, x)
#define is_value_MTLSamplerMipFilter(x) IS_ENUM(MTLSamplerMipFilter, NSUInteger, x)

#define js_value_MTLSamplerAddressMode(x) JS_ENUM(MTLSamplerAddressMode, NSUInteger, x)
#define to_value_MTLSamplerAddressMode(x) TO_ENUM(MTLSamplerAddressMode, NSUInteger, x)
#define is_value_MTLSamplerAddressMode(x) IS_ENUM(MTLSamplerAddressMode, NSUInteger, x)

#define js_value_MTLSamplerBorderColor(x) JS_ENUM(MTLSamplerBorderColor, NSUInteger, x)
#define to_value_MTLSamplerBorderColor(x) TO_ENUM(MTLSamplerBorderColor, NSUInteger, x)
#define is_value_MTLSamplerBorderColor(x) IS_ENUM(MTLSamplerBorderColor, NSUInteger, x)

JS_WRAP_CLASS(MTLSamplerDescriptor, NSObject);
  JS_PROP(minFilter);
  JS_PROP(magFilter);
  JS_PROP(mipFilter);
  JS_PROP(maxAnisotropy);
  JS_PROP(sAddressMode);
  JS_PROP(tAddressMode);
  JS_PROP(rAddressMode);
  JS_PROP(borderColor);
  JS_PROP(normalizedCoordinates);
  JS_PROP(lodMinClamp);
  JS_PROP(lodMaxClamp);
  JS_PROP(lodAverage);
  JS_PROP(compareFunction);
  JS_PROP(supportArgumentBuffers);
  JS_PROP(label);
JS_WRAP_CLASS_END(MTLSamplerDescriptor);

#endif /* NMTLSamplerDescriptor_h */
