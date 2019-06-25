//
//  NCIImage.h
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCIImage_h
#define NCIImage_h    

#include "NNSObject.h"

#define js_value_CIImage(x) js_value_wrapper(x, CIImage)
#define to_value_CIImage(x) to_value_wrapper(x, CIImage)
#define is_value_CIImage(x) is_value_wrapper(x, CIImage)

#define js_value_CIFormat(x) JS_ENUM(CIFormat, int, x)
#define to_value_CIFormat(x) TO_ENUM(CIFormat, int, x)
#define is_value_CIFormat(x) IS_ENUM(CIFormat, int, x)

#define js_value_CIImageOption(x) JS_ENUM(CIImageOption, NSString, x)
#define to_value_CIImageOption(x) TO_ENUM(CIImageOption, NSString, x)
#define is_value_CIImageOption(x) IS_ENUM(CIImageOption, NSString, x)

#define js_value_CGImagePropertyOrientation(x) JS_ENUM(CGImagePropertyOrientation, uint32_t, x)
#define to_value_CGImagePropertyOrientation(x) TO_ENUM(CGImagePropertyOrientation, uint32_t, x)
#define is_value_CGImagePropertyOrientation(x) IS_ENUM(CGImagePropertyOrientation, uint32_t, x)

JS_WRAP_CLASS(CIImage, NSObject);
  JS_STATIC_METHOD(imageWithCGImage);
  JS_STATIC_METHOD(imageWithCGImageOptions);
  JS_STATIC_METHOD(imageWithCGLayer);
  JS_STATIC_METHOD(imageWithCGLayerOptions);
  JS_STATIC_METHOD(imageWithBitmapDataBytesPerRowSizeFormatColorSpace);
  JS_STATIC_METHOD(imageWithTextureSizeFlippedColorSpace);
  JS_STATIC_METHOD(imageWithTextureSizeFlippedOptions);
  JS_STATIC_METHOD(imageWithMTLTextureOptions);
  JS_STATIC_METHOD(imageWithContentsOfURL);
  JS_STATIC_METHOD(imageWithContentsOfURLOptions);
  JS_STATIC_METHOD(imageWithData);
  JS_STATIC_METHOD(imageWithDataOptions);
  JS_STATIC_METHOD(imageWithCVImageBuffer);
  JS_STATIC_METHOD(imageWithCVImageBufferOptions);
  JS_STATIC_METHOD(imageWithCVPixelBuffer);
  JS_STATIC_METHOD(imageWithCVPixelBufferOptions);
  JS_STATIC_METHOD(imageWithIOSurface);
  JS_STATIC_METHOD(imageWithIOSurfaceOptions);
  JS_STATIC_METHOD(imageWithColor);
  JS_STATIC_METHOD(emptyImage);
  JS_STATIC_METHOD(imageWithDepthDataOptions);
  JS_STATIC_METHOD(imageWithDepthData);
  JS_STATIC_METHOD(imageWithPortaitEffectsMatteOptions);
  JS_STATIC_METHOD(imageWithPortaitEffectsMatte);
  JS_METHOD(initWithCGImage);
  JS_METHOD(initWithCGImageOptions);
  JS_METHOD(initWithCGLayer);
  JS_METHOD(initWithCGLayerOptions);
  JS_METHOD(initWithData);
  JS_METHOD(initWithDataOptions);
  JS_METHOD(initWithBitmapDataBytesPerRowSizeFormatColorSpace);
  JS_METHOD(initWithTextureSizeFlippedColorSpace);
  JS_METHOD(initWithTextureSizeFlippedOptions);
  JS_METHOD(initWithMTLTextureOptions);
  JS_METHOD(initWithContentsOfURL);
  JS_METHOD(initWithContentsOfURLOptions);
  JS_METHOD(initWithIOSurface);
  JS_METHOD(initWithIOSurfaceOptions);
  JS_METHOD(initWithIOSurfacePlaneFormatOptions);
  JS_METHOD(initWithCVImageBuffer);
  JS_METHOD(initWithCVImageBufferOptions);
  JS_METHOD(initWithCVPixelBuffer);
  JS_METHOD(initWithCVPixelBufferOptions);
  JS_METHOD(initWithColor);
  JS_METHOD(imageByApplyingTransform);
  JS_METHOD(imageByApplyingOrientation);
  JS_METHOD(imageTransformForOrientation);
  JS_METHOD(imageByApplyingCGOrientation);
  JS_METHOD(imageTransformForCGOrientation);
  JS_METHOD(imageByCompositingOverImage);
  JS_METHOD(imageByCroppingToRect);
  JS_METHOD(imageByClampingToExtent);
  JS_METHOD(imageByClampingToRect);
  JS_METHOD(imageByApplyingFilterWithInputParameters);
  JS_METHOD(imageByApplyingFilter);
  JS_METHOD(imageByColorMatchingColorSpaceToWorkingSpace);
  JS_METHOD(imageByColorMatchingWorkingSpaceToColorSpace);
  JS_METHOD(imageByPremultiplyingAlpha);
  JS_METHOD(imageByUnpremultiplyingAlpha);
  JS_METHOD(imageBySettingAlphaOneInExtent);
  JS_METHOD(imageByApplyingGaussianBlurWithSigma);
  JS_METHOD(imageBySettingProperties);
  JS_METHOD(imageBySamplingLinear);
  JS_METHOD(imageBySamplingNearest);
  JS_METHOD(imageByInsertingIntermediate);
  JS_METHOD(imageByInsertingIntermediateCache);
  JS_METHOD(regionOfInterestForImageInRect);
  JS_METHOD(autoAdjustmentFilters);
  JS_METHOD(autoAdjustmentFiltersWithOptions);
  JS_METHOD(initWithDepthDataOptions);
  JS_METHOD(initWithDepthData);
  JS_METHOD(initWithPortaitEffectsMatteOptions);
  JS_METHOD(initWithPortaitEffectsMatte);
  JS_PROP_READONLY(extent);
  JS_PROP_READONLY(properties);
  JS_PROP_READONLY(definition);
  JS_PROP_READONLY(url);
  JS_PROP_READONLY(colorSpace);
  JS_PROP_READONLY(pixelBuffer);
  JS_PROP_READONLY(CGImage);
  JS_PROP_READONLY(depthData);
  JS_PROP_READONLY(portraitEffectsMatte);
JS_WRAP_CLASS_END(CIImage);

#endif /* NCIImage_h */
