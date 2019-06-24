//
//  NCIColorKernel.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCIColorKernel_h
#define NCIColorKernel_h    

#include "NCIKernel.h"

#define js_value_CIColorKernel(x) js_value_wrapper(x, CIColorKernel)
#define to_value_CIColorKernel(x) to_value_wrapper(x, CIColorKernel)
#define is_value_CIColorKernel(x) is_value_wrapper(x, CIColorKernel)

JS_WRAP_CLASS(CIColorKernel, CIKernel);
  JS_STATIC_METHOD(kernelWithString);
  JS_METHOD(applyWithExtentArguments);
JS_WRAP_CLASS_END(CIColorKernel);

#endif /* NCIColorKernel_h */
