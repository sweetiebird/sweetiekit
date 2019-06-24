//
//  NMTLCompileOptions.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLCompileOptions.h"

#define instancetype MTLCompileOptions
#define js_value_instancetype js_value_MTLCompileOptions

NMTLCompileOptions::NMTLCompileOptions() {}
NMTLCompileOptions::~NMTLCompileOptions() {}

JS_INIT_CLASS(MTLCompileOptions, NSObject);
  JS_ASSIGN_PROTO_PROP(preprocessorMacros);
  JS_ASSIGN_PROTO_PROP(fastMathEnabled);
  JS_ASSIGN_PROTO_PROP(languageVersion);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLCompileOptions, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLCompileOptions, NSObject);

NAN_METHOD(NMTLCompileOptions::New) {
  JS_RECONSTRUCT(MTLCompileOptions);
  @autoreleasepool {
    MTLCompileOptions* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLCompileOptions *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLCompileOptions alloc] init];
    }
    if (self) {
      NMTLCompileOptions *wrapper = new NMTLCompileOptions();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLCompileOptions::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMTLCompileOptions::preprocessorMacrosGetter) {
  JS_UNWRAP(MTLCompileOptions, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, NSObject*>*/([self preprocessorMacros]));
  }
}

NAN_SETTER(NMTLCompileOptions::preprocessorMacrosSetter) {
  JS_UNWRAP(MTLCompileOptions, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary/* <NSString*, NSObject*>*/, input);
    [self setPreprocessorMacros: input];
  }
}

NAN_GETTER(NMTLCompileOptions::fastMathEnabledGetter) {
  JS_UNWRAP(MTLCompileOptions, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self fastMathEnabled]));
  }
}

NAN_SETTER(NMTLCompileOptions::fastMathEnabledSetter) {
  JS_UNWRAP(MTLCompileOptions, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setFastMathEnabled: input];
  }
}

#include "NMTLLibrary.h"

NAN_GETTER(NMTLCompileOptions::languageVersionGetter) {
  JS_UNWRAP(MTLCompileOptions, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLLanguageVersion([self languageVersion]));
  }
}

NAN_SETTER(NMTLCompileOptions::languageVersionSetter) {
  JS_UNWRAP(MTLCompileOptions, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLLanguageVersion, input);
    [self setLanguageVersion: input];
  }
}
