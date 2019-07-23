//
//  NCMAttachment.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCMAttachment.h"

#include "NCFBase.h"
#include "NCVImageBuffer.h"

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

NAN_METHOD(CMCopyDictionaryOfAttachments) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CFAllocatorRef, allocator);
    declare_value(CMAttachmentBearerRef, target);
    declare_value(CMAttachmentMode, attachmentMode);
    js_return_value(CVImageBufferRef, ::CMCopyDictionaryOfAttachments(allocator, target, attachmentMode));
  }
}

JS_INIT_GLOBALS(CMAttachment);
  // global values (exports)
  JS_ASSIGN_GLOBAL_METHOD(CMGetAttachment);
  JS_ASSIGN_GLOBAL_METHOD(CMCopyDictionaryOfAttachments);

  // The attachment modes are the same as those defined in CVBuffer.h.
  ////typedef uint32_t CMAttachmentMode API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));
  //#if COREMEDIA_USE_DERIVED_ENUMS_FOR_CONSTANTS
  //enum : CMAttachmentMode
  //#else
  //enum
  //#endif
  //{
    JS_ASSIGN_ENUM(kCMAttachmentMode_ShouldNotPropagate, uint32_t); //     = 0,
    JS_ASSIGN_ENUM(kCMAttachmentMode_ShouldPropagate, uint32_t); //        = 1
  //} API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));

JS_INIT_GLOBALS_END(CMAttachment);
