//
//  NUIFocusAnimationContext.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIFocusAnimationContext_h
#define NUIFocusAnimationContext_h    

#include "NNSObject.h"

#define js_value_UIFocusAnimationContext(x) js_protocol_wrapper(x, UIFocusAnimationContext)
#define to_value_UIFocusAnimationContext(x) to_protocol_wrapper(x, UIFocusAnimationContext)
#define is_value_UIFocusAnimationContext(x) is_protocol_wrapper(x, UIFocusAnimationContext)

JS_WRAP_PROTOCOL(UIFocusAnimationContext, NSObject);
  JS_PROP_READONLY(duration);
JS_WRAP_PROTOCOL_END(UIFocusAnimationContext, NSObject);

#if __OBJC__
@interface UIFocusAnimationContextType : NSObject<UIFocusAnimationContext>

/// The duration of the main animations in seconds.
@property (nonatomic, readonly) NSTimeInterval duration;

@end
#endif

#endif /* NUIFocusAnimationContext_h */
