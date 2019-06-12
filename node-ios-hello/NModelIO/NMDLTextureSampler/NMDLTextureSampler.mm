//
//  NMDLTextureSampler.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLTextureSampler.h"

NMDLTextureSampler::NMDLTextureSampler() {}
NMDLTextureSampler::~NMDLTextureSampler() {}

JS_INIT_CLASS(MDLTextureSampler, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(texture);
  JS_ASSIGN_PROTO_PROP(hardwareFilter);
  JS_ASSIGN_PROTO_PROP(transform);
  // static members (ctor)
  JS_INIT_CTOR(MDLTextureSampler, NSObject);
JS_INIT_CLASS_END(MDLTextureSampler, NSObject);

NAN_METHOD(NMDLTextureSampler::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLTextureSampler(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLTextureSampler, info);
      return;
    }

    MDLTextureSampler* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLTextureSampler *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLTextureSampler alloc] init];
    }
    if (self) {
      NMDLTextureSampler *wrapper = new NMDLTextureSampler();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLTextureSampler::New: invalid arguments");
    }
  }
}

#include "NMDLTexture.h"

NAN_GETTER(NMDLTextureSampler::textureGetter) {
  JS_UNWRAP(MDLTextureSampler, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLTexture([self texture]));
  }
}

NAN_SETTER(NMDLTextureSampler::textureSetter) {
  JS_UNWRAP(MDLTextureSampler, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MDLTexture, input);
    [self setTexture: input];
  }
}

#include "NMDLTextureFilter.h"

NAN_GETTER(NMDLTextureSampler::hardwareFilterGetter) {
  JS_UNWRAP(MDLTextureSampler, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLTextureFilter([self hardwareFilter]));
  }
}

NAN_SETTER(NMDLTextureSampler::hardwareFilterSetter) {
  JS_UNWRAP(MDLTextureSampler, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MDLTextureFilter, input);
    [self setHardwareFilter: input];
  }
}

#include "NMDLTransform.h"

NAN_GETTER(NMDLTextureSampler::transformGetter) {
  JS_UNWRAP(MDLTextureSampler, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLTransform([self transform]));
  }
}

NAN_SETTER(NMDLTextureSampler::transformSetter) {
  JS_UNWRAP(MDLTextureSampler, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MDLTransform, input);
    [self setTransform: input];
  }
}
