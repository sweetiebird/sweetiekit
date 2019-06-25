//
//  NSceneKitTypes.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSceneKitTypes.h"

#define instancetype SceneKitTypes
#define js_value_instancetype js_value_SceneKitTypes

NSceneKitTypes::NSceneKitTypes() {}
NSceneKitTypes::~NSceneKitTypes() {}

JS_INIT_CLASS(SceneKitTypes, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SceneKitTypes, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, SCNActionTimingMode) {
    JS_ASSIGN_ENUM(SCNActionTimingModeLinear, NSInteger); //,
    JS_ASSIGN_ENUM(SCNActionTimingModeEaseIn, NSInteger); //,
    JS_ASSIGN_ENUM(SCNActionTimingModeEaseOut, NSInteger); //,
    JS_ASSIGN_ENUM(SCNActionTimingModeEaseInEaseOut, NSInteger); //
  //} API_AVAILABLE(macos(10.10), ios(8.0));

  /*! @enum SCNColorComponent
  @abstract Color components
  */
  //typedef NS_OPTIONS(NSInteger, SCNColorMask) {
    JS_ASSIGN_ENUM(SCNColorMaskNone, NSInteger); //   = 0,
    JS_ASSIGN_ENUM(SCNColorMaskRed, NSInteger); //    = 0x1 << 3,
    JS_ASSIGN_ENUM(SCNColorMaskGreen, NSInteger); //  = 0x1 << 2,
    JS_ASSIGN_ENUM(SCNColorMaskBlue, NSInteger); //   = 0x1 << 1,
    JS_ASSIGN_ENUM(SCNColorMaskAlpha, NSInteger); //  = 0x1 << 0,
    JS_ASSIGN_ENUM(SCNColorMaskAll, NSInteger); //    = 0xf
  //} API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(4.0));

JS_INIT_CLASS_END(SceneKitTypes, NSObject);

NAN_METHOD(NSceneKitTypes::New) {
  JS_RECONSTRUCT(SceneKitTypes);
  @autoreleasepool {
    SceneKitTypes* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SceneKitTypes *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SceneKitTypes alloc] init];
    }
    if (self) {
      NSceneKitTypes *wrapper = new NSceneKitTypes();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SceneKitTypes::New: invalid arguments");
    }
  }
}

@implementation SceneKitTypes
@end
