//
//  NUIBarPositioningDelegate.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIBarPositioningDelegate.h"

#define instancetype UIBarPositioningDelegate
#define js_value_instancetype js_value_UIBarPositioningDelegate

NUIBarPositioningDelegate::NUIBarPositioningDelegate() {}
NUIBarPositioningDelegate::~NUIBarPositioningDelegate() {}

JS_INIT_PROTOCOL(UIBarPositioningDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(positionForBar);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIBarPositioningDelegate, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UIBarPositioningDelegate, NSObject);


NAN_METHOD(NUIBarPositioningDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(UIBarPositioningDelegate);
  @autoreleasepool {
    id<UIBarPositioningDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UIBarPositioningDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UIBarPositioningDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UIBarPositioningDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UIBarPositioningDelegateType alloc] init];
    }
    if (self) {
      NUIBarPositioningDelegate *wrapper = new NUIBarPositioningDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIBarPositioningDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(UIBarPositioningDelegate, positionForBar);

#include "NUIBarPositioning.h"
#include "NUIBarCommon.h"

@implementation UIBarPositioningDelegateType

/* Implement this method on your manual bar delegate when not managed by a UIKit controller.
 UINavigationBar and UISearchBar default to UIBarPositionTop, UIToolbar defaults to UIBarPositionBottom.
 This message will be sent when the bar moves to a window.
 */
- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar
{
  __block UIBarPosition result = [bar isKindOfClass:[UIToolbar class]] ? UIBarPositionBottom : UIBarPositionTop;
  call_delegate(result = is_value_UIBarPosition(JS_RESULT) ? to_value_UIBarPosition(JS_RESULT) : result, positionForBar,
    js_value_UIBarPositioning(bar));
  return result;
}

@end
