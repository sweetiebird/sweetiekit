//
//  NMTLCompileOptions.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLCompileOptions_h
#define NMTLCompileOptions_h    

#include "NNSObject.h"

#define js_value_MTLCompileOptions(x) js_value_wrapper(x, MTLCompileOptions)
#define to_value_MTLCompileOptions(x) to_value_wrapper(x, MTLCompileOptions)
#define is_value_MTLCompileOptions(x) is_value_wrapper(x, MTLCompileOptions)

JS_WRAP_CLASS(MTLCompileOptions, NSObject);
  JS_PROP(preprocessorMacros);
  JS_PROP(fastMathEnabled);
  JS_PROP(languageVersion);
JS_WRAP_CLASS_END(MTLCompileOptions);

#endif /* NMTLCompileOptions_h */
