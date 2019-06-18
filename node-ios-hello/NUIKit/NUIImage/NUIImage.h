//
//  NUIImage.h
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIImage_h
#define NUIImage_h

#include "NNSObject.h"

#define js_value_UIImage(x) js_value_wrapper(x, UIImage)
#define to_value_UIImage(x) to_value_wrapper(x, UIImage)
#define is_value_UIImage(x) is_value_wrapper(x, UIImage)

#define js_value_UIImageOrientation(x) JS_ENUM(UIImageOrientation, NSInteger, x)
#define to_value_UIImageOrientation(x) TO_ENUM(UIImageOrientation, NSInteger, x)
#define is_value_UIImageOrientation(x) IS_ENUM(UIImageOrientation, NSInteger, x)

#define js_value_UIImageResizingMode(x) JS_ENUM(UIImageResizingMode, NSInteger, x)
#define to_value_UIImageResizingMode(x) TO_ENUM(UIImageResizingMode, NSInteger, x)
#define is_value_UIImageResizingMode(x) IS_ENUM(UIImageResizingMode, NSInteger, x)

#define js_value_UIImageRenderingMode(x) JS_ENUM(UIImageRenderingMode, NSInteger, x)
#define to_value_UIImageRenderingMode(x) TO_ENUM(UIImageRenderingMode, NSInteger, x)
#define is_value_UIImageRenderingMode(x) IS_ENUM(UIImageRenderingMode, NSInteger, x)

JS_WRAP_CLASS(UIImage, NSObject);
  JS_STATIC_METHOD(toArrayBuffer);
  JS_STATIC_METHOD(imageNamed);
  JS_STATIC_METHOD(imageNamedInBundleCompatibleWithTraitCollection);
  JS_STATIC_METHOD(imageWithContentsOfFile);
  JS_STATIC_METHOD(imageWithData);
  JS_STATIC_METHOD(imageWithDataScale);
  JS_STATIC_METHOD(imageWithCGImage);
  JS_STATIC_METHOD(imageWithCGImageScaleOrientation);
  JS_STATIC_METHOD(imageWithCIImage);
  JS_STATIC_METHOD(imageWithCIImageScaleOrientation);
  JS_STATIC_METHOD(animatedImageNamedDuration);
  JS_STATIC_METHOD(animatedResizableImageNamedCapInsetsDuration);
  JS_STATIC_METHOD(animatedResizableImageNamedCapInsetsResizingModeDuration);
  JS_STATIC_METHOD(animatedImageWithImagesDuration);
  JS_STATIC_METHOD(initWithContentsOfFile);
  JS_STATIC_METHOD(initWithData);
  JS_STATIC_METHOD(initWithDataScale);
  JS_STATIC_METHOD(initWithCGImage);
  JS_STATIC_METHOD(initWithCGImageScaleOrientation);
  JS_STATIC_METHOD(initWithCIImage);
  JS_STATIC_METHOD(initWithCIImageScaleOrientation);
  
  JS_METHOD(drawAtPoint);
  JS_METHOD(drawAtPointBlendModeAlpha);
  JS_METHOD(drawInRect);
  JS_METHOD(drawInRectBlendModeAlpha);
  JS_METHOD(drawAsPatternInRect);
  JS_METHOD(resizableImageWithCapInsets);
  JS_METHOD(resizableImageWithCapInsetsResizingMode);
  JS_METHOD(imageWithAlignmentRectInsets);
  JS_METHOD(imageWithRenderingMode);
  JS_METHOD(imageFlippedForRightToLeftLayoutDirection);
  JS_METHOD(imageWithHorizontallyFlippedOrientation);
  JS_METHOD(stretchableImageWithLeftCapWidthTopCapHeight);

  JS_PROP_READONLY(size);
  JS_PROP_READONLY(CGImage);
  JS_PROP_READONLY(CIImage);
  JS_PROP_READONLY(imageOrientation);
  JS_PROP_READONLY(scale);
  JS_PROP_READONLY(images);
  JS_PROP_READONLY(duration);
  JS_PROP_READONLY(capInsets);
  JS_PROP_READONLY(resizingMode);
  JS_PROP_READONLY(alignmentRectInsets);
  JS_PROP_READONLY(renderingMode);
  JS_PROP_READONLY(imageRendererFormat);
  JS_PROP_READONLY(traitCollection);
  JS_PROP_READONLY(imageAsset);
  JS_PROP_READONLY(flipsForRightToLeftLayoutDirection);
  JS_PROP_READONLY(leftCapWidth);
  JS_PROP_READONLY(topCapHeight);
JS_WRAP_CLASS_END(UIImage);

#endif /* NUIImage_h */
