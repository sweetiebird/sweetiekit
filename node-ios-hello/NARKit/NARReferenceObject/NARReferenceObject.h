//
//  NARReferenceObject.h
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARReferenceObject_h
#define NARReferenceObject_h    

#include "NNSObject.h"

#if TARGET_OS_IPHONE

#define js_value_ARReferenceObject(x) js_value_wrapper(x, ARReferenceObject)
#define to_value_ARReferenceObject(x) to_value_wrapper(x, ARReferenceObject)
#define is_value_ARReferenceObject(x) is_value_wrapper(x, ARReferenceObject)

JS_WRAP_CLASS(ARReferenceObject, NSObject);
  JS_STATIC_METHOD(referenceObjectsInGroupNamedBundle);
  JS_METHOD(initWithArchiveURLError);
  JS_METHOD(exportObjectToURLPreviewImageError);
  JS_METHOD(referenceObjectByApplyingTransform);
  JS_METHOD(referenceObjectByMergingObjectError);
  JS_PROP(name);
  JS_PROP_READONLY(center);
  JS_PROP_READONLY(extent);
  JS_PROP_READONLY(scale);
  JS_PROP_READONLY(rawFeaturePoints);
JS_WRAP_CLASS_END(ARReferenceObject);

#endif

#endif /* NARReferenceObject_h */
