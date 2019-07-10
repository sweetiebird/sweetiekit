//
//  NARReferenceImage.h
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARReferenceImage_h
#define NARReferenceImage_h    

#if TARGET_OS_IPHONE

#include "NNSObject.h"

#define js_value_ARReferenceImage(x) js_value_wrapper(x, ARReferenceImage)
#define to_value_ARReferenceImage(x) to_value_wrapper(x, ARReferenceImage)
#define is_value_ARReferenceImage(x) is_value_wrapper(x, ARReferenceImage)

#define js_value_CGImagePropertyOrientation(x) JS_ENUM(CGImagePropertyOrientation, uint32_t, x)
#define to_value_CGImagePropertyOrientation(x) TO_ENUM(CGImagePropertyOrientation, uint32_t, x)
#define is_value_CGImagePropertyOrientation(x) IS_ENUM(CGImagePropertyOrientation, uint32_t, x)

JS_WRAP_CLASS(ARReferenceImage, NSObject);
  JS_STATIC_METHOD(referenceImagesInGroupNamedBundle);
  JS_METHOD(initWithCGImageOrientationPhysicalWidth);
  JS_METHOD(initWithPixelBufferOrientationPhysicalWidth);
  JS_PROP(name);
  JS_PROP_READONLY(physicalSize);
JS_WRAP_CLASS_END(ARReferenceImage);

#endif

#endif /* NARReferenceImage_h */
