//
//  NCFBase.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCFBase_h
#define NCFBase_h    

#include "NNSObject.h"

#define js_value_bridged_type(x, t, base) sweetiekit::GetWrapperFor((__bridge id)x, Nid::type)
#define to_value_bridged_type(x, t, base) (__bridge t)sweetiekit::GetValueFor(x)
#define is_value_bridged_type(x, t, base) JS_INSTANCEOF(x, Nid)

#define js_value_CFTypeRef(x) js_value_bridged_type(x, CFTypeRef, id)
#define to_value_CFTypeRef(x) to_value_bridged_type(x, CFTypeRef, id)
#define is_value_CFTypeRef(x) is_value_bridged_type(x, CFTypeRef, id)

#define js_value_CFStringRef(x) js_value_bridged_type(x, CFStringRef, NSString)
#define to_value_CFStringRef(x) to_value_bridged_type(x, CFStringRef, NSString)
#define is_value_CFStringRef(x) is_value_bridged_type(x, CFStringRef, NSString)

JS_WRAP_GLOBALS(CFBase);
JS_WRAP_GLOBALS_END(CFBase);

#endif /* NCFBase_h */
