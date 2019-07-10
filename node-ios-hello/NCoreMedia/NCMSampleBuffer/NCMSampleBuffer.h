//
//  NCMSampleBuffer.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCMSampleBuffer_h
#define NCMSampleBuffer_h    

#include "NNSObject.h"

#define js_value_CMSampleBufferRef(x) js_value_bridged(x, CMSampleBufferRef)
#define to_value_CMSampleBufferRef(x) to_value_bridged(x, CMSampleBufferRef)
#define is_value_CMSampleBufferRef(x) is_value_bridged(x, CMSampleBufferRef)

JS_WRAP_GLOBALS(CMSampleBuffer);
JS_WRAP_GLOBALS_END(CMSampleBuffer);

#endif /* NCMSampleBuffer_h */
