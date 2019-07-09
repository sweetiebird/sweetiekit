//
//  NCMAttachment.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCMAttachment.h"

#include "NCFBase.h"
#include "NCVImageBuffer.h"

#define js_return_value(type, x) JS_SET_RETURN(js_value_##type(x)) // TODO: move this to defines.h

NAN_METHOD(CMGetAttachment) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CMAttachmentBearerRef, target);
    declare_value(CFStringRef, key);
    declare_value_pointer(CMAttachmentMode, attachmentModeOut);
    js_return_value(CVImageBufferRef, ::CMGetAttachment(target, key, attachmentModeOut));
    if (attachmentModeOut) {
      attachmentModeOutObj->Set(JS_STR("value"), js_value_CMAttachmentMode(*attachmentModeOut));
    }
  }
}

JS_INIT_GLOBALS(CMAttachment);
  // global values (exports)
JS_INIT_GLOBALS_END(CMAttachment);
