//
//  NCGImage.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCGImage_h
#define NCGImage_h    

#include "NNSObject.h"

#define js_value_CFTypeID js_value_uint64_t
#define to_value_CFTypeID to_value_uint64_t
#define is_value_CFTypeID is_value_uint64_t

#define js_value_CGImageAlphaInfo(x) JS_ENUM(CGImageAlphaInfo, uint32_t, x)
#define to_value_CGImageAlphaInfo(x) TO_ENUM(CGImageAlphaInfo, uint32_t, x)
#define is_value_CGImageAlphaInfo(x) IS_ENUM(CGImageAlphaInfo, uint32_t, x)

#define js_value_CGImageByteOrderInfo(x) JS_ENUM(CGImageByteOrderInfo, uint32_t, x)
#define to_value_CGImageByteOrderInfo(x) TO_ENUM(CGImageByteOrderInfo, uint32_t, x)
#define is_value_CGImageByteOrderInfo(x) IS_ENUM(CGImageByteOrderInfo, uint32_t, x)

#define js_value_CGImagePixelFormatInfo(x) JS_ENUM(CGImagePixelFormatInfo, uint32_t, x)
#define to_value_CGImagePixelFormatInfo(x) TO_ENUM(CGImagePixelFormatInfo, uint32_t, x)
#define is_value_CGImagePixelFormatInfo(x) IS_ENUM(CGImagePixelFormatInfo, uint32_t, x)

#define js_value_CGBitmapInfo(x) JS_ENUM(CGBitmapInfo, uint32_t, x)
#define to_value_CGBitmapInfo(x) TO_ENUM(CGBitmapInfo, uint32_t, x)
#define is_value_CGBitmapInfo(x) IS_ENUM(CGBitmapInfo, uint32_t, x)

JS_WRAP_GLOBALS(CGImage);
JS_WRAP_GLOBALS_END(CGImage);

#endif /* NCGImage_h */
