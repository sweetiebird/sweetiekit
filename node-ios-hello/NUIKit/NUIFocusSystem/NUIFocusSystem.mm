//
//  NUIFocusSystem.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIFocusSystem.h"

#define instancetype UIFocusSystem
#define js_value_instancetype js_value_UIFocusSystem

NUIFocusSystem::NUIFocusSystem() {}
NUIFocusSystem::~NUIFocusSystem() {}

JS_INIT_CLASS(UIFocusSystem, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(requestFocusUpdateToEnvironment);
  JS_ASSIGN_PROTO_METHOD(updateFocusIfNeeded);
  JS_ASSIGN_PROTO_PROP_READONLY(focusedItem);
  // static members (ctor)
  JS_INIT_CTOR(UIFocusSystem, NSObject);
  JS_ASSIGN_STATIC_METHOD(focusSystemForEnvironment);
  JS_ASSIGN_STATIC_METHOD(environmentContainsEnvironment);
#ifdef __TVOS__
  JS_ASSIGN_STATIC_METHOD(registerURLForSoundIdentifier);
#endif
  // constant values (exports)
JS_INIT_CLASS_END(UIFocusSystem, NSObject);

NAN_METHOD(NUIFocusSystem::New) {
  JS_RECONSTRUCT(UIFocusSystem);
  @autoreleasepool {
    UIFocusSystem* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIFocusSystem *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUIFocusSystem *wrapper = new NUIFocusSystem();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIFocusSystem::New: invalid arguments");
    }
  }
}


NAN_METHOD(NUIFocusSystem::focusSystemForEnvironment) {
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <UIFocusEnvironment>*/, environment);
    JS_SET_RETURN(js_value_UIFocusSystem([UIFocusSystem focusSystemForEnvironment: environment]));
  }
}

NAN_METHOD(NUIFocusSystem::environmentContainsEnvironment) {
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <UIFocusEnvironment>*/, environment);
    declare_value(id/* <UIFocusEnvironment>*/, otherEnvironment);
    JS_SET_RETURN(js_value_BOOL([UIFocusSystem environment: environment containsEnvironment: otherEnvironment]));
  }
}

#ifdef __TVOS__
#include "NNSURL.h"

NAN_METHOD(NUIFocusSystem::registerURLForSoundIdentifier) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, soundFileURL);
    declare_value(UIFocusSoundIdentifier, identifier);
    [UIFocusSystem registerURL: soundFileURL forSoundIdentifier: identifier];
  }
}
#endif

NAN_METHOD(NUIFocusSystem::requestFocusUpdateToEnvironment) {
  JS_UNWRAP(UIFocusSystem, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <UIFocusEnvironment>*/, environment);
    [self requestFocusUpdateToEnvironment: environment];
  }
}

NAN_METHOD(NUIFocusSystem::updateFocusIfNeeded) {
  JS_UNWRAP(UIFocusSystem, self);
  declare_autoreleasepool {
    [self updateFocusIfNeeded];
  }
}

NAN_GETTER(NUIFocusSystem::focusedItemGetter) {
  JS_UNWRAP(UIFocusSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UIFocusItem>*/([self focusedItem]));
  }
}

