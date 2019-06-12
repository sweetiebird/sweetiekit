//
//  NMDLTextureFilter.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLTextureFilter_h
#define NMDLTextureFilter_h    

#include "NNSObject.h"

#define js_value_MDLTextureFilter(x) js_value_wrapper(x, MDLTextureFilter)
#define to_value_MDLTextureFilter(x) to_value_wrapper(x, MDLTextureFilter)
#define is_value_MDLTextureFilter(x) is_value_wrapper(x, MDLTextureFilter)

// ModelIO constants
#define js_value_MDLMaterialTextureWrapMode(x) JS_ENUM(MDLMaterialTextureWrapMode, NSInteger, x)
#define to_value_MDLMaterialTextureWrapMode(x) TO_ENUM(MDLMaterialTextureWrapMode, NSInteger, x)
#define is_value_MDLMaterialTextureWrapMode(x) IS_ENUM(MDLMaterialTextureWrapMode, NSInteger, x)

#define js_value_MDLMaterialTextureFilterMode(x) JS_ENUM(MDLMaterialTextureFilterMode, NSInteger, x)
#define to_value_MDLMaterialTextureFilterMode(x) TO_ENUM(MDLMaterialTextureFilterMode, NSInteger, x)
#define is_value_MDLMaterialTextureFilterMode(x) IS_ENUM(MDLMaterialTextureFilterMode, NSInteger, x)

#define js_value_MDLMaterialMipMapFilterMode(x) JS_ENUM(MDLMaterialMipMapFilterMode, NSInteger, x)
#define to_value_MDLMaterialMipMapFilterMode(x) TO_ENUM(MDLMaterialMipMapFilterMode, NSInteger, x)
#define is_value_MDLMaterialMipMapFilterMode(x) IS_ENUM(MDLMaterialMipMapFilterMode, NSInteger, x)

JS_WRAP_CLASS(MDLTextureFilter, NSObject);
  JS_PROP(sWrapMode);
  JS_PROP(tWrapMode);
  JS_PROP(rWrapMode);
  JS_PROP(minFilter);
  JS_PROP(magFilter);
  JS_PROP(mipFilter);
JS_WRAP_CLASS_END(MDLTextureFilter);

#endif /* NMDLTextureFilter_h */
