//
//  NCFBase.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCFBase_h
#define NCFBase_h    

#include "NNSObject.h"

#define js_value_bridged_type(x, t, base) sweetiekit::GetWrapperFor((__bridge id)x)
#define to_value_bridged_type(x, t, base) (__bridge t)sweetiekit::GetValueFor(x)
#define is_value_bridged_type(x, t, base) JS_INSTANCEOF(x, N##base)

#define js_value_CFStringRef(x) js_value_bridged_type(x, CFStringRef, NSString)
#define to_value_CFStringRef(x) js_value_bridged_type(x, CFStringRef, NSString)
#define is_value_CFStringRef(x) js_value_bridged_type(x, CFStringRef, NSString)

JS_WRAP_GLOBALS(CFBase);
JS_WRAP_GLOBALS_END(CFBase);

#endif /* NCFBase_h */
