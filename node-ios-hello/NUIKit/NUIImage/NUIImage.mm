//
//  NUIImage.mm
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIImage.h"

NUIImage::NUIImage() {}
NUIImage::~NUIImage() {}

JS_INIT_CLASS(UIImage, NSObject);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, toArrayBuffer);
  JS_ASSIGN_METHOD(proto, drawAtPoint);
  JS_ASSIGN_METHOD(proto, drawAtPointBlendModeAlpha);
  JS_ASSIGN_METHOD(proto, drawInRect);
  JS_ASSIGN_METHOD(proto, drawInRectBlendModeAlpha);
  JS_ASSIGN_METHOD(proto, drawAsPatternInRect);
  JS_ASSIGN_METHOD(proto, resizableImageWithCapInsets);
  JS_ASSIGN_METHOD(proto, resizableImageWithCapInsetsResizingMode);
  JS_ASSIGN_METHOD(proto, imageWithAlignmentRectInsets);
  JS_ASSIGN_METHOD(proto, imageWithRenderingMode);
  JS_ASSIGN_METHOD(proto, imageFlippedForRightToLeftLayoutDirection);
  JS_ASSIGN_METHOD(proto, imageWithHorizontallyFlippedOrientation);
  JS_ASSIGN_METHOD(proto, stretchableImageWithLeftCapWidthTopCapHeight);

  JS_ASSIGN_PROP_READONLY(proto, size);
  JS_ASSIGN_PROP_READONLY(proto, CGImage);
  JS_ASSIGN_PROP_READONLY(proto, CIImage);
  JS_ASSIGN_PROP_READONLY(proto, imageOrientation);
  JS_ASSIGN_PROP_READONLY(proto, scale);
  JS_ASSIGN_PROP_READONLY(proto, images);
  JS_ASSIGN_PROP_READONLY(proto, duration);
  JS_ASSIGN_PROP_READONLY(proto, capInsets);
  JS_ASSIGN_PROP_READONLY(proto, resizingMode);
  JS_ASSIGN_PROP_READONLY(proto, alignmentRectInsets);
  JS_ASSIGN_PROP_READONLY(proto, renderingMode);
  JS_ASSIGN_PROP_READONLY(proto, imageRendererFormat);
  JS_ASSIGN_PROP_READONLY(proto, traitCollection);
  JS_ASSIGN_PROP_READONLY(proto, imageAsset);
  JS_ASSIGN_PROP_READONLY(proto, flipsForRightToLeftLayoutDirection);
  JS_ASSIGN_PROP_READONLY(proto, leftCapWidth);
  JS_ASSIGN_PROP_READONLY(proto, topCapHeight);
  // static members (ctor)
  JS_INIT_CTOR(UIImage, NSObject);
  JS_ASSIGN_METHOD(ctor, imageNamed);
  JS_ASSIGN_METHOD(ctor, imageNamedInBundleCompatibleWithTraitCollection);
  JS_ASSIGN_METHOD(ctor, imageWithContentsOfFile);
  JS_ASSIGN_METHOD(ctor, imageWithData);
  JS_ASSIGN_METHOD(ctor, imageWithDataScale);
  JS_ASSIGN_METHOD(ctor, imageWithCGImage);
  JS_ASSIGN_METHOD(ctor, imageWithCGImageScaleOrientation);
  JS_ASSIGN_METHOD(ctor, imageWithCIImage);
  JS_ASSIGN_METHOD(ctor, imageWithCIImageScaleOrientation);
  JS_ASSIGN_METHOD(ctor, animatedImageNamedDuration);
  JS_ASSIGN_METHOD(ctor, animatedResizableImageNamedCapInsetsDuration);
  JS_ASSIGN_METHOD(ctor, animatedResizableImageNamedCapInsetsResizingModeDuration);
  JS_ASSIGN_METHOD(ctor, animatedImageWithImagesDuration);
  JS_ASSIGN_METHOD(ctor, initWithContentsOfFile);
  JS_ASSIGN_METHOD(ctor, initWithData);
  JS_ASSIGN_METHOD(ctor, initWithDataScale);
  JS_ASSIGN_METHOD(ctor, initWithCGImage);
  JS_ASSIGN_METHOD(ctor, initWithCGImageScaleOrientation);
  JS_ASSIGN_METHOD(ctor, initWithCIImage);
  JS_ASSIGN_METHOD(ctor, initWithCIImageScaleOrientation);

JS_INIT_CLASS_END(UIImage, NSObject);

NAN_METHOD(NUIImage::New) {
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `UIImage(...)`, turn into construct call.
      JS_SET_RETURN_NEW(UIImage, info);
      return;
    }
    UIImage* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIImage *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && info[0]->IsString()) {
      self = [UIImage imageNamed:to_value_NSString(info[0])];
    } else if (info.Length() >= 1 && info[0]->IsArrayBuffer()) {
      Local<ArrayBuffer> value = Local<ArrayBuffer>::Cast(info[0]);
      NSUInteger length = value->GetContents().ByteLength();
      const void* data = value->GetContents().Data();
      CGFloat scale = info[1]->IsNumber() ? TO_FLOAT(info[1]) : 1.0;
      self = [[UIImage alloc] initWithData:[[NSData alloc] initWithBytes:data length:length] scale:scale];
    } else if (info.Length() <= 0) {
      self = [[UIImage alloc] init];
    }
    if (self) {
      NUIImage *wrapper = new NUIImage();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIImage::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIImage::toArrayBuffer)
{
  JS_UNWRAP(UIImage, ui);
  @autoreleasepool {
    std::string type;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      type = *utf8Value;
    }

    double quality = 0.95;
    if (info[1]->IsNumber()) {
      quality = TO_DOUBLE(info[1]);
    }

    NSData* data = nullptr;
    if (type == "image/png") {
      data = UIImagePNGRepresentation(ui);
    } else if (type == "image/jpeg" || type == "image/jpg") {
      data = UIImageJPEGRepresentation(ui, quality);
    } else {
      type = "image/png";
      data = UIImagePNGRepresentation(ui);
    }
    NSUInteger length = [data length];
    const void* bytes = [data bytes];

    Local<ArrayBuffer> result = ArrayBuffer::New(Isolate::GetCurrent(), length);
    memcpy(result->GetContents().Data(), bytes, length);
    result->Set(JS_STR("type"), JS_STR(type));
    if (type == "image/jpeg" || type == "image/jpg") {
      result->Set(JS_STR("quality"), JS_NUM(quality));
    }
    JS_SET_RETURN(result);
  }
}

NAN_METHOD(NUIImage::imageNamed) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    JS_SET_RETURN(js_value_UIImage([UIImage imageNamed: name]));
  }
}

#include "NNSBundle.h"
#include "NUITraitCollection.h"

NAN_METHOD(NUIImage::imageNamedInBundleCompatibleWithTraitCollection) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_nullable_pointer(NSBundle, bundle);
    declare_nullable_pointer(UITraitCollection, traitCollection);
    JS_SET_RETURN(js_value_UIImage([UIImage imageNamed: name inBundle: bundle compatibleWithTraitCollection: traitCollection]));
  }
}

NAN_METHOD(NUIImage::imageWithContentsOfFile) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, path);
    JS_SET_RETURN(js_value_UIImage([UIImage imageWithContentsOfFile: path]));
  }
}

NAN_METHOD(NUIImage::imageWithData) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    JS_SET_RETURN(js_value_UIImage([UIImage imageWithData: data]));
  }
}

NAN_METHOD(NUIImage::imageWithDataScale) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_value(CGFloat, scale);
    JS_SET_RETURN(js_value_UIImage([UIImage imageWithData: data scale: scale]));
  }
}

NAN_METHOD(NUIImage::imageWithCGImage) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGImageRef, cgImage);
    JS_SET_RETURN(js_value_UIImage([UIImage imageWithCGImage: cgImage]));
  }
}

NAN_METHOD(NUIImage::imageWithCGImageScaleOrientation) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGImageRef, cgImage);
    declare_value(CGFloat, scale);
    declare_value(UIImageOrientation, orientation);
    JS_SET_RETURN(js_value_UIImage([UIImage imageWithCGImage: cgImage scale: scale orientation: orientation]));
  }
}

#include "NCIImage.h"

NAN_METHOD(NUIImage::imageWithCIImage) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CIImage, ciImage);
    JS_SET_RETURN(js_value_UIImage([UIImage imageWithCIImage: ciImage]));
  }
}

NAN_METHOD(NUIImage::imageWithCIImageScaleOrientation) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CIImage, ciImage);
    declare_value(CGFloat, scale);
    declare_value(UIImageOrientation, orientation);
    JS_SET_RETURN(js_value_UIImage([UIImage imageWithCIImage: ciImage scale: scale orientation: orientation]));
  }
}

NAN_METHOD(NUIImage::animatedImageNamedDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_UIImage([UIImage animatedImageNamed: name duration: duration]));
  }
}

NAN_METHOD(NUIImage::animatedResizableImageNamedCapInsetsDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(UIEdgeInsets, capInsets);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_UIImage([UIImage animatedResizableImageNamed: name capInsets: capInsets duration: duration]));
  }
}

NAN_METHOD(NUIImage::animatedResizableImageNamedCapInsetsResizingModeDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(UIEdgeInsets, capInsets);
    declare_value(UIImageResizingMode, resizingMode);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_UIImage([UIImage animatedResizableImageNamed: name capInsets: capInsets resizingMode: resizingMode duration: duration]));
  }
}

NAN_METHOD(NUIImage::animatedImageWithImagesDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<UIImage*>, images);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_UIImage([UIImage animatedImageWithImages: images duration: duration]));
  }
}

#define js_value_instancetype js_value_UIImage

NAN_METHOD(NUIImage::initWithContentsOfFile) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, path);
    JS_SET_RETURN(js_value_instancetype([[UIImage alloc] initWithContentsOfFile: path]));
  }
}

NAN_METHOD(NUIImage::initWithData) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    JS_SET_RETURN(js_value_instancetype([[UIImage alloc] initWithData: data]));
  }
}

NAN_METHOD(NUIImage::initWithDataScale) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_value(CGFloat, scale);
    JS_SET_RETURN(js_value_instancetype([[UIImage alloc] initWithData: data scale: scale]));
  }
}

NAN_METHOD(NUIImage::initWithCGImage) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGImageRef, cgImage);
    JS_SET_RETURN(js_value_instancetype([[UIImage alloc] initWithCGImage: cgImage]));
  }
}

NAN_METHOD(NUIImage::initWithCGImageScaleOrientation) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGImageRef, cgImage);
    declare_value(CGFloat, scale);
    declare_value(UIImageOrientation, orientation);
    JS_SET_RETURN(js_value_instancetype([[UIImage alloc] initWithCGImage: cgImage scale: scale orientation: orientation]));
  }
}

NAN_METHOD(NUIImage::initWithCIImage) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CIImage, ciImage);
    JS_SET_RETURN(js_value_instancetype([[UIImage alloc] initWithCIImage: ciImage]));
  }
}

NAN_METHOD(NUIImage::initWithCIImageScaleOrientation) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CIImage, ciImage);
    declare_value(CGFloat, scale);
    declare_value(UIImageOrientation, orientation);
    JS_SET_RETURN(js_value_instancetype([[UIImage alloc] initWithCIImage: ciImage scale: scale orientation: orientation]));
  }
}

NAN_METHOD(NUIImage::drawAtPoint) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    [self drawAtPoint: point];
  }
}

NAN_METHOD(NUIImage::drawAtPointBlendModeAlpha) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_value(CGBlendMode, blendMode);
    declare_value(CGFloat, alpha);
    [self drawAtPoint: point blendMode: blendMode alpha: alpha];
  }
}

NAN_METHOD(NUIImage::drawInRect) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    [self drawInRect: rect];
  }
}

NAN_METHOD(NUIImage::drawInRectBlendModeAlpha) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    declare_value(CGBlendMode, blendMode);
    declare_value(CGFloat, alpha);
    [self drawInRect: rect blendMode: blendMode alpha: alpha];
  }
}

NAN_METHOD(NUIImage::drawAsPatternInRect) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    [self drawAsPatternInRect: rect];
  }
}

NAN_METHOD(NUIImage::resizableImageWithCapInsets) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIEdgeInsets, capInsets);
    JS_SET_RETURN(js_value_UIImage([self resizableImageWithCapInsets: capInsets]));
  }
}

NAN_METHOD(NUIImage::resizableImageWithCapInsetsResizingMode) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIEdgeInsets, capInsets);
    declare_value(UIImageResizingMode, resizingMode);
    JS_SET_RETURN(js_value_UIImage([self resizableImageWithCapInsets: capInsets resizingMode: resizingMode]));
  }
}

NAN_METHOD(NUIImage::imageWithAlignmentRectInsets) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIEdgeInsets, alignmentInsets);
    JS_SET_RETURN(js_value_UIImage([self imageWithAlignmentRectInsets: alignmentInsets]));
  }
}

NAN_METHOD(NUIImage::imageWithRenderingMode) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIImageRenderingMode, renderingMode);
    JS_SET_RETURN(js_value_UIImage([self imageWithRenderingMode: renderingMode]));
  }
}

NAN_METHOD(NUIImage::imageFlippedForRightToLeftLayoutDirection) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self imageFlippedForRightToLeftLayoutDirection]));
  }
}

NAN_METHOD(NUIImage::imageWithHorizontallyFlippedOrientation) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self imageWithHorizontallyFlippedOrientation]));
  }
}

NAN_METHOD(NUIImage::stretchableImageWithLeftCapWidthTopCapHeight) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, leftCapWidth);
    declare_value(NSInteger, topCapHeight);
    JS_SET_RETURN(js_value_UIImage([self stretchableImageWithLeftCapWidth: leftCapWidth topCapHeight: topCapHeight]));
  }
}

#if 0
NAN_METHOD(NCIImage::initWithImage) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIImage, image);
    JS_SET_RETURN(js_value_instancetype([CIImage initWithImage: image]));
  }
}

NAN_METHOD(NCIImage::initWithImageOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIImage, image);
    declare_nullable_pointer(NSDictionary/* <CIImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([CIImage initWithImage: image options: options]));
  }
}
#endif

NAN_GETTER(NUIImage::sizeGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self size]));
  }
}

NAN_GETTER(NUIImage::CGImageGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGImageRef([self CGImage]));
  }
}

NAN_GETTER(NUIImage::CIImageGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIImage([self CIImage]));
  }
}

NAN_GETTER(NUIImage::imageOrientationGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImageOrientation([self imageOrientation]));
  }
}

NAN_GETTER(NUIImage::scaleGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self scale]));
  }
}

NAN_GETTER(NUIImage::imagesGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIImage*>([self images]));
  }
}

NAN_GETTER(NUIImage::durationGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self duration]));
  }
}

NAN_GETTER(NUIImage::capInsetsGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIEdgeInsets([self capInsets]));
  }
}

NAN_GETTER(NUIImage::resizingModeGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImageResizingMode([self resizingMode]));
  }
}

NAN_GETTER(NUIImage::alignmentRectInsetsGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIEdgeInsets([self alignmentRectInsets]));
  }
}

NAN_GETTER(NUIImage::renderingModeGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImageRenderingMode([self renderingMode]));
  }
}

#include "NUIGraphicsImageRendererFormat.h"

NAN_GETTER(NUIImage::imageRendererFormatGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIGraphicsImageRendererFormat([self imageRendererFormat]));
  }
}

#include "NUITraitCollection.h"

NAN_GETTER(NUIImage::traitCollectionGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITraitCollection([self traitCollection]));
  }
}

#include "NUIImageAsset.h"

NAN_GETTER(NUIImage::imageAssetGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImageAsset([self imageAsset]));
  }
}

NAN_GETTER(NUIImage::flipsForRightToLeftLayoutDirectionGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self flipsForRightToLeftLayoutDirection]));
  }
}

NAN_GETTER(NUIImage::leftCapWidthGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self leftCapWidth]));
  }
}

NAN_GETTER(NUIImage::topCapHeightGetter) {
  JS_UNWRAP(UIImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self topCapHeight]));
  }
}

