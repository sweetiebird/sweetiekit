//
//  NCIWarpKernel.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCIWarpKernel_h
#define NCIWarpKernel_h    

#include "NCIKernel.h"

#define js_value_CIWarpKernel(x) js_value_wrapper(x, CIWarpKernel)
#define to_value_CIWarpKernel(x) to_value_wrapper(x, CIWarpKernel)
#define is_value_CIWarpKernel(x) is_value_wrapper(x, CIWarpKernel)

JS_WRAP_CLASS(CIWarpKernel, CIKernel);
  JS_STATIC_METHOD(kernelWithString);
  JS_METHOD(applyWithExtentRoiCallbackInputImageArguments);
JS_WRAP_CLASS_END(CIWarpKernel);

#endif /* NCIWarpKernel_h */
