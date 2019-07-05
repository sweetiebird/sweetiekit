//
//  NCGImage.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCGImage.h"

NAN_METHOD(CGImageGetTypeID) {
  declare_autoreleasepool {
    declare_args();
    JS_SET_RETURN(js_value_CFTypeID(::CGImageGetTypeID()));
  }
}

NAN_METHOD(CGImageCreateCopy) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    JS_SET_RETURN(js_value_CGImageRef(::CGImageCreateCopy(image)));
  }
}

NAN_METHOD(CGImageCreateWithImageInRect) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    declare_value(CGRect, rect);
    JS_SET_RETURN(js_value_CGImageRef(::CGImageCreateWithImageInRect(image, rect)));
  }
}

NAN_METHOD(CGImageCreateWithMask) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    declare_nullable_value(CGImageRef, mask);
    JS_SET_RETURN(js_value_CGImageRef(::CGImageCreateWithMask(image, mask)));
  }
}

NAN_METHOD(CGImageRetain) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    JS_SET_RETURN(js_value_CGImageRef(::CGImageRetain(image)));
  }
}

NAN_METHOD(CGImageRelease) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    ::CGImageRelease(image);
  }
}

NAN_METHOD(CGImageIsMask) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    JS_SET_RETURN(js_value_bool(::CGImageIsMask(image)));
  }
}

NAN_METHOD(CGImageGetWidth) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    JS_SET_RETURN(js_value_size_t(::CGImageGetWidth(image)));
  }
}

NAN_METHOD(CGImageGetHeight) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    JS_SET_RETURN(js_value_size_t(::CGImageGetHeight(image)));
  }
}

NAN_METHOD(CGImageGetBitsPerComponent) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    JS_SET_RETURN(js_value_size_t(::CGImageGetBitsPerComponent(image)));
  }
}

NAN_METHOD(CGImageGetBitsPerPixel) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    JS_SET_RETURN(js_value_size_t(::CGImageGetBitsPerPixel(image)));
  }
}

NAN_METHOD(CGImageGetBytesPerRow) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    JS_SET_RETURN(js_value_size_t(::CGImageGetBytesPerRow(image)));
  }
}

NAN_METHOD(CGImageGetColorSpace) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    JS_SET_RETURN(js_value_CGColorSpaceRef(::CGImageGetColorSpace(image)));
  }
}

NAN_METHOD(CGImageGetAlphaInfo) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    JS_SET_RETURN(js_value_CGImageAlphaInfo(::CGImageGetAlphaInfo(image)));
  }
}

NAN_METHOD(CGImageGetShouldInterpolate) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    JS_SET_RETURN(js_value_bool(::CGImageGetShouldInterpolate(image)));
  }
}

NAN_METHOD(CGImageGetBitmapInfo) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    JS_SET_RETURN(js_value_CGBitmapInfo(::CGImageGetBitmapInfo(image)));
  }
}

NAN_METHOD(CGImageGetByteOrderInfo) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    JS_SET_RETURN(js_value_CGImageByteOrderInfo(::CGImageGetByteOrderInfo(image)));
  }
}

NAN_METHOD(CGImageGetPixelFormatInfo) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    JS_SET_RETURN(js_value_CGImagePixelFormatInfo(::CGImageGetPixelFormatInfo(image)));
  }
}

NAN_METHOD(CGImageGetUTType) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGImageRef, image);
    JS_SET_RETURN(js_value_CFStringRef(::CGImageGetUTType(image)));
  }
}

JS_INIT_GLOBALS(CGImage);
  // global values (exports)
  JS_ASSIGN_GLOBAL_METHOD(CGImageGetTypeID);
  JS_ASSIGN_GLOBAL_METHOD(CGImageCreateCopy);
  JS_ASSIGN_GLOBAL_METHOD(CGImageCreateWithImageInRect);
  JS_ASSIGN_GLOBAL_METHOD(CGImageCreateWithMask);
  JS_ASSIGN_GLOBAL_METHOD(CGImageRetain);
  JS_ASSIGN_GLOBAL_METHOD(CGImageRelease);
  JS_ASSIGN_GLOBAL_METHOD(CGImageIsMask);
  JS_ASSIGN_GLOBAL_METHOD(CGImageGetWidth);
  JS_ASSIGN_GLOBAL_METHOD(CGImageGetHeight);
  JS_ASSIGN_GLOBAL_METHOD(CGImageGetBitsPerComponent);
  JS_ASSIGN_GLOBAL_METHOD(CGImageGetBitsPerPixel);
  JS_ASSIGN_GLOBAL_METHOD(CGImageGetBytesPerRow);
  JS_ASSIGN_GLOBAL_METHOD(CGImageGetColorSpace);
  JS_ASSIGN_GLOBAL_METHOD(CGImageGetAlphaInfo);
  JS_ASSIGN_GLOBAL_METHOD(CGImageGetShouldInterpolate);
  JS_ASSIGN_GLOBAL_METHOD(CGImageGetBitmapInfo);
  JS_ASSIGN_GLOBAL_METHOD(CGImageGetByteOrderInfo);
  JS_ASSIGN_GLOBAL_METHOD(CGImageGetPixelFormatInfo);
  JS_ASSIGN_GLOBAL_METHOD(CGImageGetUTType);

  //typedef CF_ENUM(uint32_t, CGImageAlphaInfo) {
    JS_ASSIGN_ENUM(kCGImageAlphaNone, uint32_t); // ,               /* For example, RGB. */
    JS_ASSIGN_ENUM(kCGImageAlphaPremultipliedLast, uint32_t); // ,  /* For example, premultiplied RGBA */
    JS_ASSIGN_ENUM(kCGImageAlphaPremultipliedFirst, uint32_t); // , /* For example, premultiplied ARGB */
    JS_ASSIGN_ENUM(kCGImageAlphaLast, uint32_t); // ,               /* For example, non-premultiplied RGBA */
    JS_ASSIGN_ENUM(kCGImageAlphaFirst, uint32_t); // ,              /* For example, non-premultiplied ARGB */
    JS_ASSIGN_ENUM(kCGImageAlphaNoneSkipLast, uint32_t); // ,       /* For example, RBGX. */
    JS_ASSIGN_ENUM(kCGImageAlphaNoneSkipFirst, uint32_t); // ,      /* For example, XRGB. */
    JS_ASSIGN_ENUM(kCGImageAlphaOnly, uint32_t); //                 /* No color data, alpha data only */
  //};

  //typedef CF_ENUM(uint32_t, CGImageByteOrderInfo) {
    JS_ASSIGN_ENUM(kCGImageByteOrderMask, uint32_t); //      = 0x7000,
    JS_ASSIGN_ENUM(kCGImageByteOrderDefault, uint32_t); //   = (0 << 12),
    JS_ASSIGN_ENUM(kCGImageByteOrder16Little, uint32_t); //  = (1 << 12),
    JS_ASSIGN_ENUM(kCGImageByteOrder32Little, uint32_t); //  = (2 << 12),
    JS_ASSIGN_ENUM(kCGImageByteOrder16Big, uint32_t); //     = (3 << 12),
    JS_ASSIGN_ENUM(kCGImageByteOrder32Big, uint32_t); //     = (4 << 12)
  //} CG_AVAILABLE_STARTING(10.0, 2.0);

  //typedef CF_ENUM(uint32_t, CGImagePixelFormatInfo) {
    JS_ASSIGN_ENUM(kCGImagePixelFormatMask, uint32_t); //       = 0xF0000,
    JS_ASSIGN_ENUM(kCGImagePixelFormatPacked, uint32_t); //     = (0 << 16),
    JS_ASSIGN_ENUM(kCGImagePixelFormatRGB555, uint32_t); //     = (1 << 16), /* Only for RGB 16 bits per pixel */
    JS_ASSIGN_ENUM(kCGImagePixelFormatRGB565, uint32_t); //     = (2 << 16), /* Only for RGB 16 bits per pixel */
    JS_ASSIGN_ENUM(kCGImagePixelFormatRGB101010, uint32_t); //  = (3 << 16), /* Only for RGB 32 bits per pixel */
    JS_ASSIGN_ENUM(kCGImagePixelFormatRGBCIF10, uint32_t); //   = (4 << 16), /* Only for RGB 32 bits per pixel */
  //} CG_AVAILABLE_STARTING(10.14, 12.0);

  //typedef CF_OPTIONS(uint32_t, CGBitmapInfo) {
    JS_ASSIGN_ENUM(kCGBitmapAlphaInfoMask, uint32_t); //  = 0x1F,

    JS_ASSIGN_ENUM(kCGBitmapFloatInfoMask, uint32_t); //  = 0xF00,
    JS_ASSIGN_ENUM(kCGBitmapFloatComponents, uint32_t); //  = (1 << 8),

    JS_ASSIGN_ENUM(kCGBitmapByteOrderMask, uint32_t); //      = kCGImageByteOrderMask,
    JS_ASSIGN_ENUM(kCGBitmapByteOrderDefault, uint32_t); //   = kCGImageByteOrderDefault,
    JS_ASSIGN_ENUM(kCGBitmapByteOrder16Little, uint32_t); //  = kCGImageByteOrder16Little,
    JS_ASSIGN_ENUM(kCGBitmapByteOrder32Little, uint32_t); //  = kCGImageByteOrder32Little,
    JS_ASSIGN_ENUM(kCGBitmapByteOrder16Big, uint32_t); //     = kCGImageByteOrder16Big,
    JS_ASSIGN_ENUM(kCGBitmapByteOrder32Big, uint32_t); //     = kCGImageByteOrder32Big
  //} CG_AVAILABLE_STARTING(10.0, 2.0);

JS_INIT_GLOBALS_END(CGImage);
