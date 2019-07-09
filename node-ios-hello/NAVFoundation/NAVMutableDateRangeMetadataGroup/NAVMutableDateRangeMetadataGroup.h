//
//  NAVMutableDateRangeMetadataGroup.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVMutableDateRangeMetadataGroup_h
#define NAVMutableDateRangeMetadataGroup_h    

#include "NAVDateRangeMetadataGroup.h"

#define js_value_AVMutableDateRangeMetadataGroup(x) js_value_wrapper(x, AVMutableDateRangeMetadataGroup)
#define to_value_AVMutableDateRangeMetadataGroup(x) to_value_wrapper(x, AVMutableDateRangeMetadataGroup)
#define is_value_AVMutableDateRangeMetadataGroup(x) is_value_wrapper(x, AVMutableDateRangeMetadataGroup)

JS_WRAP_CLASS(AVMutableDateRangeMetadataGroup, AVDateRangeMetadataGroup);
  JS_PROP(startDate);
  JS_PROP(endDate);
  JS_PROP(items);
JS_WRAP_CLASS_END(AVMutableDateRangeMetadataGroup);

#endif /* NAVMutableDateRangeMetadataGroup_h */
