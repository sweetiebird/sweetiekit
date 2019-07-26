//
//  NIOHIDManager.h
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NIOHIDManager_h
#define NIOHIDManager_h    

#include "NNSObject.h"

#include "NCFBase.h"

#define js_value_IOHIDManagerRef(x) js_value_bridged_type(x, IOHIDManagerRef, id)
#define to_value_IOHIDManagerRef(x) to_value_bridged_type(x, IOHIDManagerRef, id)
#define is_value_IOHIDManagerRef(x) is_value_bridged_type(x, IOHIDManagerRef, id)

// TODO: move this to IOKit/NIOTypes.h
//typedef UInt32          IOOptionBits;
#define js_value_IOOptionBits js_value_uint32_t
#define to_value_IOOptionBits to_value_uint32_t
#define is_value_IOOptionBits is_value_uint32_t

//typedef uint32_t IOHIDOptionsType;
#define js_value_IOHIDOptionsType js_value_uint32_t
#define to_value_IOHIDOptionsType to_value_uint32_t
#define is_value_IOHIDOptionsType is_value_uint32_t

JS_WRAP_GLOBALS(IOHIDManager);
JS_WRAP_GLOBALS_END(IOHIDManager);

#endif /* NIOHIDManager_h */
