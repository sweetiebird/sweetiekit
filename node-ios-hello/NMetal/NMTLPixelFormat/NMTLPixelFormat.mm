//
//  NMTLPixelFormat.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLPixelFormat.h"

#import <Metal/MTLPixelFormat.h>

JS_INIT_GLOBALS(MTLPixelFormat);
  // constant values (exports)

  //typedef NS_ENUM(NSUInteger, MTLPixelFormat) {
    JS_ASSIGN_ENUM(MTLPixelFormatInvalid, NSInteger); // = 0,

    /* Normal 8 bit formats */
    
    JS_ASSIGN_ENUM(MTLPixelFormatA8Unorm, NSInteger); //      = 1,
    
    JS_ASSIGN_ENUM(MTLPixelFormatR8Unorm, NSInteger); //                            = 10,
#if !TARGET_OS_MAC
    JS_ASSIGN_ENUM(MTLPixelFormatR8Unorm_sRGB, NSInteger); // API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 11,
#endif

    JS_ASSIGN_ENUM(MTLPixelFormatR8Snorm, NSInteger); //      = 12,
    JS_ASSIGN_ENUM(MTLPixelFormatR8Uint, NSInteger); //       = 13,
    JS_ASSIGN_ENUM(MTLPixelFormatR8Sint, NSInteger); //       = 14,
    
    /* Normal 16 bit formats */

    JS_ASSIGN_ENUM(MTLPixelFormatR16Unorm, NSInteger); //     = 20,
    JS_ASSIGN_ENUM(MTLPixelFormatR16Snorm, NSInteger); //     = 22,
    JS_ASSIGN_ENUM(MTLPixelFormatR16Uint, NSInteger); //      = 23,
    JS_ASSIGN_ENUM(MTLPixelFormatR16Sint, NSInteger); //      = 24,
    JS_ASSIGN_ENUM(MTLPixelFormatR16Float, NSInteger); //     = 25,

    JS_ASSIGN_ENUM(MTLPixelFormatRG8Unorm, NSInteger); //                            = 30,
#if !TARGET_OS_MAC
    JS_ASSIGN_ENUM(MTLPixelFormatRG8Unorm_sRGB, NSInteger); // API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 31,
#endif
    JS_ASSIGN_ENUM(MTLPixelFormatRG8Snorm, NSInteger); //                            = 32,
    JS_ASSIGN_ENUM(MTLPixelFormatRG8Uint, NSInteger); //                             = 33,
    JS_ASSIGN_ENUM(MTLPixelFormatRG8Sint, NSInteger); //                             = 34,

    /* Packed 16 bit formats */
    
#if !TARGET_OS_MAC
    JS_ASSIGN_ENUM(MTLPixelFormatB5G6R5Unorm, NSInteger); // API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 40,
    JS_ASSIGN_ENUM(MTLPixelFormatA1BGR5Unorm, NSInteger); // API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 41,
    JS_ASSIGN_ENUM(MTLPixelFormatABGR4Unorm, NSInteger); //  API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 42,
    JS_ASSIGN_ENUM(MTLPixelFormatBGR5A1Unorm, NSInteger); // API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 43,
#endif

    /* Normal 32 bit formats */

    JS_ASSIGN_ENUM(MTLPixelFormatR32Uint, NSInteger); //  = 53,
    JS_ASSIGN_ENUM(MTLPixelFormatR32Sint, NSInteger); //  = 54,
    JS_ASSIGN_ENUM(MTLPixelFormatR32Float, NSInteger); // = 55,

    JS_ASSIGN_ENUM(MTLPixelFormatRG16Unorm, NSInteger); //  = 60,
    JS_ASSIGN_ENUM(MTLPixelFormatRG16Snorm, NSInteger); //  = 62,
    JS_ASSIGN_ENUM(MTLPixelFormatRG16Uint, NSInteger); //   = 63,
    JS_ASSIGN_ENUM(MTLPixelFormatRG16Sint, NSInteger); //   = 64,
    JS_ASSIGN_ENUM(MTLPixelFormatRG16Float, NSInteger); //  = 65,

    JS_ASSIGN_ENUM(MTLPixelFormatRGBA8Unorm, NSInteger); //      = 70,
    JS_ASSIGN_ENUM(MTLPixelFormatRGBA8Unorm_sRGB, NSInteger); // = 71,
    JS_ASSIGN_ENUM(MTLPixelFormatRGBA8Snorm, NSInteger); //      = 72,
    JS_ASSIGN_ENUM(MTLPixelFormatRGBA8Uint, NSInteger); //       = 73,
    JS_ASSIGN_ENUM(MTLPixelFormatRGBA8Sint, NSInteger); //       = 74,
    
    
    JS_ASSIGN_ENUM(MTLPixelFormatBGRA8Unorm, NSInteger); //      = 80,
    JS_ASSIGN_ENUM(MTLPixelFormatBGRA8Unorm_sRGB, NSInteger); // = 81,

    /* Packed 32 bit formats */

    JS_ASSIGN_ENUM(MTLPixelFormatRGB10A2Unorm, NSInteger); // = 90,
    JS_ASSIGN_ENUM(MTLPixelFormatRGB10A2Uint, NSInteger); //  = 91,

    JS_ASSIGN_ENUM(MTLPixelFormatRG11B10Float, NSInteger); // = 92,
    JS_ASSIGN_ENUM(MTLPixelFormatRGB9E5Float, NSInteger); // = 93,

    JS_ASSIGN_ENUM(MTLPixelFormatBGR10A2Unorm, NSInteger); //  API_AVAILABLE(macos(10.13), ios(11.0)) = 94,

#if !TARGET_OS_MAC
    JS_ASSIGN_ENUM(MTLPixelFormatBGR10_XR, NSInteger); //      API_AVAILABLE(ios(10.0)) API_UNAVAILABLE(macos) = 554,
    JS_ASSIGN_ENUM(MTLPixelFormatBGR10_XR_sRGB, NSInteger); // API_AVAILABLE(ios(10.0)) API_UNAVAILABLE(macos) = 555,
#endif

    /* Normal 64 bit formats */

    JS_ASSIGN_ENUM(MTLPixelFormatRG32Uint, NSInteger); //  = 103,
    JS_ASSIGN_ENUM(MTLPixelFormatRG32Sint, NSInteger); //  = 104,
    JS_ASSIGN_ENUM(MTLPixelFormatRG32Float, NSInteger); // = 105,

    JS_ASSIGN_ENUM(MTLPixelFormatRGBA16Unorm, NSInteger); //  = 110,
    JS_ASSIGN_ENUM(MTLPixelFormatRGBA16Snorm, NSInteger); //  = 112,
    JS_ASSIGN_ENUM(MTLPixelFormatRGBA16Uint, NSInteger); //   = 113,
    JS_ASSIGN_ENUM(MTLPixelFormatRGBA16Sint, NSInteger); //   = 114,
    JS_ASSIGN_ENUM(MTLPixelFormatRGBA16Float, NSInteger); //  = 115,

#if !TARGET_OS_MAC
    JS_ASSIGN_ENUM(MTLPixelFormatBGRA10_XR, NSInteger); //      API_AVAILABLE(ios(10.0)) API_UNAVAILABLE(macos) = 552,
    JS_ASSIGN_ENUM(MTLPixelFormatBGRA10_XR_sRGB, NSInteger); // API_AVAILABLE(ios(10.0)) API_UNAVAILABLE(macos) = 553,
#endif

    /* Normal 128 bit formats */

    JS_ASSIGN_ENUM(MTLPixelFormatRGBA32Uint, NSInteger); //  = 123,
    JS_ASSIGN_ENUM(MTLPixelFormatRGBA32Sint, NSInteger); //  = 124,
    JS_ASSIGN_ENUM(MTLPixelFormatRGBA32Float, NSInteger); // = 125,

    /* Compressed formats. */

#if !TARGET_OS_IPHONE
    /* S3TC/DXT */
    JS_ASSIGN_ENUM(MTLPixelFormatBC1_RGBA, NSInteger); //              API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 130,
    JS_ASSIGN_ENUM(MTLPixelFormatBC1_RGBA_sRGB, NSInteger); //         API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 131,
    JS_ASSIGN_ENUM(MTLPixelFormatBC2_RGBA, NSInteger); //              API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 132,
    JS_ASSIGN_ENUM(MTLPixelFormatBC2_RGBA_sRGB, NSInteger); //         API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 133,
    JS_ASSIGN_ENUM(MTLPixelFormatBC3_RGBA, NSInteger); //              API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 134,
    JS_ASSIGN_ENUM(MTLPixelFormatBC3_RGBA_sRGB, NSInteger); //         API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 135,

    /* RGTC */
    JS_ASSIGN_ENUM(MTLPixelFormatBC4_RUnorm, NSInteger); //            API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 140,
    JS_ASSIGN_ENUM(MTLPixelFormatBC4_RSnorm, NSInteger); //            API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 141,
    JS_ASSIGN_ENUM(MTLPixelFormatBC5_RGUnorm, NSInteger); //           API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 142,
    JS_ASSIGN_ENUM(MTLPixelFormatBC5_RGSnorm, NSInteger); //           API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 143,

    /* BPTC */
    JS_ASSIGN_ENUM(MTLPixelFormatBC6H_RGBFloat, NSInteger); //         API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 150,
    JS_ASSIGN_ENUM(MTLPixelFormatBC6H_RGBUfloat, NSInteger); //        API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 151,
    JS_ASSIGN_ENUM(MTLPixelFormatBC7_RGBAUnorm, NSInteger); //         API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 152,
    JS_ASSIGN_ENUM(MTLPixelFormatBC7_RGBAUnorm_sRGB, NSInteger); //    API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 153,
#endif

#if TARGET_OS_IPHONE
    /* PVRTC */
    JS_ASSIGN_ENUM(MTLPixelFormatPVRTC_RGB_2BPP, NSInteger); //        API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 160,
    JS_ASSIGN_ENUM(MTLPixelFormatPVRTC_RGB_2BPP_sRGB, NSInteger); //   API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 161,
    JS_ASSIGN_ENUM(MTLPixelFormatPVRTC_RGB_4BPP, NSInteger); //        API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 162,
    JS_ASSIGN_ENUM(MTLPixelFormatPVRTC_RGB_4BPP_sRGB, NSInteger); //   API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 163,
    JS_ASSIGN_ENUM(MTLPixelFormatPVRTC_RGBA_2BPP, NSInteger); //       API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 164,
    JS_ASSIGN_ENUM(MTLPixelFormatPVRTC_RGBA_2BPP_sRGB, NSInteger); //  API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 165,
    JS_ASSIGN_ENUM(MTLPixelFormatPVRTC_RGBA_4BPP, NSInteger); //       API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 166,
    JS_ASSIGN_ENUM(MTLPixelFormatPVRTC_RGBA_4BPP_sRGB, NSInteger); //  API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 167,

    /* ETC2 */
    JS_ASSIGN_ENUM(MTLPixelFormatEAC_R11Unorm, NSInteger); //          API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 170,
    JS_ASSIGN_ENUM(MTLPixelFormatEAC_R11Snorm, NSInteger); //          API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 172,
    JS_ASSIGN_ENUM(MTLPixelFormatEAC_RG11Unorm, NSInteger); //         API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 174,
    JS_ASSIGN_ENUM(MTLPixelFormatEAC_RG11Snorm, NSInteger); //         API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 176,
    JS_ASSIGN_ENUM(MTLPixelFormatEAC_RGBA8, NSInteger); //             API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 178,
    JS_ASSIGN_ENUM(MTLPixelFormatEAC_RGBA8_sRGB, NSInteger); //        API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 179,

    JS_ASSIGN_ENUM(MTLPixelFormatETC2_RGB8, NSInteger); //             API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 180,
    JS_ASSIGN_ENUM(MTLPixelFormatETC2_RGB8_sRGB, NSInteger); //        API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 181,
    JS_ASSIGN_ENUM(MTLPixelFormatETC2_RGB8A1, NSInteger); //           API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 182,
    JS_ASSIGN_ENUM(MTLPixelFormatETC2_RGB8A1_sRGB, NSInteger); //      API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 183,

    /* ASTC */
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_4x4_sRGB, NSInteger); //         API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 186,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_5x4_sRGB, NSInteger); //         API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 187,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_5x5_sRGB, NSInteger); //         API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 188,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_6x5_sRGB, NSInteger); //         API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 189,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_6x6_sRGB, NSInteger); //         API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 190,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_8x5_sRGB, NSInteger); //         API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 192,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_8x6_sRGB, NSInteger); //         API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 193,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_8x8_sRGB, NSInteger); //         API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 194,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_10x5_sRGB, NSInteger); //        API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 195,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_10x6_sRGB, NSInteger); //        API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 196,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_10x8_sRGB, NSInteger); //        API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 197,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_10x10_sRGB, NSInteger); //       API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 198,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_12x10_sRGB, NSInteger); //       API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 199,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_12x12_sRGB, NSInteger); //       API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 200,

    JS_ASSIGN_ENUM(MTLPixelFormatASTC_4x4_LDR, NSInteger); //          API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 204,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_5x4_LDR, NSInteger); //          API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 205,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_5x5_LDR, NSInteger); //          API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 206,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_6x5_LDR, NSInteger); //          API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 207,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_6x6_LDR, NSInteger); //          API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 208,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_8x5_LDR, NSInteger); //          API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 210,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_8x6_LDR, NSInteger); //          API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 211,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_8x8_LDR, NSInteger); //          API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 212,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_10x5_LDR, NSInteger); //         API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 213,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_10x6_LDR, NSInteger); //         API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 214,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_10x8_LDR, NSInteger); //         API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 215,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_10x10_LDR, NSInteger); //        API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 216,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_12x10_LDR, NSInteger); //        API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 217,
    JS_ASSIGN_ENUM(MTLPixelFormatASTC_12x12_LDR, NSInteger); //        API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) = 218,
#endif
    
    /*!
     @constant MTLPixelFormatGBGR422
     @abstract A pixel format where the red and green channels are subsampled horizontally.  Two pixels are stored in 32 bits, with shared red and blue values, and unique green values.
     @discussion This format is equivalent to YUY2, YUYV, yuvs, or GL_RGB_422_APPLE/GL_UNSIGNED_SHORT_8_8_REV_APPLE.   The component order, from lowest addressed byte to highest, is Y0, Cb, Y1, Cr.  There is no implicit colorspace conversion from YUV to RGB, the shader will receive (Cr, Y, Cb, 1).  422 textures must have a width that is a multiple of 2, and can only be used for 2D non-mipmap textures.  When sampling, ClampToEdge is the only usable wrap mode.
     */
    JS_ASSIGN_ENUM(MTLPixelFormatGBGR422, NSInteger); // = 240,

    /*!
     @constant MTLPixelFormatBGRG422
     @abstract A pixel format where the red and green channels are subsampled horizontally.  Two pixels are stored in 32 bits, with shared red and blue values, and unique green values.
     @discussion This format is equivalent to UYVY, 2vuy, or GL_RGB_422_APPLE/GL_UNSIGNED_SHORT_8_8_APPLE. The component order, from lowest addressed byte to highest, is Cb, Y0, Cr, Y1.  There is no implicit colorspace conversion from YUV to RGB, the shader will receive (Cr, Y, Cb, 1).  422 textures must have a width that is a multiple of 2, and can only be used for 2D non-mipmap textures.  When sampling, ClampToEdge is the only usable wrap mode.
     */
    JS_ASSIGN_ENUM(MTLPixelFormatBGRG422, NSInteger); // = 241,

    /* Depth */

#if !TARGET_OS_IPHONE
    JS_ASSIGN_ENUM(MTLPixelFormatDepth16Unorm, NSInteger); //          API_AVAILABLE(macos(10.12)) API_UNAVAILABLE(ios) = 250,
#endif
    JS_ASSIGN_ENUM(MTLPixelFormatDepth32Float, NSInteger); //  = 252,

    /* Stencil */

    JS_ASSIGN_ENUM(MTLPixelFormatStencil8, NSInteger); //        = 253,

    /* Depth Stencil */
    
#if !TARGET_OS_IPHONE
    JS_ASSIGN_ENUM(MTLPixelFormatDepth24Unorm_Stencil8, NSInteger); //  API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 255,
#endif
    JS_ASSIGN_ENUM(MTLPixelFormatDepth32Float_Stencil8, NSInteger); //  API_AVAILABLE(macos(10.11), ios(9.0)) = 260,

    JS_ASSIGN_ENUM(MTLPixelFormatX32_Stencil8, NSInteger); //  API_AVAILABLE(macos(10.12), ios(10.0)) = 261,
#if !TARGET_OS_IPHONE
    JS_ASSIGN_ENUM(MTLPixelFormatX24_Stencil8, NSInteger); //  API_AVAILABLE(macos(10.12)) API_UNAVAILABLE(ios) = 262,
#endif
  //} API_AVAILABLE(macos(10.11), ios(8.0));

JS_INIT_GLOBALS_END(MTLPixelFormat);
