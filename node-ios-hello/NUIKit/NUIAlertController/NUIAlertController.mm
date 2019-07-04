//
//  NUIAlertController.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIAlertController.h"

#define instancetype UIAlertController
#define js_value_instancetype js_value_UIAlertController

NUIAlertController::NUIAlertController() {}
NUIAlertController::~NUIAlertController() {}

JS_INIT_CLASS(UIAlertController, UIViewController);
  JS_ASSIGN_STATIC_METHOD(alertControllerWithTitleMessagePreferredStyle);
  JS_ASSIGN_PROTO_METHOD(addAction);
  JS_ASSIGN_PROTO_METHOD(addTextFieldWithConfigurationHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(actions);
  JS_ASSIGN_PROTO_PROP(preferredAction);
  JS_ASSIGN_PROTO_PROP_READONLY(textFields);
  JS_ASSIGN_PROTO_PROP(title);
  JS_ASSIGN_PROTO_PROP(message);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredStyle);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIAlertController, UIViewController);
  // constants (exports)

  //typedef NS_ENUM(NSInteger, UIAlertControllerStyle) {
    JS_ASSIGN_ENUM(UIAlertControllerStyleActionSheet, NSInteger); //  = 0,
    JS_ASSIGN_ENUM(UIAlertControllerStyleAlert, NSInteger);
  //} NS_ENUM_AVAILABLE_IOS(8_0);

JS_INIT_CLASS_END(UIAlertController, UIViewController);

NAN_METHOD(NUIAlertController::New) {
  JS_RECONSTRUCT(UIAlertController);
  @autoreleasepool {
    UIAlertController* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UIAlertController *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIAlertController alloc] init];
    }
    if (self) {
      NUIAlertController *wrapper = new NUIAlertController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIAlertController::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIAlertController::alertControllerWithTitleMessagePreferredStyle) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, title);
    declare_nullable_pointer(NSString, message);
    declare_value(UIAlertControllerStyle, preferredStyle);
    JS_SET_RETURN(js_value_instancetype([UIAlertController alertControllerWithTitle: title message: message preferredStyle: preferredStyle]));
  }
}

#include "NUIAlertAction.h"

NAN_METHOD(NUIAlertController::addAction) {
  JS_UNWRAP(UIAlertController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIAlertAction, action);
    [self addAction: action];
  }
}

#include "NUITextField.h"

NAN_METHOD(NUIAlertController::addTextFieldWithConfigurationHandler) {
  JS_UNWRAP(UIAlertController, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(configurationHandler);
    [self addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
      dispatch_main(^{
        if (configurationHandler) {
          [configurationHandler jsFunction]->Call("NUIAlertController::addTextFieldWithConfigurationHandler",
            js_value_UITextField(textField));
        }
      });
    }];
  }
}

NAN_GETTER(NUIAlertController::actionsGetter) {
  JS_UNWRAP(UIAlertController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIAlertAction*>([self actions]));
  }
}

NAN_GETTER(NUIAlertController::preferredActionGetter) {
  JS_UNWRAP(UIAlertController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIAlertAction([self preferredAction]));
  }
}

NAN_SETTER(NUIAlertController::preferredActionSetter) {
  JS_UNWRAP(UIAlertController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIAlertAction, input);
    [self setPreferredAction: input];
  }
}

NAN_GETTER(NUIAlertController::textFieldsGetter) {
  JS_UNWRAP(UIAlertController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UITextField*>([self textFields]));
  }
}

NAN_GETTER(NUIAlertController::titleGetter) {
  JS_UNWRAP(UIAlertController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self title]));
  }
}

NAN_SETTER(NUIAlertController::titleSetter) {
  JS_UNWRAP(UIAlertController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setTitle: input];
  }
}

NAN_GETTER(NUIAlertController::messageGetter) {
  JS_UNWRAP(UIAlertController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self message]));
  }
}

NAN_SETTER(NUIAlertController::messageSetter) {
  JS_UNWRAP(UIAlertController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setMessage: input];
  }
}

NAN_GETTER(NUIAlertController::preferredStyleGetter) {
  JS_UNWRAP(UIAlertController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIAlertControllerStyle([self preferredStyle]));
  }
}
