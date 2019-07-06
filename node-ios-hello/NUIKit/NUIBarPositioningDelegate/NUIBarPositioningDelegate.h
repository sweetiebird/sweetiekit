//
//  NUIBarPositioningDelegate.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIBarPositioningDelegate_h
#define NUIBarPositioningDelegate_h    

#include "NNSObject.h"

#define js_value_UIBarPositioningDelegate(x) js_protocol_wrapper(x, UIBarPositioningDelegate)
#define to_value_UIBarPositioningDelegate(x) to_protocol_wrapper(x, UIBarPositioningDelegate)
#define is_value_UIBarPositioningDelegate(x) is_protocol_wrapper(x, UIBarPositioningDelegate)

JS_WRAP_PROTOCOL(UIBarPositioningDelegate, NSObject);
  JS_PROP(positionForBar);
JS_WRAP_PROTOCOL_END(UIBarPositioningDelegate, NSObject);

#if __OBJC__
@interface UIBarPositioningDelegateType : NSObject<UIBarPositioningDelegate>

/* Implement this method on your manual bar delegate when not managed by a UIKit controller.
 UINavigationBar and UISearchBar default to UIBarPositionTop, UIToolbar defaults to UIBarPositionBottom.
 This message will be sent when the bar moves to a window.
 */
- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar;

@end
#endif

#endif /* NUIBarPositioningDelegate_h */
