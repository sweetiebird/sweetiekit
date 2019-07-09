//
//  NCMSync.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCMSync_h
#define NCMSync_h    

#include "NNSObject.h"

#define js_value_CMClockRef(x) js_value_bridged(x, CMClockRef)
#define to_value_CMClockRef(x) to_value_bridged(x, CMClockRef)
#define is_value_CMClockRef(x) is_value_bridged(x, CMClockRef)

JS_WRAP_GLOBALS(CMSync);
JS_WRAP_GLOBALS_END(CMSync);

#endif /* NCMSync_h */
