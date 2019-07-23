//
//  NCMAttachment.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCMAttachment_h
#define NCMAttachment_h    

#include "NCFBase.h"

#define js_value_CMAttachmentBearerRef(x) js_value_bridged_type(x, CMAttachmentBearerRef, CFType)
#define to_value_CMAttachmentBearerRef(x) to_value_bridged_type(x, CMAttachmentBearerRef, CFType)
#define is_value_CMAttachmentBearerRef(x) is_value_bridged_type(x, CMAttachmentBearerRef, CFType)

#define js_value_CMAttachmentMode js_value_uint32_t
#define to_value_CMAttachmentMode to_value_uint32_t
#define is_value_CMAttachmentMode is_value_uint32_t

JS_WRAP_GLOBALS(CMAttachment);
JS_WRAP_GLOBALS_END(CMAttachment);

#endif /* NCMAttachment_h */
