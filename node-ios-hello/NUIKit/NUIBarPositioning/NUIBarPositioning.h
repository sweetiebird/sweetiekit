//
//  NUIBarPositioning.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIBarPositioning_h
#define NUIBarPositioning_h    

#include "NNSObject.h"

#define js_value_UIBarPositioning(x) js_protocol_wrapper(x, UIBarPositioning)
#define to_value_UIBarPositioning(x) to_protocol_wrapper(x, UIBarPositioning)
#define is_value_UIBarPositioning(x) is_protocol_wrapper(x, UIBarPositioning)

JS_WRAP_PROTOCOL(UIBarPositioning, NSObject);
  JS_PROP_READONLY(barPosition);
JS_WRAP_PROTOCOL_END(UIBarPositioning, NSObject);

#if __OBJC__
@interface UIBarPositioningType : NSObject<UIBarPositioning>

@property(nonatomic,readonly) UIBarPosition barPosition;

@end
#endif

#endif /* NUIBarPositioning_h */
