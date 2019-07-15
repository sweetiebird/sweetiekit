//
//  NARCollaborationData.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARCollaborationData_h
#define NARCollaborationData_h    

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

#include "NNSObject.h"

#define js_value_ARCollaborationDataPriority(x) JS_ENUM(ARCollaborationDataPriority, NSInteger, x)
#define to_value_ARCollaborationDataPriority(x) TO_ENUM(ARCollaborationDataPriority, NSInteger, x)
#define is_value_ARCollaborationDataPriority(x) IS_ENUM(ARCollaborationDataPriority, NSInteger, x)

#define js_value_ARCollaborationData(x) js_value_wrapper(x, ARCollaborationData)
#define to_value_ARCollaborationData(x) to_value_wrapper(x, ARCollaborationData)
#define is_value_ARCollaborationData(x) is_value_wrapper(x, ARCollaborationData)

JS_WRAP_CLASS(ARCollaborationData, NSObject);
  JS_PROP_READONLY(priority);
JS_WRAP_CLASS_END(ARCollaborationData);

#endif

#endif /* NARCollaborationData_h */
