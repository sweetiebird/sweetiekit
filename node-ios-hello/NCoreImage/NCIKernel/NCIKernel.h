//
//  NCIKernel.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCIKernel_h
#define NCIKernel_h    

#include "NNSObject.h"

#define js_value_CIKernel(x) js_value_wrapper(x, CIKernel)
#define to_value_CIKernel(x) to_value_wrapper(x, CIKernel)
#define is_value_CIKernel(x) is_value_wrapper(x, CIKernel)

JS_WRAP_CLASS(CIKernel, NSObject);
  // TODO: declare CIKernel methods and properties
JS_WRAP_CLASS_END(CIKernel);

#endif /* NCIKernel_h */