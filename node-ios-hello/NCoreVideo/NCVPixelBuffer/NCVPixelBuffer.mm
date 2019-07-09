//
//  NCVPixelBuffer.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCVPixelBuffer.h"

#include "NMacTypes.h"
#include "NCFBase.h"
#include "NCVBase.h"

JS_INIT_GLOBALS(CVPixelBuffer);
  // global values (exports)

  /*
  CoreVideo pixel format type constants.
  CoreVideo does not provide support for all of these formats; this list just defines their names.
  */
  //#if COREVIDEO_USE_DERIVED_ENUMS_FOR_CONSTANTS
  //enum : OSType
  //#else
  //enum
  //#endif
  //{
    JS_ASSIGN_ENUM(kCVPixelFormatType_1Monochrome, OSType); //     = 0x00000001, /* 1 bit indexed */
    JS_ASSIGN_ENUM(kCVPixelFormatType_2Indexed, OSType); //        = 0x00000002, /* 2 bit indexed */
    JS_ASSIGN_ENUM(kCVPixelFormatType_4Indexed, OSType); //        = 0x00000004, /* 4 bit indexed */
    JS_ASSIGN_ENUM(kCVPixelFormatType_8Indexed, OSType); //        = 0x00000008, /* 8 bit indexed */
    JS_ASSIGN_ENUM(kCVPixelFormatType_1IndexedGray_WhiteIsZero, OSType); //  = 0x00000021, /* 1 bit indexed gray, white is zero */
    JS_ASSIGN_ENUM(kCVPixelFormatType_2IndexedGray_WhiteIsZero, OSType); //  = 0x00000022, /* 2 bit indexed gray, white is zero */
    JS_ASSIGN_ENUM(kCVPixelFormatType_4IndexedGray_WhiteIsZero, OSType); //  = 0x00000024, /* 4 bit indexed gray, white is zero */
    JS_ASSIGN_ENUM(kCVPixelFormatType_8IndexedGray_WhiteIsZero, OSType); //  = 0x00000028, /* 8 bit indexed gray, white is zero */
    JS_ASSIGN_ENUM(kCVPixelFormatType_16BE555, OSType); //         = 0x00000010, /* 16 bit BE RGB 555 */
    JS_ASSIGN_ENUM(kCVPixelFormatType_16LE555, OSType); //         = 'L555',     /* 16 bit LE RGB 555 */
    JS_ASSIGN_ENUM(kCVPixelFormatType_16LE5551, OSType); //        = '5551',     /* 16 bit LE RGB 5551 */
    JS_ASSIGN_ENUM(kCVPixelFormatType_16BE565, OSType); //         = 'B565',     /* 16 bit BE RGB 565 */
    JS_ASSIGN_ENUM(kCVPixelFormatType_16LE565, OSType); //         = 'L565',     /* 16 bit LE RGB 565 */
    JS_ASSIGN_ENUM(kCVPixelFormatType_24RGB, OSType); //           = 0x00000018, /* 24 bit RGB */
    JS_ASSIGN_ENUM(kCVPixelFormatType_24BGR, OSType); //           = '24BG',     /* 24 bit BGR */
    JS_ASSIGN_ENUM(kCVPixelFormatType_32ARGB, OSType); //          = 0x00000020, /* 32 bit ARGB */
    JS_ASSIGN_ENUM(kCVPixelFormatType_32BGRA, OSType); //          = 'BGRA',     /* 32 bit BGRA */
    JS_ASSIGN_ENUM(kCVPixelFormatType_32ABGR, OSType); //          = 'ABGR',     /* 32 bit ABGR */
    JS_ASSIGN_ENUM(kCVPixelFormatType_32RGBA, OSType); //          = 'RGBA',     /* 32 bit RGBA */
    JS_ASSIGN_ENUM(kCVPixelFormatType_64ARGB, OSType); //          = 'b64a',     /* 64 bit ARGB, 16-bit big-endian samples */
    JS_ASSIGN_ENUM(kCVPixelFormatType_48RGB, OSType); //           = 'b48r',     /* 48 bit RGB, 16-bit big-endian samples */
    JS_ASSIGN_ENUM(kCVPixelFormatType_32AlphaGray, OSType); //     = 'b32a',     /* 32 bit AlphaGray, 16-bit big-endian samples, black is zero */
    JS_ASSIGN_ENUM(kCVPixelFormatType_16Gray, OSType); //          = 'b16g',     /* 16 bit Grayscale, 16-bit big-endian samples, black is zero */
    JS_ASSIGN_ENUM(kCVPixelFormatType_30RGB, OSType); //           = 'R10k',     /* 30 bit RGB, 10-bit big-endian samples, 2 unused padding bits (at least significant end). */
    JS_ASSIGN_ENUM(kCVPixelFormatType_422YpCbCr8, OSType); //      = '2vuy',     /* Component Y'CbCr 8-bit 4:2:2, ordered Cb Y'0 Cr Y'1 */
    JS_ASSIGN_ENUM(kCVPixelFormatType_4444YpCbCrA8, OSType); //    = 'v408',     /* Component Y'CbCrA 8-bit 4:4:4:4, ordered Cb Y' Cr A */
    JS_ASSIGN_ENUM(kCVPixelFormatType_4444YpCbCrA8R, OSType); //   = 'r408',     /* Component Y'CbCrA 8-bit 4:4:4:4, rendering format. full range alpha, zero biased YUV, ordered A Y' Cb Cr */
    JS_ASSIGN_ENUM(kCVPixelFormatType_4444AYpCbCr8, OSType); //    = 'y408',     /* Component Y'CbCrA 8-bit 4:4:4:4, ordered A Y' Cb Cr, full range alpha, video range Y'CbCr. */
    JS_ASSIGN_ENUM(kCVPixelFormatType_4444AYpCbCr16, OSType); //   = 'y416',     /* Component Y'CbCrA 16-bit 4:4:4:4, ordered A Y' Cb Cr, full range alpha, video range Y'CbCr, 16-bit little-endian samples. */
    JS_ASSIGN_ENUM(kCVPixelFormatType_444YpCbCr8, OSType); //      = 'v308',     /* Component Y'CbCr 8-bit 4:4:4 */
    JS_ASSIGN_ENUM(kCVPixelFormatType_422YpCbCr16, OSType); //     = 'v216',     /* Component Y'CbCr 10,12,14,16-bit 4:2:2 */
    JS_ASSIGN_ENUM(kCVPixelFormatType_422YpCbCr10, OSType); //     = 'v210',     /* Component Y'CbCr 10-bit 4:2:2 */
    JS_ASSIGN_ENUM(kCVPixelFormatType_444YpCbCr10, OSType); //     = 'v410',     /* Component Y'CbCr 10-bit 4:4:4 */
    JS_ASSIGN_ENUM(kCVPixelFormatType_420YpCbCr8Planar, OSType); //  = 'y420',   /* Planar Component Y'CbCr 8-bit 4:2:0.  baseAddr points to a big-endian CVPlanarPixelBufferInfo_YCbCrPlanar struct */
    JS_ASSIGN_ENUM(kCVPixelFormatType_420YpCbCr8PlanarFullRange, OSType); //     = 'f420',   /* Planar Component Y'CbCr 8-bit 4:2:0, full range.  baseAddr points to a big-endian CVPlanarPixelBufferInfo_YCbCrPlanar struct */
    JS_ASSIGN_ENUM(kCVPixelFormatType_422YpCbCr_4A_8BiPlanar, OSType); //  = 'a2vy', /* First plane: Video-range Component Y'CbCr 8-bit 4:2:2, ordered Cb Y'0 Cr Y'1; second plane: alpha 8-bit 0-255 */
    JS_ASSIGN_ENUM(kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange, OSType); //  = '420v', /* Bi-Planar Component Y'CbCr 8-bit 4:2:0, video-range (luma=[16,235] chroma=[16,240]).  baseAddr points to a big-endian CVPlanarPixelBufferInfo_YCbCrBiPlanar struct */
    JS_ASSIGN_ENUM(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange, OSType); //   = '420f', /* Bi-Planar Component Y'CbCr 8-bit 4:2:0, full-range (luma=[0,255] chroma=[1,255]).  baseAddr points to a big-endian CVPlanarPixelBufferInfo_YCbCrBiPlanar struct */ 
    JS_ASSIGN_ENUM(kCVPixelFormatType_422YpCbCr8_yuvs, OSType); //  = 'yuvs',     /* Component Y'CbCr 8-bit 4:2:2, ordered Y'0 Cb Y'1 Cr */
    JS_ASSIGN_ENUM(kCVPixelFormatType_422YpCbCr8FullRange, OSType); //  = 'yuvf', /* Component Y'CbCr 8-bit 4:2:2, full range, ordered Y'0 Cb Y'1 Cr */
    JS_ASSIGN_ENUM(kCVPixelFormatType_OneComponent8, OSType); //   = 'L008',     /* 8 bit one component, black is zero */
    JS_ASSIGN_ENUM(kCVPixelFormatType_TwoComponent8, OSType); //   = '2C08',     /* 8 bit two component, black is zero */
    JS_ASSIGN_ENUM(kCVPixelFormatType_30RGBLEPackedWideGamut, OSType); //  = 'w30r', /* little-endian RGB101010, 2 MSB are zero, wide-gamut (384-895) */
    JS_ASSIGN_ENUM(kCVPixelFormatType_ARGB2101010LEPacked, OSType); //  = 'l10r',     /* little-endian ARGB2101010 full-range ARGB */
    JS_ASSIGN_ENUM(kCVPixelFormatType_OneComponent16Half, OSType); //   = 'L00h',     /* 16 bit one component IEEE half-precision float, 16-bit little-endian samples */
    JS_ASSIGN_ENUM(kCVPixelFormatType_OneComponent32Float, OSType); //  = 'L00f',     /* 32 bit one component IEEE float, 32-bit little-endian samples */
    JS_ASSIGN_ENUM(kCVPixelFormatType_TwoComponent16Half, OSType); //   = '2C0h',     /* 16 bit two component IEEE half-precision float, 16-bit little-endian samples */
    JS_ASSIGN_ENUM(kCVPixelFormatType_TwoComponent32Float, OSType); //  = '2C0f',     /* 32 bit two component IEEE float, 32-bit little-endian samples */
    JS_ASSIGN_ENUM(kCVPixelFormatType_64RGBAHalf, OSType); //           = 'RGhA',     /* 64 bit RGBA IEEE half-precision float, 16-bit little-endian samples */
    JS_ASSIGN_ENUM(kCVPixelFormatType_128RGBAFloat, OSType); //         = 'RGfA',     /* 128 bit RGBA IEEE float, 32-bit little-endian samples */
    JS_ASSIGN_ENUM(kCVPixelFormatType_14Bayer_GRBG, OSType); //         = 'grb4',     /* Bayer 14-bit Little-Endian, packed in 16-bits, ordered G R G R... alternating with B G B G... */
    JS_ASSIGN_ENUM(kCVPixelFormatType_14Bayer_RGGB, OSType); //         = 'rgg4',     /* Bayer 14-bit Little-Endian, packed in 16-bits, ordered R G R G... alternating with G B G B... */
    JS_ASSIGN_ENUM(kCVPixelFormatType_14Bayer_BGGR, OSType); //         = 'bgg4',     /* Bayer 14-bit Little-Endian, packed in 16-bits, ordered B G B G... alternating with G R G R... */
    JS_ASSIGN_ENUM(kCVPixelFormatType_14Bayer_GBRG, OSType); //         = 'gbr4',     /* Bayer 14-bit Little-Endian, packed in 16-bits, ordered G B G B... alternating with R G R G... */
    JS_ASSIGN_ENUM(kCVPixelFormatType_DisparityFloat16, OSType); //    = 'hdis',     /* IEEE754-2008 binary16 (half float), describing the normalized shift when comparing two images. Units are 1/meters: ( pixelShift / (pixelFocalLength * baselineInMeters) ) */
    JS_ASSIGN_ENUM(kCVPixelFormatType_DisparityFloat32, OSType); //    = 'fdis',     /* IEEE754-2008 binary32 float, describing the normalized shift when comparing two images. Units are 1/meters: ( pixelShift / (pixelFocalLength * baselineInMeters) ) */
    JS_ASSIGN_ENUM(kCVPixelFormatType_DepthFloat16, OSType); //        = 'hdep',     /* IEEE754-2008 binary16 (half float), describing the depth (distance to an object) in meters */
    JS_ASSIGN_ENUM(kCVPixelFormatType_DepthFloat32, OSType); //        = 'fdep',     /* IEEE754-2008 binary32 float, describing the depth (distance to an object) in meters */
    JS_ASSIGN_ENUM(kCVPixelFormatType_420YpCbCr10BiPlanarVideoRange, OSType); //  = 'x420', /* 2 plane YCbCr10 4:2:0, each 10 bits in the MSBs of 16bits, video-range (luma=[64,940] chroma=[64,960]) */
    JS_ASSIGN_ENUM(kCVPixelFormatType_422YpCbCr10BiPlanarVideoRange, OSType); //  = 'x422', /* 2 plane YCbCr10 4:2:2, each 10 bits in the MSBs of 16bits, video-range (luma=[64,940] chroma=[64,960]) */
    JS_ASSIGN_ENUM(kCVPixelFormatType_444YpCbCr10BiPlanarVideoRange, OSType); //  = 'x444', /* 2 plane YCbCr10 4:4:4, each 10 bits in the MSBs of 16bits, video-range (luma=[64,940] chroma=[64,960]) */
    JS_ASSIGN_ENUM(kCVPixelFormatType_420YpCbCr10BiPlanarFullRange, OSType); //   = 'xf20', /* 2 plane YCbCr10 4:2:0, each 10 bits in the MSBs of 16bits, full-range (Y range 0-1023) */
    JS_ASSIGN_ENUM(kCVPixelFormatType_422YpCbCr10BiPlanarFullRange, OSType); //   = 'xf22', /* 2 plane YCbCr10 4:2:2, each 10 bits in the MSBs of 16bits, full-range (Y range 0-1023) */
    JS_ASSIGN_ENUM(kCVPixelFormatType_444YpCbCr10BiPlanarFullRange, OSType); //   = 'xf44', /* 2 plane YCbCr10 4:4:4, each 10 bits in the MSBs of 16bits, full-range (Y range 0-1023) */
  //};

  /*!
    @enum Pixel Buffer Locking Flags
    @discussion Flags to pass to CVPixelBufferLockBaseAddress() / CVPixelBufferUnlockBaseAddress()
    @constant kCVPixelBufferLock_ReadOnly
      If you are not going to modify the data while you hold the lock, you should set this flag
      to avoid potentially invalidating any existing caches of the buffer contents.  This flag
      should be passed both to the lock and unlock functions.  Non-symmetrical usage of this
      flag will result in undefined behavior.
  */
  //typedef CF_OPTIONS(CVOptionFlags, CVPixelBufferLockFlags) {
    JS_ASSIGN_ENUM(kCVPixelBufferLock_ReadOnly, CVPixelBufferLockFlags); //  = 0x00000001,
  //};

#pragma mark BufferAttributeKeys
  JS_ASSIGN_ENUM(kCVPixelBufferPixelFormatTypeKey, CFStringRef); //  API_AVAILABLE(macosx(10.4), ios(4.0), tvos(9.0), watchos(4.0));        // A single CFNumber or a CFArray of CFNumbers (OSTypes)
  JS_ASSIGN_ENUM(kCVPixelBufferMemoryAllocatorKey, CFStringRef); //  API_AVAILABLE(macosx(10.4), ios(4.0), tvos(9.0), watchos(4.0));        // CFAllocatorRef
  JS_ASSIGN_ENUM(kCVPixelBufferWidthKey, CFStringRef); //  API_AVAILABLE(macosx(10.4), ios(4.0), tvos(9.0), watchos(4.0));          // CFNumber
  JS_ASSIGN_ENUM(kCVPixelBufferHeightKey, CFStringRef); //  API_AVAILABLE(macosx(10.4), ios(4.0), tvos(9.0), watchos(4.0));          // CFNumber
  JS_ASSIGN_ENUM(kCVPixelBufferExtendedPixelsLeftKey, CFStringRef); //  API_AVAILABLE(macosx(10.4), ios(4.0), tvos(9.0), watchos(4.0));      // CFNumber
  JS_ASSIGN_ENUM(kCVPixelBufferExtendedPixelsTopKey, CFStringRef); //  API_AVAILABLE(macosx(10.4), ios(4.0), tvos(9.0), watchos(4.0));        // CFNumber
  JS_ASSIGN_ENUM(kCVPixelBufferExtendedPixelsRightKey, CFStringRef); //  API_AVAILABLE(macosx(10.4), ios(4.0), tvos(9.0), watchos(4.0));      // CFNumber
  JS_ASSIGN_ENUM(kCVPixelBufferExtendedPixelsBottomKey, CFStringRef); //  API_AVAILABLE(macosx(10.4), ios(4.0), tvos(9.0), watchos(4.0));      // CFNumber
  JS_ASSIGN_ENUM(kCVPixelBufferBytesPerRowAlignmentKey, CFStringRef); //  API_AVAILABLE(macosx(10.4), ios(4.0), tvos(9.0), watchos(4.0));      // CFNumber
  JS_ASSIGN_ENUM(kCVPixelBufferCGBitmapContextCompatibilityKey, CFStringRef); //  API_AVAILABLE(macosx(10.4), ios(4.0), tvos(9.0), watchos(4.0));  // CFBoolean
  JS_ASSIGN_ENUM(kCVPixelBufferCGImageCompatibilityKey, CFStringRef); //  API_AVAILABLE(macosx(10.4), ios(4.0), tvos(9.0), watchos(4.0));      // CFBoolean
  JS_ASSIGN_ENUM(kCVPixelBufferOpenGLCompatibilityKey, CFStringRef); //  API_AVAILABLE(macosx(10.4), ios(4.0), tvos(9.0), watchos(4.0));   // CFBoolean
  JS_ASSIGN_ENUM(kCVPixelBufferPlaneAlignmentKey, CFStringRef); //  API_AVAILABLE(macosx(10.6), ios(4.0), tvos(9.0), watchos(4.0));        // CFNumber
  JS_ASSIGN_ENUM(kCVPixelBufferIOSurfacePropertiesKey, CFStringRef); //  API_AVAILABLE(macosx(10.6), ios(4.0), tvos(9.0), watchos(4.0));     // CFDictionary; presence requests buffer allocation via IOSurface
  JS_ASSIGN_ENUM(kCVPixelBufferOpenGLESCompatibilityKey, CFStringRef); //  API_AVAILABLE(ios(6.0), tvos(9.0)) API_UNAVAILABLE(macosx, uikitformac) __WATCHOS_PROHIBITED;      // CFBoolean
  JS_ASSIGN_ENUM(kCVPixelBufferMetalCompatibilityKey, CFStringRef); //  API_AVAILABLE(macosx(10.11), ios(8.0), tvos(9.0), watchos(4.0));      // CFBoolean
#if !TARGET_OS_IPHONE && !TARGET_OS_TV && !TARGET_OS_WATCH
  JS_ASSIGN_ENUM(kCVPixelBufferOpenGLTextureCacheCompatibilityKey, CFStringRef); //  API_AVAILABLE(macosx(10.11)) API_UNAVAILABLE(ios, tvos, watchos);
#endif
  JS_ASSIGN_ENUM(kCVPixelBufferOpenGLESTextureCacheCompatibilityKey, CFStringRef); //  API_AVAILABLE(ios(9.0), tvos(9.0)) API_UNAVAILABLE(macosx, uikitformac) __WATCHOS_PROHIBITED;

JS_INIT_GLOBALS_END(CVPixelBuffer);
