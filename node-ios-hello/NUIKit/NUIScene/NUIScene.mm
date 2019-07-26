//
//  NUIScene.mm
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIScene.h"

#define instancetype UIScene
#define js_value_instancetype js_value_UIScene

NUIScene::NUIScene() {}
NUIScene::~NUIScene() {}

JS_INIT_CLASS(UIScene, UIResponder);
#if TODO
  JS_ASSIGN_PROTO_METHOD(initWithSessionConnectionOptions);
  JS_ASSIGN_PROTO_METHOD(openURLOptionsCompletionHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(session);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP_READONLY(activationState);
  JS_ASSIGN_PROTO_PROP(title);
  JS_ASSIGN_PROTO_PROP(activationConditions);
#endif

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIScene, UIResponder);
  // constant values (exports)
JS_INIT_CLASS_END(UIScene, UIResponder);

NAN_METHOD(NUIScene::New) {
  JS_RECONSTRUCT(UIScene);
  @autoreleasepool {
    UIScene* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIScene *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUIScene *wrapper = new NUIScene();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIScene::New: invalid arguments");
    }
  }
}

#if TODO
NAN_METHOD(NUIScene::initWithSessionConnectionOptions) {
  JS_UNWRAP_OR_ALLOC(UIScene, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UISceneSession, session);
    declare_pointer(UISceneConnectionOptions, connectionOptions);
    JS_SET_RETURN(js_value_instancetype([self initWithSession: session connectionOptions: connectionOptions]));
  }
}

NAN_METHOD(NUIScene::openURLOptionsCompletionHandler) {
  JS_UNWRAP(UIScene, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_nullable_pointer(UISceneOpenExternalURLOptions, options);
    declare_value(void-^,__nullable-BOOL,success, completion);
    [self openURL: url options: options completionHandler: completion];
  }
}

NAN_GETTER(NUIScene::sessionGetter) {
  JS_UNWRAP(UIScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UISceneSession([self session]));
  }
}

NAN_GETTER(NUIScene::delegateGetter) {
  JS_UNWRAP(UIScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id<UISceneDelegate>([self delegate]));
  }
}

NAN_SETTER(NUIScene::delegateSetter) {
  JS_UNWRAP(UIScene, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id<UISceneDelegate>, input);
    [self setDelegate: input];
  }
}

NAN_GETTER(NUIScene::activationStateGetter) {
  JS_UNWRAP(UIScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UISceneActivationState([self activationState]));
  }
}

NAN_GETTER(NUIScene::titleGetter) {
  JS_UNWRAP(UIScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self title]));
  }
}

NAN_SETTER(NUIScene::titleSetter) {
  JS_UNWRAP(UIScene, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setTitle: input];
  }
}

NAN_GETTER(NUIScene::activationConditionsGetter) {
  JS_UNWRAP(UIScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UISceneActivationConditions([self activationConditions]));
  }
}

NAN_SETTER(NUIScene::activationConditionsSetter) {
  JS_UNWRAP(UIScene, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UISceneActivationConditions, input);
    [self setActivationConditions: input];
  }
}
#endif

