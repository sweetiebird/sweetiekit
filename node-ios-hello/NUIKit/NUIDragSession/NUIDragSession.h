//
//  NUIDragSession.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIDragSession_h
#define NUIDragSession_h    

#include "NUIDragDropSession.h"

#define js_value_UIDragSession(x) js_protocol_wrapper(x, UIDragSession)
#define to_value_UIDragSession(x) to_protocol_wrapper(x, UIDragSession)
#define is_value_UIDragSession(x) is_protocol_wrapper(x, UIDragSession)

JS_WRAP_PROTOCOL(UIDragSession, UIDragDropSession);
  JS_PROP(localContext);
JS_WRAP_PROTOCOL_END(UIDragSession, UIDragDropSession);

#if __OBJC__
@interface UIDragSessionType : UIDragDropSessionType<UIDragSession>

/* Use `localContext` to attach additional information to this drag session,
 * visible only inside the app that started the drag.
 */
@property (nonatomic, strong, nullable) id localContext;

@end
#endif

#endif /* NUIDragSession_h */
