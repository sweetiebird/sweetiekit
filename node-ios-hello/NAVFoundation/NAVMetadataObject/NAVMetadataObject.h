//
//  NAVMetadataObject.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVMetadataObject_h
#define NAVMetadataObject_h    

#include "NNSObject.h"

#define js_value_AVMetadataObject(x) js_value_wrapper(x, AVMetadataObject)
#define to_value_AVMetadataObject(x) to_value_wrapper(x, AVMetadataObject)
#define is_value_AVMetadataObject(x) is_value_wrapper(x, AVMetadataObject)

JS_WRAP_CLASS(AVMetadataObject, NSObject);
  // TODO: declare AVMetadataObject methods and properties
JS_WRAP_CLASS_END(AVMetadataObject);

#endif /* NAVMetadataObject_h */