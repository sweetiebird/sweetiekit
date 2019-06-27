//
//  NAudioComponent.h
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAudioComponent_h
#define NAudioComponent_h    

#include "NNSObject.h"

#define js_value_AudioComponentFlags(x) JS_ENUM(AudioComponentFlags, uint32_t, x)
#define to_value_AudioComponentFlags(x) TO_ENUM(AudioComponentFlags, uint32_t, x)
#define is_value_AudioComponentFlags(x) IS_ENUM(AudioComponentFlags, uint32_t, x)

#define js_value_AudioComponentInstantiationOptions(x) JS_OPTS(AudioComponentInstantiationOptions, uint32_t, x)
#define to_value_AudioComponentInstantiationOptions(x) TO_OPTS(AudioComponentInstantiationOptions, uint32_t, x)
#define is_value_AudioComponentInstantiationOptions(x) IS_OPTS(AudioComponentInstantiationOptions, uint32_t, x)

#if 0
/*
typedef struct AudioComponentDescription {
    OSType              componentType;
    OSType              componentSubType;
    OSType              componentManufacturer;
    UInt32              componentFlags;
    UInt32              componentFlagsMask;
} AudioComponentDescription;
*/
JS_DECLARE_STRUCT(AudioComponentDescription);
#endif

JS_WRAP_GLOBALS(AudioComponent);
  // TODO: declare AudioComponent globals
JS_WRAP_GLOBALS_END(AudioComponent);

#endif /* NAudioComponent_h */
