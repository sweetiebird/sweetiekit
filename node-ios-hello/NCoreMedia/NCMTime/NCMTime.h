//
//  NCMTime.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCMTime_h
#define NCMTime_h    

#include "NNSObject.h"

#define js_value_CMTimeValue js_value_int64_t
#define to_value_CMTimeValue to_value_int64_t
#define is_value_CMTimeValue is_value_int64_t

#define js_value_CMTimeScale js_value_int32_t
#define to_value_CMTimeScale to_value_int32_t
#define is_value_CMTimeScale is_value_int32_t

#define js_value_CMTimeEpoch js_value_int64_t
#define to_value_CMTimeEpoch to_value_int64_t
#define is_value_CMTimeEpoch is_value_int64_t

#define js_value_CMTimeFlags(x) JS_OPTS(CMTimeFlags, uint32_t, x)
#define to_value_CMTimeFlags(x) TO_OPTS(CMTimeFlags, uint32_t, x)
#define is_value_CMTimeFlags(x) IS_OPTS(CMTimeFlags, uint32_t, x)

JS_DECLARE_STRUCT(CMTime);

JS_WRAP_GLOBALS(CMTime);
JS_WRAP_GLOBALS_END(CMTime);

#endif /* NCMTime_h */
