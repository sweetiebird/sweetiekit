//
//  NAVMetadataGroup.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVMetadataGroup_h
#define NAVMetadataGroup_h    

#include "NNSObject.h"

#define js_value_AVMetadataGroup(x) js_value_wrapper(x, AVMetadataGroup)
#define to_value_AVMetadataGroup(x) to_value_wrapper(x, AVMetadataGroup)
#define is_value_AVMetadataGroup(x) is_value_wrapper(x, AVMetadataGroup)

JS_WRAP_CLASS(AVMetadataGroup, NSObject);
  JS_PROP_READONLY(items);
  JS_PROP_READONLY(classifyingLabel);
  JS_PROP_READONLY(uniqueID);
JS_WRAP_CLASS_END(AVMetadataGroup);

#endif /* NAVMetadataGroup_h */
