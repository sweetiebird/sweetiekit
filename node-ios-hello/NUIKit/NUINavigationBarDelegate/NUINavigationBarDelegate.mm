//
//  NUINavigationBarDelegate.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUINavigationBarDelegate.h"

#define instancetype UINavigationBarDelegate
#define js_value_instancetype js_value_UINavigationBarDelegate

NUINavigationBarDelegate::NUINavigationBarDelegate() {}
NUINavigationBarDelegate::~NUINavigationBarDelegate() {}

JS_INIT_PROTOCOL(UINavigationBarDelegate, UIBarPositioningDelegate);
  JS_ASSIGN_PROTO_PROP(navigationBarShouldPushItem);
  JS_ASSIGN_PROTO_PROP(navigationBarDidPushItem);
  JS_ASSIGN_PROTO_PROP(navigationBarShouldPopItem);
  JS_ASSIGN_PROTO_PROP(navigationBarDidPopItem);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UINavigationBarDelegate, UIBarPositioningDelegate);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UINavigationBarDelegate, UIBarPositioningDelegate);

NAN_METHOD(NUINavigationBarDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(UINavigationBarDelegate);
  @autoreleasepool {
    id<UINavigationBarDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UINavigationBarDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UINavigationBarDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UINavigationBarDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UINavigationBarDelegateType alloc] init];
    }
    if (self) {
      NUINavigationBarDelegate *wrapper = new NUINavigationBarDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UINavigationBarDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(UINavigationBarDelegate, navigationBarShouldPushItem);
DELEGATE_PROTOCOL_PROP(UINavigationBarDelegate, navigationBarDidPushItem);
DELEGATE_PROTOCOL_PROP(UINavigationBarDelegate, navigationBarShouldPopItem);
DELEGATE_PROTOCOL_PROP(UINavigationBarDelegate, navigationBarDidPopItem);

#include "NUINavigationBar.h"
#include "NUINavigationItem.h"

@implementation UINavigationBarDelegateType

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item  // called to push. return NO not to.
{
  __block BOOL result = YES;
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, navigationBarShouldPushItem,
    js_value_UINavigationBar(navigationBar),
    js_value_UINavigationItem(item));
  return result;
}

- (void)navigationBar:(UINavigationBar *)navigationBar didPushItem:(UINavigationItem *)item     // called at end of animation of push or immediately if not animated
{
  call_delegate_async(noop(), navigationBarDidPushItem,
    js_value_UINavigationBar(navigationBar),
    js_value_UINavigationItem(item));
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item   // same as push methods
{
  __block BOOL result = YES;
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, navigationBarShouldPopItem,
    js_value_UINavigationBar(navigationBar),
    js_value_UINavigationItem(item));
  return result;
}

- (void)navigationBar:(UINavigationBar *)navigationBar didPopItem:(UINavigationItem *)item
{
  call_delegate_async(noop(), navigationBarDidPopItem,
    js_value_UINavigationBar(navigationBar),
    js_value_UINavigationItem(item));
}

@end
