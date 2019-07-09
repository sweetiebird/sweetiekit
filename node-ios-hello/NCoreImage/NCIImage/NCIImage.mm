//
//  CIImage.mm
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCIImage.h"
#include "NUIImage.h"

#define instancetype CIImage
#define js_value_instancetype js_value_CIImage

NCIImage::NCIImage() {}
NCIImage::~NCIImage() {}

JS_INIT_CLASS(CIImage, NSObject);
  JS_ASSIGN_STATIC_METHOD(imageWithCGImage);
  JS_ASSIGN_STATIC_METHOD(imageWithCGImageOptions);
#if DEPRECATED_10_11
#if !TARGET_OS_IPHONE
  JS_ASSIGN_STATIC_METHOD(imageWithCGLayer);
  JS_ASSIGN_STATIC_METHOD(imageWithCGLayerOptions);
#endif
#endif
  JS_ASSIGN_STATIC_METHOD(imageWithBitmapDataBytesPerRowSizeFormatColorSpace);
  JS_ASSIGN_STATIC_METHOD(imageWithTextureSizeFlippedColorSpace);
#if DEPRECATED_10_14
#if !TARGET_OS_IPHONE
  JS_ASSIGN_STATIC_METHOD(imageWithTextureSizeFlippedOptions);
#endif
#endif
  JS_ASSIGN_STATIC_METHOD(imageWithMTLTextureOptions);
  JS_ASSIGN_STATIC_METHOD(imageWithContentsOfURL);
  JS_ASSIGN_STATIC_METHOD(imageWithContentsOfURLOptions);
  JS_ASSIGN_STATIC_METHOD(imageWithData);
  JS_ASSIGN_STATIC_METHOD(imageWithDataOptions);
  JS_ASSIGN_STATIC_METHOD(imageWithCVImageBuffer);
  JS_ASSIGN_STATIC_METHOD(imageWithCVImageBufferOptions);
  JS_ASSIGN_STATIC_METHOD(imageWithCVPixelBuffer);
  JS_ASSIGN_STATIC_METHOD(imageWithCVPixelBufferOptions);
#if !TARGET_OS_SIMULATOR
  JS_ASSIGN_STATIC_METHOD(imageWithIOSurface);
  JS_ASSIGN_STATIC_METHOD(imageWithIOSurfaceOptions);
#endif
  JS_ASSIGN_STATIC_METHOD(imageWithColor);
  JS_ASSIGN_STATIC_METHOD(emptyImage);
  JS_ASSIGN_STATIC_METHOD(imageWithDepthDataOptions);
  JS_ASSIGN_STATIC_METHOD(imageWithDepthData);
  JS_ASSIGN_STATIC_METHOD(imageWithPortaitEffectsMatteOptions);
  JS_ASSIGN_STATIC_METHOD(imageWithPortaitEffectsMatte);
  JS_ASSIGN_PROTO_METHOD(initWithCGImage);
  JS_ASSIGN_PROTO_METHOD(initWithCGImageOptions);
#if DEPRECATED_10_11
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_METHOD(initWithCGLayer);
  JS_ASSIGN_PROTO_METHOD(initWithCGLayerOptions);
#endif
#endif
  JS_ASSIGN_PROTO_METHOD(initWithData);
  JS_ASSIGN_PROTO_METHOD(initWithDataOptions);
  JS_ASSIGN_PROTO_METHOD(initWithBitmapDataBytesPerRowSizeFormatColorSpace);
  JS_ASSIGN_PROTO_METHOD(initWithTextureSizeFlippedColorSpace);
#if DEPRECATED_10_14
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_METHOD(initWithTextureSizeFlippedOptions);
#endif
#endif
  JS_ASSIGN_PROTO_METHOD(initWithMTLTextureOptions);
  JS_ASSIGN_PROTO_METHOD(initWithContentsOfURL);
  JS_ASSIGN_PROTO_METHOD(initWithContentsOfURLOptions);
#if !TARGET_OS_SIMULATOR
  JS_ASSIGN_PROTO_METHOD(initWithIOSurface);
  JS_ASSIGN_PROTO_METHOD(initWithIOSurfaceOptions);
#endif
#if DEPRECATED_10_11
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_METHOD(initWithIOSurfacePlaneFormatOptions);
#endif
#endif
  JS_ASSIGN_PROTO_METHOD(initWithCVImageBuffer);
  JS_ASSIGN_PROTO_METHOD(initWithCVImageBufferOptions);
  JS_ASSIGN_PROTO_METHOD(initWithCVPixelBuffer);
  JS_ASSIGN_PROTO_METHOD(initWithCVPixelBufferOptions);
  JS_ASSIGN_PROTO_METHOD(initWithColor);
  JS_ASSIGN_PROTO_METHOD(imageByApplyingTransform);
  JS_ASSIGN_PROTO_METHOD(imageByApplyingOrientation);
  JS_ASSIGN_PROTO_METHOD(imageTransformForOrientation);
  JS_ASSIGN_PROTO_METHOD(imageByApplyingCGOrientation);
  JS_ASSIGN_PROTO_METHOD(imageTransformForCGOrientation);
  JS_ASSIGN_PROTO_METHOD(imageByCompositingOverImage);
  JS_ASSIGN_PROTO_METHOD(imageByCroppingToRect);
  JS_ASSIGN_PROTO_METHOD(imageByClampingToExtent);
  JS_ASSIGN_PROTO_METHOD(imageByClampingToRect);
  JS_ASSIGN_PROTO_METHOD(imageByApplyingFilterWithInputParameters);
  JS_ASSIGN_PROTO_METHOD(imageByApplyingFilter);
  JS_ASSIGN_PROTO_METHOD(imageByColorMatchingColorSpaceToWorkingSpace);
  JS_ASSIGN_PROTO_METHOD(imageByColorMatchingWorkingSpaceToColorSpace);
  JS_ASSIGN_PROTO_METHOD(imageByPremultiplyingAlpha);
  JS_ASSIGN_PROTO_METHOD(imageByUnpremultiplyingAlpha);
  JS_ASSIGN_PROTO_METHOD(imageBySettingAlphaOneInExtent);
  JS_ASSIGN_PROTO_METHOD(imageByApplyingGaussianBlurWithSigma);
  JS_ASSIGN_PROTO_METHOD(imageBySettingProperties);
  JS_ASSIGN_PROTO_METHOD(imageBySamplingLinear);
  JS_ASSIGN_PROTO_METHOD(imageBySamplingNearest);
  JS_ASSIGN_PROTO_METHOD(imageByInsertingIntermediate);
  JS_ASSIGN_PROTO_METHOD(imageByInsertingIntermediateCache);
  JS_ASSIGN_PROTO_METHOD(regionOfInterestForImageInRect);
  JS_ASSIGN_PROTO_METHOD(autoAdjustmentFilters);
  JS_ASSIGN_PROTO_METHOD(autoAdjustmentFiltersWithOptions);
  JS_ASSIGN_PROTO_METHOD(initWithDepthDataOptions);
  JS_ASSIGN_PROTO_METHOD(initWithDepthData);
  JS_ASSIGN_PROTO_METHOD(initWithPortaitEffectsMatteOptions);
  JS_ASSIGN_PROTO_METHOD(initWithPortaitEffectsMatte);
  JS_ASSIGN_PROTO_PROP_READONLY(extent);
  JS_ASSIGN_PROTO_PROP_READONLY(properties);
#if !TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
  JS_ASSIGN_PROTO_PROP_READONLY(definition);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(url);
  JS_ASSIGN_PROTO_PROP_READONLY(colorSpace);
  JS_ASSIGN_PROTO_PROP_READONLY(pixelBuffer);
  JS_ASSIGN_PROTO_PROP_READONLY(CGImage);
  JS_ASSIGN_PROTO_PROP_READONLY(depthData);
  JS_ASSIGN_PROTO_PROP_READONLY(portraitEffectsMatte);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CIImage, NSObject);
  
  // constants (exports)
  

  /* Pixel formats. */

  //typedef int CIFormat NS_TYPED_ENUM;

  JS_ASSIGN_ENUM(kCIFormatARGB8, CIFormat); // NS_AVAILABLE(10_4, 6_0);
  JS_ASSIGN_ENUM(kCIFormatBGRA8, CIFormat); //;
  JS_ASSIGN_ENUM(kCIFormatRGBA8, CIFormat); //;
  JS_ASSIGN_ENUM(kCIFormatABGR8, CIFormat); // NS_AVAILABLE(10_11, 9_0);

  JS_ASSIGN_ENUM(kCIFormatRGBAh, CIFormat); // NS_AVAILABLE(10_4, 6_0);
  JS_ASSIGN_ENUM(kCIFormatRGBA16, CIFormat); // NS_AVAILABLE(10_4, 10_0);
  JS_ASSIGN_ENUM(kCIFormatRGBAf, CIFormat); // NS_AVAILABLE(10_4, 7_0);

  JS_ASSIGN_ENUM(kCIFormatA8, CIFormat); // NS_AVAILABLE(10_11, 9_0);
  JS_ASSIGN_ENUM(kCIFormatA16, CIFormat); // NS_AVAILABLE(10_11, 9_0);
  JS_ASSIGN_ENUM(kCIFormatAh, CIFormat); // NS_AVAILABLE(10_11, 9_0);
  JS_ASSIGN_ENUM(kCIFormatAf, CIFormat); // NS_AVAILABLE(10_11, 9_0);

  JS_ASSIGN_ENUM(kCIFormatR8, CIFormat); // NS_AVAILABLE(10_11, 9_0);
  JS_ASSIGN_ENUM(kCIFormatR16, CIFormat); // NS_AVAILABLE(10_11, 9_0);
  JS_ASSIGN_ENUM(kCIFormatRh, CIFormat); // NS_AVAILABLE(10_11, 9_0);
  JS_ASSIGN_ENUM(kCIFormatRf, CIFormat); // NS_AVAILABLE(10_11, 9_0);

  JS_ASSIGN_ENUM(kCIFormatRG8, CIFormat); // NS_AVAILABLE(10_11, 9_0);
  JS_ASSIGN_ENUM(kCIFormatRG16, CIFormat); // NS_AVAILABLE(10_11, 9_0);
  JS_ASSIGN_ENUM(kCIFormatRGh, CIFormat); // NS_AVAILABLE(10_11, 9_0);
  JS_ASSIGN_ENUM(kCIFormatRGf, CIFormat); // NS_AVAILABLE(10_11, 9_0);

  JS_ASSIGN_ENUM(kCIFormatL8, CIFormat); // NS_AVAILABLE(10_12, 10_0);
  JS_ASSIGN_ENUM(kCIFormatL16, CIFormat); // NS_AVAILABLE(10_12, 10_0);
  JS_ASSIGN_ENUM(kCIFormatLh, CIFormat); // NS_AVAILABLE(10_12, 10_0);
  JS_ASSIGN_ENUM(kCIFormatLf, CIFormat); // NS_AVAILABLE(10_12, 10_0);

  JS_ASSIGN_ENUM(kCIFormatLA8, CIFormat); // NS_AVAILABLE(10_12, 10_0);
  JS_ASSIGN_ENUM(kCIFormatLA16, CIFormat); // NS_AVAILABLE(10_12, 10_0);
  JS_ASSIGN_ENUM(kCIFormatLAh, CIFormat); // NS_AVAILABLE(10_12, 10_0);
  JS_ASSIGN_ENUM(kCIFormatLAf, CIFormat); // NS_AVAILABLE(10_12, 10_0);

  //typedef NSString * CIImageOption NS_TYPED_ENUM;

  /* A CGColorSpaceRef defining the color space of the image. This value
   * overrides the image's implicit color space.
   * If [NSNull null] then dont color manage the image. */
  JS_ASSIGN_ENUM(kCIImageColorSpace, CIImageOption); //;

  /* A boolean value specifying whether the image should sampled using "nearest neighbor" 
   * behavior.  If not specified, the image will be sampled using "linear sampling" */
  JS_ASSIGN_ENUM(kCIImageNearestSampling, CIImageOption); // NS_AVAILABLE(10_13, 11_0);


  /* A NSDictionary of metadata properties to pass to CIImage initialization methods.
   * When used with imageWithCGImage:options:, initWithCGImage:options:, imageWithData:options:, initWithData:options:
   *   If this option is not specified, the properties will be set to CGImageSourceCopyPropertiesAtIndex.
   *   If this option is [NSNull null], the properties will be set to nil.
   */
  JS_ASSIGN_ENUM(kCIImageProperties, CIImageOption); // NS_AVAILABLE(10_8, 5_0);


  /* A boolean value specifying whether the image should transformed according to orientation metadata properties.
   * This can be used with imageWithContentsOfURL: or initWithData: when the image contains orientation metadata
   * or with any of the initWith:options: method if the kCIImageProperties option is also provided.
   *   If this option value is @YES, the image will transformed according to the orientation metadata
   *   and the orientation metadata will be be removed.
   *   If this option not present or the value is @NO, then the image will not be transformed
   *   and the orientation metadata will left unaltered.
   */
  JS_ASSIGN_ENUM(kCIImageApplyOrientationProperty, CIImageOption); // NS_AVAILABLE(10_13, 11_0);


#if DEPRECATED_10_14
#if !defined(__IPHONEOS__)
  JS_ASSIGN_ENUM(kCIImageTextureTarget, CIImageOption); // CI_GL_DEPRECATED_MAC(10_9,10_14);
  JS_ASSIGN_ENUM(kCIImageTextureFormat, CIImageOption); // CI_GL_DEPRECATED_MAC(10_9,10_14);
#endif
#endif

  /* The kCIImageAuxiliaryDepth or kCIImageAuxiliaryDisparity or kCIImageAuxiliaryPortraitEffectsMatte keys can be passed to the methods:
   + [CIImage imageWithContentsOfURL:options:]
   + [CIImage imageWithData:options:]
   If the value of one of these keys is @YES, the auxiliary image be returned instead of the primary image.
   If an auxiliary image is not present, then nil will be returned.
   The returned image will be a half float monochrome image.
   */
  JS_ASSIGN_ENUM(kCIImageAuxiliaryDepth, CIImageOption); // NS_AVAILABLE(10_13, 11_0);
  JS_ASSIGN_ENUM(kCIImageAuxiliaryDisparity, CIImageOption); // NS_AVAILABLE(10_13, 11_0);
  JS_ASSIGN_ENUM(kCIImageAuxiliaryPortraitEffectsMatte, CIImageOption); // NS_AVAILABLE(10_14, 12_0);

  //
  // constants (exports) from CGImageProperties.h
  //

  //typedef CF_ENUM(uint32_t, CGImagePropertyOrientation) {
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationUp, NSInteger); // = 1,        // 0th row at top,    0th column on left   - default orientation
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationUpMirrored, NSInteger); //,    // 0th row at top,    0th column on right  - horizontal flip
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationDown, NSInteger); //,          // 0th row at bottom, 0th column on right  - 180 deg rotation
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationDownMirrored, NSInteger); //,  // 0th row at bottom, 0th column on left   - vertical flip
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationLeftMirrored, NSInteger); //,  // 0th row on left,   0th column at top
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationRight, NSInteger); //,         // 0th row on right,  0th column at top    - 90 deg CW
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationRightMirrored, NSInteger); //, // 0th row on right,  0th column on bottom
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationLeft, NSInteger); //           // 0th row on left,   0th column at bottom - 90 deg CCW
  //};

JS_INIT_CLASS_END(CIImage, NSObject);

NAN_METHOD(NCIImage::New) {
  JS_RECONSTRUCT(CIImage);
  @autoreleasepool {
    CIImage* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CIImage *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_UIImage(info[0])) {
      self = [[CIImage alloc] initWithImage:to_value_UIImage(info[0])];
    } else if (info.Length() <= 0) {
      self = [[CIImage alloc] init];
    }
    if (self) {
      NCIImage *wrapper = new NCIImage();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CIImage::New: invalid arguments");
    }
  }
}

NAN_METHOD(NCIImage::imageWithCGImage) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGImageRef, image);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithCGImage: image]));
  }
}

NAN_METHOD(NCIImage::imageWithCGImageOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGImageRef, image);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithCGImage: image options: options]));
  }
}

#if DEPRECATED_10_11
#if !TARGET_OS_IPHONE
NAN_METHOD(NCIImage::imageWithCGLayer) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGLayerRef, layer);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithCGLayer: layer]));
  }
}

NAN_METHOD(NCIImage::imageWithCGLayerOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGLayerRef, layer);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithCGLayer: layer options: options]));
  }
}
#endif
#endif

NAN_METHOD(NCIImage::imageWithBitmapDataBytesPerRowSizeFormatColorSpace) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_value(size_t, bytesPerRow);
    declare_value(CGSize, size);
    declare_value(CIFormat, format);
    declare_nullable_value(CGColorSpaceRef, colorSpace);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithBitmapData: data bytesPerRow: bytesPerRow size: size format: format colorSpace: colorSpace]));
  }
}

NAN_METHOD(NCIImage::imageWithTextureSizeFlippedColorSpace) {
  declare_autoreleasepool {
    declare_args();
    declare_value(uint32_t, name);
    declare_value(CGSize, size);
    declare_value(BOOL, flipped);
    declare_nullable_value(CGColorSpaceRef, colorSpace);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithTexture: name size: size flipped: flipped colorSpace: colorSpace]));
  }
}

#if DEPRECATED_10_14
#if !TARGET_OS_IPHONE
NAN_METHOD(NCIImage::imageWithTextureSizeFlippedOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_value(uint32_t, name);
    declare_value(CGSize, size);
    declare_value(BOOL, flipped);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithTexture: name size: size flipped: flipped options: options]));
  }
}
#endif
#endif

NAN_METHOD(NCIImage::imageWithMTLTextureOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MTLTexture>*/, texture);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithMTLTexture: texture options: options]));
  }
}

#include "NNSURL.h"

NAN_METHOD(NCIImage::imageWithContentsOfURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithContentsOfURL: url]));
  }
}

NAN_METHOD(NCIImage::imageWithContentsOfURLOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithContentsOfURL: url options: options]));
  }
}

NAN_METHOD(NCIImage::imageWithData) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithData: data]));
  }
}

NAN_METHOD(NCIImage::imageWithDataOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithData: data options: options]));
  }
}

NAN_METHOD(NCIImage::imageWithCVImageBuffer) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CVImageBufferRef, imageBuffer);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithCVImageBuffer: imageBuffer]));
  }
}

NAN_METHOD(NCIImage::imageWithCVImageBufferOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CVImageBufferRef, imageBuffer);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithCVImageBuffer: imageBuffer options: options]));
  }
}

NAN_METHOD(NCIImage::imageWithCVPixelBuffer) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CVPixelBufferRef, pixelBuffer);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithCVPixelBuffer: pixelBuffer]));
  }
}

NAN_METHOD(NCIImage::imageWithCVPixelBufferOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CVPixelBufferRef, pixelBuffer);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithCVPixelBuffer: pixelBuffer options: options]));
  }
}

#if !TARGET_OS_SIMULATOR
#include "NIOSurfaceRef.h"

NAN_METHOD(NCIImage::imageWithIOSurface) {
  declare_autoreleasepool {
    declare_args();
    declare_value(IOSurfaceRef, surface);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithIOSurface: surface]));
  }
}

NAN_METHOD(NCIImage::imageWithIOSurfaceOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_value(IOSurfaceRef, surface);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_CIImage([CIImage imageWithIOSurface: surface options: options]));
  }
}
#endif

#include "NCIColor.h"

NAN_METHOD(NCIImage::imageWithColor) {
  declare_autoreleasepool {
    declare_args();
    if (is_value_UIColor(info[JS_ARGC])) {
      declare_pointer(UIColor, color);
      JS_SET_RETURN(js_value_CIImage([CIImage imageWithColor: [CIColor colorWithCGColor:[color CGColor]]]));
    } else {
      declare_pointer(CIColor, color);
      JS_SET_RETURN(js_value_CIImage([CIImage imageWithColor: color]));
    }
  }
}

NAN_METHOD(NCIImage::emptyImage) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIImage([CIImage emptyImage]));
  }
}

#include "NAVDepthData.h"

NAN_METHOD(NCIImage::imageWithDepthDataOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVDepthData, data);
    declare_nullable_pointer(NSDictionary/* <NSString*, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([CIImage imageWithDepthData: data options: options]));
  }
}

NAN_METHOD(NCIImage::imageWithDepthData) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVDepthData, data);
    JS_SET_RETURN(js_value_instancetype([CIImage imageWithDepthData: data]));
  }
}

#include "NAVPortraitEffectsMatte.h"

NAN_METHOD(NCIImage::imageWithPortaitEffectsMatteOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVPortraitEffectsMatte, matte);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([CIImage imageWithPortaitEffectsMatte: matte options: options]));
  }
}

NAN_METHOD(NCIImage::imageWithPortaitEffectsMatte) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVPortraitEffectsMatte, matte);
    JS_SET_RETURN(js_value_instancetype([CIImage imageWithPortaitEffectsMatte: matte]));
  }
}

NAN_METHOD(NCIImage::initWithCGImage) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGImageRef, image);
    JS_SET_RETURN(js_value_instancetype([self initWithCGImage: image]));
  }
}

NAN_METHOD(NCIImage::initWithCGImageOptions) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGImageRef, image);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithCGImage: image options: options]));
  }
}

#if DEPRECATED_10_11
#if !TARGET_OS_IPHONE
NAN_METHOD(NCIImage::initWithCGLayer) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGLayerRef, layer);
    JS_SET_RETURN(js_value_instancetype([self initWithCGLayer: layer]));
  }
}

NAN_METHOD(NCIImage::initWithCGLayerOptions) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGLayerRef, layer);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithCGLayer: layer options: options]));
  }
}
#endif
#endif

NAN_METHOD(NCIImage::initWithData) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    JS_SET_RETURN(js_value_instancetype([self initWithData: data]));
  }
}

NAN_METHOD(NCIImage::initWithDataOptions) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithData: data options: options]));
  }
}

NAN_METHOD(NCIImage::initWithBitmapDataBytesPerRowSizeFormatColorSpace) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_value(size_t, bytesPerRow);
    declare_value(CGSize, size);
    declare_value(CIFormat, format);
    declare_nullable_value(CGColorSpaceRef, colorSpace);
    JS_SET_RETURN(js_value_instancetype([self initWithBitmapData: data bytesPerRow: bytesPerRow size: size format: format colorSpace: colorSpace]));
  }
}

NAN_METHOD(NCIImage::initWithTextureSizeFlippedColorSpace) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(uint32_t, name);
    declare_value(CGSize, size);
    declare_value(BOOL, flipped);
    declare_nullable_value(CGColorSpaceRef, colorSpace);
    JS_SET_RETURN(js_value_instancetype([self initWithTexture: name size: size flipped: flipped colorSpace: colorSpace]));
  }
}

#if DEPRECATED_10_14
#if !TARGET_OS_IPHONE
NAN_METHOD(NCIImage::initWithTextureSizeFlippedOptions) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(uint32_t, name);
    declare_value(CGSize, size);
    declare_value(BOOL, flipped);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithTexture: name size: size flipped: flipped options: options]));
  }
}
#endif
#endif

NAN_METHOD(NCIImage::initWithMTLTextureOptions) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MTLTexture>*/, texture);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithMTLTexture: texture options: options]));
  }
}

NAN_METHOD(NCIImage::initWithContentsOfURL) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    JS_SET_RETURN(js_value_instancetype([self initWithContentsOfURL: url]));
  }
}

NAN_METHOD(NCIImage::initWithContentsOfURLOptions) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithContentsOfURL: url options: options]));
  }
}

#if !TARGET_OS_SIMULATOR
NAN_METHOD(NCIImage::initWithIOSurface) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(IOSurfaceRef, surface);
    JS_SET_RETURN(js_value_instancetype([self initWithIOSurface: surface]));
  }
}

NAN_METHOD(NCIImage::initWithIOSurfaceOptions) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(IOSurfaceRef, surface);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithIOSurface: surface options: options]));
  }
}
#endif

#if DEPRECATED_10_11
#if !TARGET_OS_IPHONE
NAN_METHOD(NCIImage::initWithIOSurfacePlaneFormatOptions) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(IOSurfaceRef, surface);
    declare_value(size_t, plane);
    declare_value(CIFormat, format);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithIOSurface: surface plane: plane format: format options: options]));
  }
}
#endif
#endif

NAN_METHOD(NCIImage::initWithCVImageBuffer) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CVImageBufferRef, imageBuffer);
    JS_SET_RETURN(js_value_instancetype([self initWithCVImageBuffer: imageBuffer]));
  }
}

NAN_METHOD(NCIImage::initWithCVImageBufferOptions) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CVImageBufferRef, imageBuffer);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithCVImageBuffer: imageBuffer options: options]));
  }
}

NAN_METHOD(NCIImage::initWithCVPixelBuffer) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CVPixelBufferRef, pixelBuffer);
    JS_SET_RETURN(js_value_instancetype([self initWithCVPixelBuffer: pixelBuffer]));
  }
}

NAN_METHOD(NCIImage::initWithCVPixelBufferOptions) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CVPixelBufferRef, pixelBuffer);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithCVPixelBuffer: pixelBuffer options: options]));
  }
}

NAN_METHOD(NCIImage::initWithColor) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CIColor, color);
    JS_SET_RETURN(js_value_instancetype([self initWithColor: color]));
  }
}

NAN_METHOD(NCIImage::imageByApplyingTransform) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGAffineTransform, matrix);
    JS_SET_RETURN(js_value_CIImage([self imageByApplyingTransform: matrix]));
  }
}

NAN_METHOD(NCIImage::imageByApplyingOrientation) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(int, orientation);
    JS_SET_RETURN(js_value_CIImage([self imageByApplyingOrientation: orientation]));
  }
}

NAN_METHOD(NCIImage::imageTransformForOrientation) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(int, orientation);
    JS_SET_RETURN(js_value_CGAffineTransform([self imageTransformForOrientation: orientation]));
  }
}

NAN_METHOD(NCIImage::imageByApplyingCGOrientation) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGImagePropertyOrientation, orientation);
    JS_SET_RETURN(js_value_CIImage([self imageByApplyingCGOrientation: orientation]));
  }
}

NAN_METHOD(NCIImage::imageTransformForCGOrientation) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGImagePropertyOrientation, orientation);
    JS_SET_RETURN(js_value_CGAffineTransform([self imageTransformForCGOrientation: orientation]));
  }
}

NAN_METHOD(NCIImage::imageByCompositingOverImage) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CIImage, dest);
    JS_SET_RETURN(js_value_CIImage([self imageByCompositingOverImage: dest]));
  }
}

NAN_METHOD(NCIImage::imageByCroppingToRect) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    JS_SET_RETURN(js_value_CIImage([self imageByCroppingToRect: rect]));
  }
}

NAN_METHOD(NCIImage::imageByClampingToExtent) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIImage([self imageByClampingToExtent]));
  }
}

NAN_METHOD(NCIImage::imageByClampingToRect) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    JS_SET_RETURN(js_value_CIImage([self imageByClampingToRect: rect]));
  }
}

NAN_METHOD(NCIImage::imageByApplyingFilterWithInputParameters) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, filterName);
    declare_nullable_pointer(NSDictionary/* <NSString*, id>*/, params);
    JS_SET_RETURN(js_value_CIImage([self imageByApplyingFilter: filterName withInputParameters: params]));
  }
}

NAN_METHOD(NCIImage::imageByApplyingFilter) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, filterName);
    JS_SET_RETURN(js_value_CIImage([self imageByApplyingFilter: filterName]));
  }
}

NAN_METHOD(NCIImage::imageByColorMatchingColorSpaceToWorkingSpace) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGColorSpaceRef, colorSpace);
    JS_SET_RETURN(js_value_CIImage([self imageByColorMatchingColorSpaceToWorkingSpace: colorSpace]));
  }
}

NAN_METHOD(NCIImage::imageByColorMatchingWorkingSpaceToColorSpace) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGColorSpaceRef, colorSpace);
    JS_SET_RETURN(js_value_CIImage([self imageByColorMatchingWorkingSpaceToColorSpace: colorSpace]));
  }
}

NAN_METHOD(NCIImage::imageByPremultiplyingAlpha) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIImage([self imageByPremultiplyingAlpha]));
  }
}

NAN_METHOD(NCIImage::imageByUnpremultiplyingAlpha) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIImage([self imageByUnpremultiplyingAlpha]));
  }
}

NAN_METHOD(NCIImage::imageBySettingAlphaOneInExtent) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, extent);
    JS_SET_RETURN(js_value_CIImage([self imageBySettingAlphaOneInExtent: extent]));
  }
}

NAN_METHOD(NCIImage::imageByApplyingGaussianBlurWithSigma) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(double, sigma);
    JS_SET_RETURN(js_value_CIImage([self imageByApplyingGaussianBlurWithSigma: sigma]));
  }
}

NAN_METHOD(NCIImage::imageBySettingProperties) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDictionary, properties);
    JS_SET_RETURN(js_value_CIImage([self imageBySettingProperties: properties]));
  }
}

NAN_METHOD(NCIImage::imageBySamplingLinear) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIImage([self imageBySamplingLinear]));
  }
}

NAN_METHOD(NCIImage::imageBySamplingNearest) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIImage([self imageBySamplingNearest]));
  }
}

NAN_METHOD(NCIImage::imageByInsertingIntermediate) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIImage([self imageByInsertingIntermediate]));
  }
}

NAN_METHOD(NCIImage::imageByInsertingIntermediateCache) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, cache);
    JS_SET_RETURN(js_value_CIImage([self imageByInsertingIntermediate: cache]));
  }
}

NAN_METHOD(NCIImage::regionOfInterestForImageInRect) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CIImage, image);
    declare_value(CGRect, rect);
    JS_SET_RETURN(js_value_CGRect([self regionOfInterestForImage: image inRect: rect]));
  }
}

NAN_METHOD(NCIImage::autoAdjustmentFilters) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<CIFilter*>([self autoAdjustmentFilters]));
  }
}

NAN_METHOD(NCIImage::autoAdjustmentFiltersWithOptions) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSDictionary/* <CIImageAutoAdjustmentOption, id>*/, options);
    JS_SET_RETURN(js_value_NSArray<CIFilter*>([self autoAdjustmentFiltersWithOptions: options]));
  }
}

NAN_METHOD(NCIImage::initWithDepthDataOptions) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVDepthData, data);
    declare_nullable_pointer(NSDictionary/* <NSString*, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithDepthData: data options: options]));
  }
}

NAN_METHOD(NCIImage::initWithDepthData) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVDepthData, data);
    JS_SET_RETURN(js_value_instancetype([self initWithDepthData: data]));
  }
}

NAN_METHOD(NCIImage::initWithPortaitEffectsMatteOptions) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVPortraitEffectsMatte, matte);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithPortaitEffectsMatte: matte options: options]));
  }
}

NAN_METHOD(NCIImage::initWithPortaitEffectsMatte) {
  JS_UNWRAP_OR_ALLOC(CIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVPortraitEffectsMatte, matte);
    JS_SET_RETURN(js_value_instancetype([self initWithPortaitEffectsMatte: matte]));
  }
}

NAN_GETTER(NCIImage::extentGetter) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self extent]));
  }
}

NAN_GETTER(NCIImage::propertiesGetter) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, id>*/([self properties]));
  }
}

#if !TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
NAN_GETTER(NCIImage::definitionGetter) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIFilterShape([self definition]));
  }
}
#endif

NAN_GETTER(NCIImage::urlGetter) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self url]));
  }
}

NAN_GETTER(NCIImage::colorSpaceGetter) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGColorSpaceRef([self colorSpace]));
  }
}

NAN_GETTER(NCIImage::pixelBufferGetter) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CVPixelBufferRef([self pixelBuffer]));
  }
}

NAN_GETTER(NCIImage::CGImageGetter) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGImageRef([self CGImage]));
  }
}

NAN_GETTER(NCIImage::depthDataGetter) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVDepthData([self depthData]));
  }
}

NAN_GETTER(NCIImage::portraitEffectsMatteGetter) {
  JS_UNWRAP(CIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVPortraitEffectsMatte([self portraitEffectsMatte]));
  }
}
