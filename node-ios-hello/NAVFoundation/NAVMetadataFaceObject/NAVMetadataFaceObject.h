//
//  NAVMetadataFaceObject.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVMetadataFaceObject_h
#define NAVMetadataFaceObject_h    

#include "NAVMetadataObject.h"

#define js_value_AVMetadataFaceObject(x) js_value_wrapper(x, AVMetadataFaceObject)
#define to_value_AVMetadataFaceObject(x) to_value_wrapper(x, AVMetadataFaceObject)
#define is_value_AVMetadataFaceObject(x) is_value_wrapper(x, AVMetadataFaceObject)

JS_WRAP_CLASS(AVMetadataFaceObject, AVMetadataObject);
  // TODO: declare AVMetadataFaceObject methods and properties
JS_WRAP_CLASS_END(AVMetadataFaceObject);

#endif /* NAVMetadataFaceObject_h */