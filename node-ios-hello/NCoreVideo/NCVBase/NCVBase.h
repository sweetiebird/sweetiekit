//
//  NCVBase.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCVBase_h
#define NCVBase_h    

#include "NNSObject.h"

#define js_value_CVOptionFlags js_value_uint64_t
#define to_value_CVOptionFlags to_value_uint64_t
#define is_value_CVOptionFlags is_value_uint64_t

JS_WRAP_GLOBALS(CVBase);
JS_WRAP_GLOBALS_END(CVBase);

#endif /* NCVBase_h */
