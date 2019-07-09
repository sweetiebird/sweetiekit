//
//  NAVDateRangeMetadataGroup.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVDateRangeMetadataGroup_h
#define NAVDateRangeMetadataGroup_h    

#include "NAVMetadataGroup.h"

#define js_value_AVDateRangeMetadataGroup(x) js_value_wrapper(x, AVDateRangeMetadataGroup)
#define to_value_AVDateRangeMetadataGroup(x) to_value_wrapper(x, AVDateRangeMetadataGroup)
#define is_value_AVDateRangeMetadataGroup(x) is_value_wrapper(x, AVDateRangeMetadataGroup)

JS_WRAP_CLASS(AVDateRangeMetadataGroup, AVMetadataGroup);
  JS_METHOD(initWithItemsStartDateEndDate);
  JS_PROP_READONLY(startDate);
  JS_PROP_READONLY(endDate);
  JS_PROP_READONLY(items);
JS_WRAP_CLASS_END(AVDateRangeMetadataGroup);

#endif /* NAVDateRangeMetadataGroup_h */
