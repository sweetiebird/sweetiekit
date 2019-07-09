//
//  NAVMutableTimedMetadataGroup.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVMutableTimedMetadataGroup_h
#define NAVMutableTimedMetadataGroup_h    

#include "NAVTimedMetadataGroup.h"

#define js_value_AVMutableTimedMetadataGroup(x) js_value_wrapper(x, AVMutableTimedMetadataGroup)
#define to_value_AVMutableTimedMetadataGroup(x) to_value_wrapper(x, AVMutableTimedMetadataGroup)
#define is_value_AVMutableTimedMetadataGroup(x) is_value_wrapper(x, AVMutableTimedMetadataGroup)

JS_WRAP_CLASS(AVMutableTimedMetadataGroup, AVTimedMetadataGroup);
  JS_PROP(timeRange);
  JS_PROP(items);
JS_WRAP_CLASS_END(AVMutableTimedMetadataGroup);

#endif /* NAVMutableTimedMetadataGroup_h */
