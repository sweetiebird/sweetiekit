//
//  NCFDictionary.h
//
//  Created by Shawn Presser on 7/5/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCFDictionary_h
#define NCFDictionary_h    

#include "NNSObject.h"

#define js_value_CFDictionaryRef(x) js_value_bridged(x, CFDictionaryRef)
#define to_value_CFDictionaryRef(x) to_value_bridged(x, CFDictionaryRef)
#define is_value_CFDictionaryRef(x) is_value_bridged(x, CFDictionaryRef)

#define js_value_CFMutableDictionaryRef(x) js_value_bridged(x, CFMutableDictionaryRef)
#define to_value_CFMutableDictionaryRef(x) to_value_bridged(x, CFMutableDictionaryRef)
#define is_value_CFMutableDictionaryRef(x) is_value_bridged(x, CFMutableDictionaryRef)

JS_WRAP_GLOBALS(CFDictionary);
JS_WRAP_GLOBALS_END(CFDictionary);

#endif /* NCFDictionary_h */
