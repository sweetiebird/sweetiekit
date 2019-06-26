//
//  NCAAction.h
//
//  Created by Shawn Presser on 6/25/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCAAction_h
#define NCAAction_h    

#include "NNSObject.h"

#define js_value_CAAction(x) js_protocol_wrapper(x, CAAction)
#define to_value_CAAction(x) to_protocol_wrapper(x, CAAction)
#define is_value_CAAction(x) is_protocol_wrapper(x, CAAction)

JS_WRAP_PROTOCOL(CAAction, NSObject);
  JS_PROP(runActionForKeyObjectArguments);
JS_WRAP_PROTOCOL_END(CAAction, NSObject);

#if __OBJC__
@interface CAActionType : NSObject<CAAction>

/* Called to trigger the event named 'path' on the receiver. The object
 * (e.g. the layer) on which the event happened is 'anObject'. The
 * arguments dictionary may be nil, if non-nil it carries parameters
 * associated with the event. */

- (void)runActionForKey:(NSString * _Null_unspecified)event object:(id _Null_unspecified)anObject
    arguments:(nullable NSDictionary *)dict;

@end
#endif

#endif /* NCAAction_h */
