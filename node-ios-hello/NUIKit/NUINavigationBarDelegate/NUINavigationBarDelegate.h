//
//  NUINavigationBarDelegate.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUINavigationBarDelegate_h
#define NUINavigationBarDelegate_h    

#include "NUIBarPositioningDelegate.h"

#define js_value_UINavigationBarDelegate(x) js_protocol_wrapper(x, UINavigationBarDelegate)
#define to_value_UINavigationBarDelegate(x) to_protocol_wrapper(x, UINavigationBarDelegate)
#define is_value_UINavigationBarDelegate(x) is_protocol_wrapper(x, UINavigationBarDelegate)

JS_WRAP_PROTOCOL(UINavigationBarDelegate, UIBarPositioningDelegate);
  JS_PROP(navigationBarShouldPushItem);
  JS_PROP(navigationBarDidPushItem);
  JS_PROP(navigationBarShouldPopItem);
  JS_PROP(navigationBarDidPopItem);
JS_WRAP_PROTOCOL_END(UINavigationBarDelegate, UIBarPositioningDelegate);

#if __OBJC__
@interface UINavigationBarDelegateType : UIBarPositioningDelegateType<UINavigationBarDelegate>

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item; // called to push. return NO not to.
- (void)navigationBar:(UINavigationBar *)navigationBar didPushItem:(UINavigationItem *)item;    // called at end of animation of push or immediately if not animated
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item;  // same as push methods
- (void)navigationBar:(UINavigationBar *)navigationBar didPopItem:(UINavigationItem *)item;

@end
#endif

#endif /* NUINavigationBarDelegate_h */
