//
//  NUITabBarDelegate.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITabBarDelegate.h"

#define instancetype UITabBarDelegate
#define js_value_instancetype js_value_UITabBarDelegate

NUITabBarDelegate::NUITabBarDelegate() {}
NUITabBarDelegate::~NUITabBarDelegate() {}

JS_INIT_PROTOCOL(UITabBarDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(tabBarDidSelectItem);
  JS_ASSIGN_PROTO_PROP(tabBarWillBeginCustomizingItems);
  JS_ASSIGN_PROTO_PROP(tabBarDidBeginCustomizingItems);
  JS_ASSIGN_PROTO_PROP(tabBarWillEndCustomizingItemsChanged);
  JS_ASSIGN_PROTO_PROP(tabBarDidEndCustomizingItemsChanged);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITabBarDelegate, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UITabBarDelegate, NSObject);

NAN_METHOD(NUITabBarDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(UITabBarDelegate);
  @autoreleasepool {
    id<UITabBarDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UITabBarDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UITabBarDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UITabBarDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UITabBarDelegateType alloc] init];
    }
    if (self) {
      NUITabBarDelegate *wrapper = new NUITabBarDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITabBarDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(UITabBarDelegate, tabBarDidSelectItem);
DELEGATE_PROTOCOL_PROP(UITabBarDelegate, tabBarWillBeginCustomizingItems);
DELEGATE_PROTOCOL_PROP(UITabBarDelegate, tabBarDidBeginCustomizingItems);
DELEGATE_PROTOCOL_PROP(UITabBarDelegate, tabBarWillEndCustomizingItemsChanged);
DELEGATE_PROTOCOL_PROP(UITabBarDelegate, tabBarDidEndCustomizingItemsChanged);

#include "NUITabBar.h"
#include "NUITabBarItem.h"

@implementation UITabBarDelegateType

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item // called when a new view is selected by the user (but not programatically)
{
  call_delegate_async(noop(), tabBarDidSelectItem,
    js_value_UITabBar(tabBar),
    js_value_UITabBarItem(item));
}

/* called when user shows or dismisses customize sheet. you can use the 'willEnd' to set up what appears underneath. 
 changed is YES if there was some change to which items are visible or which order they appear. If selectedItem is no longer visible, 
 it will be set to nil.
 */

- (void)tabBar:(UITabBar *)tabBar willBeginCustomizingItems:(NSArray<UITabBarItem *> *)items __TVOS_PROHIBITED                      // called before customize sheet is shown. items is current item list
{
  call_delegate_async(noop(), tabBarWillBeginCustomizingItems,
    js_value_UITabBar(tabBar),
    js_value_NSArray<UITabBarItem *>(items));
}

- (void)tabBar:(UITabBar *)tabBar didBeginCustomizingItems:(NSArray<UITabBarItem *> *)items __TVOS_PROHIBITED                       // called after customize sheet is shown. items is current item list
{
  call_delegate_async(noop(), tabBarDidBeginCustomizingItems,
    js_value_UITabBar(tabBar),
    js_value_NSArray<UITabBarItem *>(items));
}

- (void)tabBar:(UITabBar *)tabBar willEndCustomizingItems:(NSArray<UITabBarItem *> *)items changed:(BOOL)changed __TVOS_PROHIBITED  // called before customize sheet is hidden. items is new item list
{
  call_delegate_async(noop(), tabBarWillEndCustomizingItemsChanged,
    js_value_UITabBar(tabBar),
    js_value_NSArray<UITabBarItem *>(items),
    js_value_BOOL(changed));
}

- (void)tabBar:(UITabBar *)tabBar didEndCustomizingItems:(NSArray<UITabBarItem *> *)items changed:(BOOL)changed __TVOS_PROHIBITED   // called after customize sheet is hidden. items is new item list
{
  call_delegate_async(noop(), tabBarDidEndCustomizingItemsChanged,
    js_value_UITabBar(tabBar),
    js_value_NSArray<UITabBarItem *>(items),
    js_value_BOOL(changed));
}

@end
