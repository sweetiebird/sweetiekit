//
//  NMTLTexture.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLTexture_h
#define NMTLTexture_h    

#include "NMTLResource.h"

#define js_value_MTLTexture(x) js_protocol_wrapper(x, MTLTexture)
#define to_value_MTLTexture(x) to_protocol_wrapper(x, MTLTexture)
#define is_value_MTLTexture(x) is_protocol_wrapper(x, MTLTexture)

#define js_value_MTLTextureType(x) JS_ENUM(MTLTextureType, NSUInteger, x)
#define to_value_MTLTextureType(x) TO_ENUM(MTLTextureType, NSUInteger, x)
#define is_value_MTLTextureType(x) IS_ENUM(MTLTextureType, NSUInteger, x)

#define js_value_MTLTextureUsage(x) JS_OPTS(MTLTextureUsage, NSUInteger, x)
#define to_value_MTLTextureUsage(x) TO_OPTS(MTLTextureUsage, NSUInteger, x)
#define is_value_MTLTextureUsage(x) IS_OPTS(MTLTextureUsage, NSUInteger, x)

JS_WRAP_PROTOCOL(MTLTexture, MTLResource);
  // TODO: declare MTLTexture methods and properties
JS_WRAP_PROTOCOL_END(MTLTexture, MTLResource);

#endif /* NMTLTexture_h */
