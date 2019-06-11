//
//  NMDLTextureFilter.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLTextureFilter.h"

NMDLTextureFilter::NMDLTextureFilter() {}
NMDLTextureFilter::~NMDLTextureFilter() {}

JS_INIT_CLASS(MDLTextureFilter, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(sWrapMode);
  JS_ASSIGN_PROTO_PROP(tWrapMode);
  JS_ASSIGN_PROTO_PROP(rWrapMode);
  JS_ASSIGN_PROTO_PROP(minFilter);
  JS_ASSIGN_PROTO_PROP(magFilter);
  JS_ASSIGN_PROTO_PROP(mipFilter);
  // static members (ctor)
  JS_INIT_CTOR(MDLTextureFilter, NSObject);
JS_INIT_CLASS_END(MDLTextureFilter, NSObject);

NAN_METHOD(NMDLTextureFilter::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLTextureFilter(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLTextureFilter, info);
      return;
    }

    MDLTextureFilter* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLTextureFilter *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLTextureFilter alloc] init];
    }
    if (self) {
      NMDLTextureFilter *wrapper = new NMDLTextureFilter();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLTextureFilter::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMDLTextureFilter::sWrapModeGetter) {
  JS_UNWRAP(MDLTextureFilter, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialTextureWrapMode([self sWrapMode]));
  }
}

NAN_SETTER(NMDLTextureFilter::sWrapModeSetter) {
  JS_UNWRAP(MDLTextureFilter, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MDLMaterialTextureWrapMode, input);
    [self setSWrapMode: input];
  }
}

NAN_GETTER(NMDLTextureFilter::tWrapModeGetter) {
  JS_UNWRAP(MDLTextureFilter, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialTextureWrapMode([self tWrapMode]));
  }
}

NAN_SETTER(NMDLTextureFilter::tWrapModeSetter) {
  JS_UNWRAP(MDLTextureFilter, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MDLMaterialTextureWrapMode, input);
    [self setTWrapMode: input];
  }
}

NAN_GETTER(NMDLTextureFilter::rWrapModeGetter) {
  JS_UNWRAP(MDLTextureFilter, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialTextureWrapMode([self rWrapMode]));
  }
}

NAN_SETTER(NMDLTextureFilter::rWrapModeSetter) {
  JS_UNWRAP(MDLTextureFilter, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MDLMaterialTextureWrapMode, input);
    [self setRWrapMode: input];
  }
}

NAN_GETTER(NMDLTextureFilter::minFilterGetter) {
  JS_UNWRAP(MDLTextureFilter, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialTextureFilterMode([self minFilter]));
  }
}

NAN_SETTER(NMDLTextureFilter::minFilterSetter) {
  JS_UNWRAP(MDLTextureFilter, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MDLMaterialTextureFilterMode, input);
    [self setMinFilter: input];
  }
}

NAN_GETTER(NMDLTextureFilter::magFilterGetter) {
  JS_UNWRAP(MDLTextureFilter, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialTextureFilterMode([self magFilter]));
  }
}

NAN_SETTER(NMDLTextureFilter::magFilterSetter) {
  JS_UNWRAP(MDLTextureFilter, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MDLMaterialTextureFilterMode, input);
    [self setMagFilter: input];
  }
}

NAN_GETTER(NMDLTextureFilter::mipFilterGetter) {
  JS_UNWRAP(MDLTextureFilter, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialMipMapFilterMode([self mipFilter]));
  }
}

NAN_SETTER(NMDLTextureFilter::mipFilterSetter) {
  JS_UNWRAP(MDLTextureFilter, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MDLMaterialMipMapFilterMode, input);
    [self setMipFilter: input];
  }
}
