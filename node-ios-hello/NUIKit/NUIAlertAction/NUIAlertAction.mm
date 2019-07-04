//
//  NUIAlertAction.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIAlertAction.h"

#define instancetype UIAlertAction
#define js_value_instancetype js_value_UIAlertAction

NUIAlertAction::NUIAlertAction() {}
NUIAlertAction::~NUIAlertAction() {}

JS_INIT_CLASS(UIAlertAction, NSObject);
  JS_ASSIGN_STATIC_METHOD(actionWithTitleStyleHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(title);
  JS_ASSIGN_PROTO_PROP_READONLY(style);
  JS_ASSIGN_PROTO_PROP(isEnabled);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIAlertAction, NSObject);
  // constants (exports)

  //typedef NS_ENUM(NSInteger, UIAlertActionStyle) {
    JS_ASSIGN_ENUM(UIAlertActionStyleDefault, NSInteger); //  = 0,
    JS_ASSIGN_ENUM(UIAlertActionStyleCancel, NSInteger);
    JS_ASSIGN_ENUM(UIAlertActionStyleDestructive, NSInteger);
  //} NS_ENUM_AVAILABLE_IOS(8_0);

JS_INIT_CLASS_END(UIAlertAction, NSObject);

NAN_METHOD(NUIAlertAction::New) {
  JS_RECONSTRUCT(UIAlertAction);
  @autoreleasepool {
    UIAlertAction* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UIAlertAction *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIAlertAction alloc] init];
    }
    if (self) {
      NUIAlertAction *wrapper = new NUIAlertAction();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIAlertAction::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIAlertAction::actionWithTitleStyleHandler) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, title);
    declare_value(UIAlertActionStyle, style);
    declare_callback(handler);
    JS_SET_RETURN(js_value_instancetype([UIAlertAction actionWithTitle: title style: style handler:^(UIAlertAction * _Nonnull action) {
      dispatch_main(^{
        if (handler) {
          [handler jsFunction]->Call("NUIAlertAction::actionWithTitleStyleHandler",
            js_value_UIAlertAction(action));
        }
      });
    }]));
  }
}

NAN_GETTER(NUIAlertAction::titleGetter) {
  JS_UNWRAP(UIAlertAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self title]));
  }
}

NAN_GETTER(NUIAlertAction::styleGetter) {
  JS_UNWRAP(UIAlertAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIAlertActionStyle([self style]));
  }
}

NAN_GETTER(NUIAlertAction::isEnabledGetter) {
  JS_UNWRAP(UIAlertAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEnabled]));
  }
}

NAN_SETTER(NUIAlertAction::isEnabledSetter) {
  JS_UNWRAP(UIAlertAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEnabled: input];
  }
}
