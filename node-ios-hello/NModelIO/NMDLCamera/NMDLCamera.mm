//
//  NMDLCamera.mm
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLCamera.h"

#define instancetype MDLCamera
#define js_value_instancetype js_value_MDLCamera

NMDLCamera::NMDLCamera() {}
NMDLCamera::~NMDLCamera() {}

JS_INIT_CLASS(MDLCamera, MDLObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MDLCamera, MDLObject);
  JS_ASSIGN_STATIC_METHOD(cameraWithSCNCamera);
JS_INIT_CLASS_END(MDLCamera, MDLObject);

NAN_METHOD(NMDLCamera::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLCamera(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLCamera, info);
      return;
    }

    MDLCamera* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLCamera *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLCamera alloc] init];
    }
    if (self) {
      NMDLCamera *wrapper = new NMDLCamera();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLCamera::New: invalid arguments");
    }
  }
}

#include "NSCNCamera.h"

NAN_METHOD(NMDLCamera::cameraWithSCNCamera) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNCamera, scnCamera);
    JS_SET_RETURN(js_value_instancetype([MDLCamera cameraWithSCNCamera: scnCamera]));
  }
}
