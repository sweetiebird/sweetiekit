//
//  NCIFilter.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCIFilter_h
#define NCIFilter_h    

#include "NNSObject.h"

#define js_value_CIFilter(x) js_value_wrapper(x, CIFilter)
#define to_value_CIFilter(x) to_value_wrapper(x, CIFilter)
#define is_value_CIFilter(x) is_value_wrapper(x, CIFilter)

JS_WRAP_CLASS(CIFilter, NSObject);
  // TODO: declare CIFilter methods and properties
JS_WRAP_CLASS_END(CIFilter);

#endif /* NCIFilter_h */