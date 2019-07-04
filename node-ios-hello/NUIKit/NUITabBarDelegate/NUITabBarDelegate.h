//
//  NUITabBarDelegate.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITabBarDelegate_h
#define NUITabBarDelegate_h    

#include "NNSObject.h"

#define js_value_UITabBarDelegate(x) js_protocol_wrapper(x, UITabBarDelegate)
#define to_value_UITabBarDelegate(x) to_protocol_wrapper(x, UITabBarDelegate)
#define is_value_UITabBarDelegate(x) is_protocol_wrapper(x, UITabBarDelegate)

JS_WRAP_PROTOCOL(UITabBarDelegate, NSObject);
  JS_PROP(tabBarDidSelectItem);
  JS_PROP(tabBarWillBeginCustomizingItems);
  JS_PROP(tabBarDidBeginCustomizingItems);
  JS_PROP(tabBarWillEndCustomizingItemsChanged);
  JS_PROP(tabBarDidEndCustomizingItemsChanged);
JS_WRAP_PROTOCOL_END(UITabBarDelegate, NSObject);

#if __OBJC__
@interface UITabBarDelegateType : NSObject<UITabBarDelegate>

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item; // called when a new view is selected by the user (but not programatically)

/* called when user shows or dismisses customize sheet. you can use the 'willEnd' to set up what appears underneath. 
 changed is YES if there was some change to which items are visible or which order they appear. If selectedItem is no longer visible, 
 it will be set to nil.
 */

- (void)tabBar:(UITabBar *)tabBar willBeginCustomizingItems:(NSArray<UITabBarItem *> *)items __TVOS_PROHIBITED;                     // called before customize sheet is shown. items is current item list
- (void)tabBar:(UITabBar *)tabBar didBeginCustomizingItems:(NSArray<UITabBarItem *> *)items __TVOS_PROHIBITED;                      // called after customize sheet is shown. items is current item list
- (void)tabBar:(UITabBar *)tabBar willEndCustomizingItems:(NSArray<UITabBarItem *> *)items changed:(BOOL)changed __TVOS_PROHIBITED; // called before customize sheet is hidden. items is new item list
- (void)tabBar:(UITabBar *)tabBar didEndCustomizingItems:(NSArray<UITabBarItem *> *)items changed:(BOOL)changed __TVOS_PROHIBITED;  // called after customize sheet is hidden. items is new item list

@end
#endif

#endif /* NUITabBarDelegate_h */
