//
//  NAVTimedMetadataGroup.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVTimedMetadataGroup_h
#define NAVTimedMetadataGroup_h    

#include "NAVMetadataGroup.h"

#define js_value_AVTimedMetadataGroup(x) js_value_wrapper(x, AVTimedMetadataGroup)
#define to_value_AVTimedMetadataGroup(x) to_value_wrapper(x, AVTimedMetadataGroup)
#define is_value_AVTimedMetadataGroup(x) is_value_wrapper(x, AVTimedMetadataGroup)

JS_WRAP_CLASS(AVTimedMetadataGroup, AVMetadataGroup);
  JS_METHOD(initWithItemsTimeRange);
  JS_METHOD(initWithSampleBuffer);
  JS_METHOD(copyFormatDescription);
  JS_PROP_READONLY(timeRange);
  JS_PROP_READONLY(items);
JS_WRAP_CLASS_END(AVTimedMetadataGroup);

#endif /* NAVTimedMetadataGroup_h */
