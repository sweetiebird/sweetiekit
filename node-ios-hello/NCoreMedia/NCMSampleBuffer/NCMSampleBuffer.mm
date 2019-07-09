//
//  NCMSampleBuffer.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCMSampleBuffer.h"

#include "NCVImageBuffer.h"

#define js_return_value(type, x) JS_SET_RETURN(js_value_##type(x)) // TODO: move this to defines.h

NAN_METHOD(CMSampleBufferGetImageBuffer) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CMSampleBufferRef, sbuf);
    js_return_value(CVImageBufferRef, ::CMSampleBufferGetImageBuffer(sbuf));
  }
}

JS_INIT_GLOBALS(CMSampleBuffer);
  // global values (exports)
  JS_ASSIGN_GLOBAL_METHOD(CMSampleBufferGetImageBuffer);
JS_INIT_GLOBALS_END(CMSampleBuffer);
