//
//  NMDLScatteringFunction.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLScatteringFunction.h"

NMDLScatteringFunction::NMDLScatteringFunction() {}
NMDLScatteringFunction::~NMDLScatteringFunction() {}

JS_INIT_CLASS(MDLScatteringFunction, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(name);
  JS_ASSIGN_PROTO_PROP_READONLY(baseColor);
  JS_ASSIGN_PROTO_PROP_READONLY(emission);
  JS_ASSIGN_PROTO_PROP_READONLY(specular);
  JS_ASSIGN_PROTO_PROP_READONLY(materialIndexOfRefraction);
  JS_ASSIGN_PROTO_PROP_READONLY(interfaceIndexOfRefraction);
  JS_ASSIGN_PROTO_PROP_READONLY(normal);
  JS_ASSIGN_PROTO_PROP_READONLY(ambientOcclusion);
  JS_ASSIGN_PROTO_PROP_READONLY(ambientOcclusionScale);
  // static members (ctor)
  JS_INIT_CTOR(MDLScatteringFunction, NSObject);
JS_INIT_CLASS_END(MDLScatteringFunction, NSObject);

NAN_METHOD(NMDLScatteringFunction::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLScatteringFunction(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLScatteringFunction, info);
      return;
    }

    MDLScatteringFunction* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLScatteringFunction *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLScatteringFunction alloc] init];
    }
    if (self) {
      NMDLScatteringFunction *wrapper = new NMDLScatteringFunction();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLScatteringFunction::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMDLScatteringFunction::nameGetter) {
  JS_UNWRAP(MDLScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NMDLScatteringFunction::nameSetter) {
  JS_UNWRAP(MDLScatteringFunction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}

#include "NMDLMaterialProperty.h"

NAN_GETTER(NMDLScatteringFunction::baseColorGetter) {
  JS_UNWRAP(MDLScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self baseColor]));
  }
}

NAN_GETTER(NMDLScatteringFunction::emissionGetter) {
  JS_UNWRAP(MDLScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self emission]));
  }
}

NAN_GETTER(NMDLScatteringFunction::specularGetter) {
  JS_UNWRAP(MDLScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self specular]));
  }
}

NAN_GETTER(NMDLScatteringFunction::materialIndexOfRefractionGetter) {
  JS_UNWRAP(MDLScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self materialIndexOfRefraction]));
  }
}

NAN_GETTER(NMDLScatteringFunction::interfaceIndexOfRefractionGetter) {
  JS_UNWRAP(MDLScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self interfaceIndexOfRefraction]));
  }
}

NAN_GETTER(NMDLScatteringFunction::normalGetter) {
  JS_UNWRAP(MDLScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self normal]));
  }
}

NAN_GETTER(NMDLScatteringFunction::ambientOcclusionGetter) {
  JS_UNWRAP(MDLScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self ambientOcclusion]));
  }
}

NAN_GETTER(NMDLScatteringFunction::ambientOcclusionScaleGetter) {
  JS_UNWRAP(MDLScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self ambientOcclusionScale]));
  }
}
