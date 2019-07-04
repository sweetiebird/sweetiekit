//
//  NUISwipeActionsConfiguration.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUISwipeActionsConfiguration.h"

#define instancetype UISwipeActionsConfiguration
#define js_value_instancetype js_value_UISwipeActionsConfiguration

NUISwipeActionsConfiguration::NUISwipeActionsConfiguration() {}
NUISwipeActionsConfiguration::~NUISwipeActionsConfiguration() {}

JS_INIT_CLASS(UISwipeActionsConfiguration, NSObject);
  JS_ASSIGN_STATIC_METHOD(configurationWithActions);
  JS_ASSIGN_PROTO_PROP_READONLY(actions);
  JS_ASSIGN_PROTO_PROP(performsFirstActionWithFullSwipe);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UISwipeActionsConfiguration, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UISwipeActionsConfiguration, NSObject);

NAN_METHOD(NUISwipeActionsConfiguration::New) {
  JS_RECONSTRUCT(UISwipeActionsConfiguration);
  @autoreleasepool {
    UISwipeActionsConfiguration* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UISwipeActionsConfiguration *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UISwipeActionsConfiguration alloc] init];
    }
    if (self) {
      NUISwipeActionsConfiguration *wrapper = new NUISwipeActionsConfiguration();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UISwipeActionsConfiguration::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUISwipeActionsConfiguration::configurationWithActions) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<UIContextualAction*>, actions);
    JS_SET_RETURN(js_value_instancetype([UISwipeActionsConfiguration configurationWithActions: actions]));
  }
}

NAN_GETTER(NUISwipeActionsConfiguration::actionsGetter) {
  JS_UNWRAP(UISwipeActionsConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIContextualAction*>([self actions]));
  }
}

NAN_GETTER(NUISwipeActionsConfiguration::performsFirstActionWithFullSwipeGetter) {
  JS_UNWRAP(UISwipeActionsConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self performsFirstActionWithFullSwipe]));
  }
}

NAN_SETTER(NUISwipeActionsConfiguration::performsFirstActionWithFullSwipeSetter) {
  JS_UNWRAP(UISwipeActionsConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPerformsFirstActionWithFullSwipe: input];
  }
}

