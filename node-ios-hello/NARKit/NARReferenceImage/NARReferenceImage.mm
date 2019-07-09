//
//  NARReferenceImage.mm
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARReferenceImage.h"

#ifdef __IPHONEOS__

#define instancetype ARReferenceImage
#define js_value_instancetype js_value_ARReferenceImage

NARReferenceImage::NARReferenceImage() {}
NARReferenceImage::~NARReferenceImage() {}

JS_INIT_CLASS(ARReferenceImage, NSObject);
  JS_ASSIGN_STATIC_METHOD(referenceImagesInGroupNamedBundle);
  JS_ASSIGN_PROTO_METHOD(initWithCGImageOrientationPhysicalWidth);
  JS_ASSIGN_PROTO_METHOD(initWithPixelBufferOrientationPhysicalWidth);
  JS_ASSIGN_PROTO_PROP(name);
  JS_ASSIGN_PROTO_PROP_READONLY(physicalSize);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARReferenceImage, NSObject);
  // constant values (exports)
  
  
  /* Possible int values for kCGImagePropertyTIFFOrientation */

  //typedef CF_ENUM(uint32_t, CGImagePropertyOrientation) {
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationUp, uint32_t); //  = 1,        // 0th row at top,    0th column on left   - default orientation
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationUpMirrored, uint32_t); // ,    // 0th row at top,    0th column on right  - horizontal flip
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationDown, uint32_t); // ,          // 0th row at bottom, 0th column on right  - 180 deg rotation
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationDownMirrored, uint32_t); // ,  // 0th row at bottom, 0th column on left   - vertical flip
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationLeftMirrored, uint32_t); // ,  // 0th row on left,   0th column at top
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationRight, uint32_t); // ,         // 0th row on right,  0th column at top    - 90 deg CW
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationRightMirrored, uint32_t); // , // 0th row on right,  0th column on bottom
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationLeft, uint32_t); //            // 0th row on left,   0th column at bottom - 90 deg CCW
  //};

JS_INIT_CLASS_END(ARReferenceImage, NSObject);

NAN_METHOD(NARReferenceImage::New) {
  JS_RECONSTRUCT(ARReferenceImage);
  @autoreleasepool {
    ARReferenceImage* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARReferenceImage *)(info[0].As<External>()->Value());
    }
    if (self) {
      NARReferenceImage *wrapper = new NARReferenceImage();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARReferenceImage::New: invalid arguments");
    }
  }
}

#include "NNSBundle.h"
#include "NARReferenceImage.h"

NAN_METHOD(NARReferenceImage::referenceImagesInGroupNamedBundle) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_nullable_pointer(NSBundle, bundle);
    JS_SET_RETURN(js_value_NSSet/* <ARReferenceImage*>*/([ARReferenceImage referenceImagesInGroupNamed: name bundle: bundle]));
  }
}

NAN_METHOD(NARReferenceImage::initWithCGImageOrientationPhysicalWidth) {
  JS_UNWRAP_OR_ALLOC(ARReferenceImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGImageRef, image);
    declare_value(CGImagePropertyOrientation, orientation);
    declare_value(CGFloat, physicalWidth);
    JS_SET_RETURN(js_value_instancetype([self initWithCGImage: image orientation: orientation physicalWidth: physicalWidth]));
  }
}

NAN_METHOD(NARReferenceImage::initWithPixelBufferOrientationPhysicalWidth) {
  JS_UNWRAP_OR_ALLOC(ARReferenceImage, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CVPixelBufferRef, pixelBuffer);
    declare_value(CGImagePropertyOrientation, orientation);
    declare_value(CGFloat, physicalWidth);
    JS_SET_RETURN(js_value_instancetype([self initWithPixelBuffer: pixelBuffer orientation: orientation physicalWidth: physicalWidth]));
  }
}

NAN_GETTER(NARReferenceImage::nameGetter) {
  JS_UNWRAP(ARReferenceImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NARReferenceImage::nameSetter) {
  JS_UNWRAP(ARReferenceImage, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}

NAN_GETTER(NARReferenceImage::physicalSizeGetter) {
  JS_UNWRAP(ARReferenceImage, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self physicalSize]));
  }
}

#endif
