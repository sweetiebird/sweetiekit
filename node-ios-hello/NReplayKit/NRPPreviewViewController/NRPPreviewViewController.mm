//
//  NRPPreviewViewController.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NRPPreviewViewController.h"

#define instancetype RPPreviewViewController
#define js_value_instancetype js_value_RPPreviewViewController

NRPPreviewViewController::NRPPreviewViewController() {}
NRPPreviewViewController::~NRPPreviewViewController() {}

JS_INIT_CLASS(RPPreviewViewController, UIViewController);
  JS_ASSIGN_PROTO_PROP(previewControllerDelegate);
#ifdef __TVOS__
  JS_ASSIGN_PROTO_PROP(mode);
#endif

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(RPPreviewViewController, UIViewController);
  // constant values (exports)

  //NS_ENUM_AVAILABLE_IOS(10_0)
  //typedef NS_ENUM(NSInteger, RPPreviewViewControllerMode) {
    JS_ASSIGN_ENUM(RPPreviewViewControllerModePreview, NSInteger);
    JS_ASSIGN_ENUM(RPPreviewViewControllerModeShare, NSInteger);
  //}; __IOS_PROHIBITED

JS_INIT_CLASS_END(RPPreviewViewController, UIViewController);

NAN_METHOD(NRPPreviewViewController::New) {
  JS_RECONSTRUCT(RPPreviewViewController);
  @autoreleasepool {
    RPPreviewViewController* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge RPPreviewViewController *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[RPPreviewViewController alloc] init];
    }
    if (self) {
      NRPPreviewViewController *wrapper = new NRPPreviewViewController();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("RPPreviewViewController::New: invalid arguments");
    }
  }
}

#include "NRPPreviewViewControllerDelegate.h"

NAN_GETTER(NRPPreviewViewController::previewControllerDelegateGetter) {
  JS_UNWRAP(RPPreviewViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_RPPreviewViewControllerDelegate([self previewControllerDelegate]));
  }
}

NAN_SETTER(NRPPreviewViewController::previewControllerDelegateSetter) {
  JS_UNWRAP(RPPreviewViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(RPPreviewViewControllerDelegate, input);
    [self setPreviewControllerDelegate: input];
    [self associateValue:input withKey:@"NRPPreviewViewController::previewControllerDelegate"];
  }
}

#ifdef __TVOS__

NAN_GETTER(NRPPreviewViewController::modeGetter) {
  JS_UNWRAP(RPPreviewViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_RPPreviewViewControllerMode([self mode]));
  }
}

NAN_SETTER(NRPPreviewViewController::modeSetter) {
  JS_UNWRAP(RPPreviewViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(RPPreviewViewControllerMode, input);
    [self setMode: input];
  }
}

#endif // #if !TARGET_OS_IPHONE
