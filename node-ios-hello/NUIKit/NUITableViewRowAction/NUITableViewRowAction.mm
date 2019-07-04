//
//  NUITableViewRowAction.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewRowAction.h"

#define instancetype UITableViewRowAction
#define js_value_instancetype js_value_UITableViewRowAction

NUITableViewRowAction::NUITableViewRowAction() {}
NUITableViewRowAction::~NUITableViewRowAction() {}

JS_INIT_CLASS(UITableViewRowAction, NSObject);
  JS_ASSIGN_STATIC_METHOD(rowActionWithStyleTitleHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(style);
  JS_ASSIGN_PROTO_PROP(title);
  JS_ASSIGN_PROTO_PROP(backgroundColor);
  JS_ASSIGN_PROTO_PROP(backgroundEffect);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewRowAction, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UITableViewRowAction, NSObject);

NAN_METHOD(NUITableViewRowAction::New) {
  JS_RECONSTRUCT(UITableViewRowAction);
  @autoreleasepool {
    UITableViewRowAction* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITableViewRowAction *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITableViewRowAction alloc] init];
    }
    if (self) {
      NUITableViewRowAction *wrapper = new NUITableViewRowAction();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableViewRowAction::New: invalid arguments");
    }
  }
}

#include "NUITableView.h"

NAN_METHOD(NUITableViewRowAction::rowActionWithStyleTitleHandler) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UITableViewRowActionStyle, style);
    declare_nullable_pointer(NSString, title);
    declare_callback(handler);
    JS_SET_RETURN(js_value_instancetype([UITableViewRowAction rowActionWithStyle: style title: title handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
      dispatch_main(^{
        if (handler) {
          [handler jsFunction]->Call("NUITableViewRowAction::rowActionWithStyleTitleHandler",
            js_value_UITableViewRowAction(action),
            js_value_NSIndexPath(indexPath));
        }
      });
    }]));
  }
}

NAN_GETTER(NUITableViewRowAction::styleGetter) {
  JS_UNWRAP(UITableViewRowAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableViewRowActionStyle([self style]));
  }
}

NAN_GETTER(NUITableViewRowAction::titleGetter) {
  JS_UNWRAP(UITableViewRowAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self title]));
  }
}

NAN_SETTER(NUITableViewRowAction::titleSetter) {
  JS_UNWRAP(UITableViewRowAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setTitle: input];
  }
}

NAN_GETTER(NUITableViewRowAction::backgroundColorGetter) {
  JS_UNWRAP(UITableViewRowAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self backgroundColor]));
  }
}

NAN_SETTER(NUITableViewRowAction::backgroundColorSetter) {
  JS_UNWRAP(UITableViewRowAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setBackgroundColor: input];
  }
}

#include "NUIVisualEffect.h"

NAN_GETTER(NUITableViewRowAction::backgroundEffectGetter) {
  JS_UNWRAP(UITableViewRowAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIVisualEffect([self backgroundEffect]));
  }
}

NAN_SETTER(NUITableViewRowAction::backgroundEffectSetter) {
  JS_UNWRAP(UITableViewRowAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIVisualEffect, input);
    [self setBackgroundEffect: input];
  }
}
