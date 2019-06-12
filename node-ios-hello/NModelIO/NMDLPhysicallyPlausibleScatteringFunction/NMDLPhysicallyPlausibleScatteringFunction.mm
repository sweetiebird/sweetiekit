//
//  NMDLPhysicallyPlausibleScatteringFunction.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLPhysicallyPlausibleScatteringFunction.h"

NMDLPhysicallyPlausibleScatteringFunction::NMDLPhysicallyPlausibleScatteringFunction() {}
NMDLPhysicallyPlausibleScatteringFunction::~NMDLPhysicallyPlausibleScatteringFunction() {}

JS_INIT_CLASS(MDLPhysicallyPlausibleScatteringFunction, MDLScatteringFunction);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP_READONLY(version);
  JS_ASSIGN_PROTO_PROP_READONLY(subsurface);
  JS_ASSIGN_PROTO_PROP_READONLY(metallic);
  JS_ASSIGN_PROTO_PROP_READONLY(specularAmount);
  JS_ASSIGN_PROTO_PROP_READONLY(specularTint);
  JS_ASSIGN_PROTO_PROP_READONLY(roughness);
  JS_ASSIGN_PROTO_PROP_READONLY(anisotropic);
  JS_ASSIGN_PROTO_PROP_READONLY(anisotropicRotation);
  JS_ASSIGN_PROTO_PROP_READONLY(sheen);
  JS_ASSIGN_PROTO_PROP_READONLY(sheenTint);
  JS_ASSIGN_PROTO_PROP_READONLY(clearcoat);
  JS_ASSIGN_PROTO_PROP_READONLY(clearcoatGloss);
  // static members (ctor)
  JS_INIT_CTOR(MDLPhysicallyPlausibleScatteringFunction, MDLScatteringFunction);
JS_INIT_CLASS_END(MDLPhysicallyPlausibleScatteringFunction, MDLScatteringFunction);

NAN_METHOD(NMDLPhysicallyPlausibleScatteringFunction::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLPhysicallyPlausibleScatteringFunction(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLPhysicallyPlausibleScatteringFunction, info);
      return;
    }

    MDLPhysicallyPlausibleScatteringFunction* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLPhysicallyPlausibleScatteringFunction *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLPhysicallyPlausibleScatteringFunction alloc] init];
    }
    if (self) {
      NMDLPhysicallyPlausibleScatteringFunction *wrapper = new NMDLPhysicallyPlausibleScatteringFunction();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLPhysicallyPlausibleScatteringFunction::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMDLPhysicallyPlausibleScatteringFunction::versionGetter) {
  JS_UNWRAP(MDLPhysicallyPlausibleScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self version]));
  }
}

#include "NMDLMaterialProperty.h"

NAN_GETTER(NMDLPhysicallyPlausibleScatteringFunction::subsurfaceGetter) {
  JS_UNWRAP(MDLPhysicallyPlausibleScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self subsurface]));
  }
}

NAN_GETTER(NMDLPhysicallyPlausibleScatteringFunction::metallicGetter) {
  JS_UNWRAP(MDLPhysicallyPlausibleScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self metallic]));
  }
}

NAN_GETTER(NMDLPhysicallyPlausibleScatteringFunction::specularAmountGetter) {
  JS_UNWRAP(MDLPhysicallyPlausibleScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self specularAmount]));
  }
}

NAN_GETTER(NMDLPhysicallyPlausibleScatteringFunction::specularTintGetter) {
  JS_UNWRAP(MDLPhysicallyPlausibleScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self specularTint]));
  }
}

NAN_GETTER(NMDLPhysicallyPlausibleScatteringFunction::roughnessGetter) {
  JS_UNWRAP(MDLPhysicallyPlausibleScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self roughness]));
  }
}

NAN_GETTER(NMDLPhysicallyPlausibleScatteringFunction::anisotropicGetter) {
  JS_UNWRAP(MDLPhysicallyPlausibleScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self anisotropic]));
  }
}

NAN_GETTER(NMDLPhysicallyPlausibleScatteringFunction::anisotropicRotationGetter) {
  JS_UNWRAP(MDLPhysicallyPlausibleScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self anisotropicRotation]));
  }
}

NAN_GETTER(NMDLPhysicallyPlausibleScatteringFunction::sheenGetter) {
  JS_UNWRAP(MDLPhysicallyPlausibleScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self sheen]));
  }
}

NAN_GETTER(NMDLPhysicallyPlausibleScatteringFunction::sheenTintGetter) {
  JS_UNWRAP(MDLPhysicallyPlausibleScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self sheenTint]));
  }
}

NAN_GETTER(NMDLPhysicallyPlausibleScatteringFunction::clearcoatGetter) {
  JS_UNWRAP(MDLPhysicallyPlausibleScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self clearcoat]));
  }
}

NAN_GETTER(NMDLPhysicallyPlausibleScatteringFunction::clearcoatGlossGetter) {
  JS_UNWRAP(MDLPhysicallyPlausibleScatteringFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self clearcoatGloss]));
  }
}
