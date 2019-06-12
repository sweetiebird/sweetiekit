//
//  NMDLLight.mm
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLLight.h"

#define instancetype MDLLight
#define js_value_instancetype js_value_MDLLight

NMDLLight::NMDLLight() {}
NMDLLight::~NMDLLight() {}

JS_INIT_CLASS(MDLLight, MDLObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MDLLight, MDLObject);
  JS_ASSIGN_STATIC_METHOD(lightWithSCNLight);
JS_INIT_CLASS_END(MDLLight, MDLObject);

NAN_METHOD(NMDLLight::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLLight(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLLight, info);
      return;
    }

    MDLLight* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLLight *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLLight alloc] init];
    }
    if (self) {
      NMDLLight *wrapper = new NMDLLight();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLLight::New: invalid arguments");
    }
  }
}

#include <SceneKit/ModelIO.h>
#include "NSCNLight.h"

NAN_METHOD(NMDLLight::lightWithSCNLight) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNLight, scnLight);
    JS_SET_RETURN(js_value_instancetype([MDLLight lightWithSCNLight: scnLight]));
  }
}
