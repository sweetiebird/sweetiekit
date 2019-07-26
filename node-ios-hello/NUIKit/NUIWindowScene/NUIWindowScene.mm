//
//  NUIWindowScene.mm
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIWindowScene.h"

#define instancetype UIWindowScene
#define js_value_instancetype js_value_UIWindowScene

NUIWindowScene::NUIWindowScene() {}
NUIWindowScene::~NUIWindowScene() {}

JS_INIT_CLASS(UIWindowScene, UIScene);
  JS_ASSIGN_PROTO_PROP_READONLY(screen);
  JS_ASSIGN_PROTO_PROP_READONLY(interfaceOrientation);
  JS_ASSIGN_PROTO_PROP_READONLY(coordinateSpace);
  JS_ASSIGN_PROTO_PROP_READONLY(traitCollection);
  JS_ASSIGN_PROTO_PROP_READONLY(windows);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIWindowScene, UIScene);
  // constant values (exports)
JS_INIT_CLASS_END(UIWindowScene, UIScene);

NAN_METHOD(NUIWindowScene::New) {
  JS_RECONSTRUCT(UIWindowScene);
  @autoreleasepool {
    UIWindowScene* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIWindowScene *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUIWindowScene *wrapper = new NUIWindowScene();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIWindowScene::New: invalid arguments");
    }
  }
}

#include "NUIScreen.h"

NAN_GETTER(NUIWindowScene::screenGetter) {
  JS_UNWRAP(UIWindowScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIScreen([self screen]));
  }
}

#include "NUIApplication.h"

NAN_GETTER(NUIWindowScene::interfaceOrientationGetter) {
  JS_UNWRAP(UIWindowScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIInterfaceOrientation([self interfaceOrientation]));
  }
}

NAN_GETTER(NUIWindowScene::coordinateSpaceGetter) {
  JS_UNWRAP(UIWindowScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UICoordinateSpace>*/([self coordinateSpace]));
  }
}

#include "NUITraitCollection.h"

NAN_GETTER(NUIWindowScene::traitCollectionGetter) {
  JS_UNWRAP(UIWindowScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITraitCollection([self traitCollection]));
  }
}

#include "NUIWindow.h"

NAN_GETTER(NUIWindowScene::windowsGetter) {
  JS_UNWRAP(UIWindowScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIWindow*>([self windows]));
  }
}
