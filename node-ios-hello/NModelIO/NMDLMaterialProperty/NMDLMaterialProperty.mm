//
//  NMDLMaterialProperty.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLMaterialProperty.h"

#include "NMDLMaterial.h"

#define instancetype MDLMaterialProperty
#define js_value_instancetype js_value_MDLMaterialProperty

NMDLMaterialProperty::NMDLMaterialProperty() {}
NMDLMaterialProperty::~NMDLMaterialProperty() {}

JS_INIT_CLASS(MDLMaterialProperty, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(setProperties);
  JS_ASSIGN_PROTO_PROP(semantic);
  JS_ASSIGN_PROTO_PROP(type);
  JS_ASSIGN_PROTO_PROP(name);
  JS_ASSIGN_PROTO_PROP(stringValue);
  JS_ASSIGN_PROTO_PROP(URLValue);
  JS_ASSIGN_PROTO_PROP(textureSamplerValue);
  JS_ASSIGN_PROTO_PROP(color);
  JS_ASSIGN_PROTO_PROP(floatValue);
  JS_ASSIGN_PROTO_PROP(float2Value);
  JS_ASSIGN_PROTO_PROP(float3Value);
  JS_ASSIGN_PROTO_PROP(float4Value);
  JS_ASSIGN_PROTO_PROP(matrix4x4);
  JS_ASSIGN_PROTO_PROP(luminance);
  // static members (ctor)
  JS_INIT_CTOR(MDLMaterialProperty, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithNameSemantic);
  JS_ASSIGN_PROTO_METHOD(initWithNameSemanticFloat);
  JS_ASSIGN_PROTO_METHOD(initWithNameSemanticFloat2);
  JS_ASSIGN_PROTO_METHOD(initWithNameSemanticFloat3);
  JS_ASSIGN_PROTO_METHOD(initWithNameSemanticFloat4);
  JS_ASSIGN_PROTO_METHOD(initWithNameSemanticMatrix4x4);
  JS_ASSIGN_PROTO_METHOD(initWithNameSemanticURL);
  JS_ASSIGN_PROTO_METHOD(initWithNameSemanticString);
  JS_ASSIGN_PROTO_METHOD(initWithNameSemanticTextureSampler);
  JS_ASSIGN_PROTO_METHOD(initWithNameSemanticColor);
JS_INIT_CLASS_END(MDLMaterialProperty, NSObject);

NAN_METHOD(NMDLMaterialProperty::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLMaterialProperty(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLMaterialProperty, info);
      return;
    }

    MDLMaterialProperty* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLMaterialProperty *)(info[0].As<External>()->Value());
    }
    if (self) {
      NMDLMaterialProperty *wrapper = new NMDLMaterialProperty();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLMaterialProperty::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMDLMaterialProperty::initWithNameSemantic) {
  JS_UNWRAP_OR_ALLOC(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(MDLMaterialSemantic, semantic);
    JS_SET_RETURN(js_value_instancetype([self initWithName: name semantic: semantic]));
  }
}

NAN_METHOD(NMDLMaterialProperty::initWithNameSemanticFloat) {
  JS_UNWRAP_OR_ALLOC(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(MDLMaterialSemantic, semantic);
    declare_value(float, value);
    JS_SET_RETURN(js_value_instancetype([self initWithName: name semantic: semantic float: value]));
  }
}

NAN_METHOD(NMDLMaterialProperty::initWithNameSemanticFloat2) {
  JS_UNWRAP_OR_ALLOC(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(MDLMaterialSemantic, semantic);
    declare_value(vector_float2, value);
    JS_SET_RETURN(js_value_instancetype([self initWithName: name semantic: semantic float2: value]));
  }
}

NAN_METHOD(NMDLMaterialProperty::initWithNameSemanticFloat3) {
  JS_UNWRAP_OR_ALLOC(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(MDLMaterialSemantic, semantic);
    declare_value(vector_float3, value);
    JS_SET_RETURN(js_value_instancetype([self initWithName: name semantic: semantic float3: value]));
  }
}

NAN_METHOD(NMDLMaterialProperty::initWithNameSemanticFloat4) {
  JS_UNWRAP_OR_ALLOC(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(MDLMaterialSemantic, semantic);
    declare_value(vector_float4, value);
    JS_SET_RETURN(js_value_instancetype([self initWithName: name semantic: semantic float4: value]));
  }
}

NAN_METHOD(NMDLMaterialProperty::initWithNameSemanticMatrix4x4) {
  JS_UNWRAP_OR_ALLOC(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(MDLMaterialSemantic, semantic);
    declare_value(matrix_float4x4, value);
    JS_SET_RETURN(js_value_instancetype([self initWithName: name semantic: semantic matrix4x4: value]));
  }
}

#include "NNSURL.h"

NAN_METHOD(NMDLMaterialProperty::initWithNameSemanticURL) {
  JS_UNWRAP_OR_ALLOC(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(MDLMaterialSemantic, semantic);
    declare_nullable_pointer(NSURL, URL);
    JS_SET_RETURN(js_value_instancetype([self initWithName: name semantic: semantic URL: URL]));
  }
}

NAN_METHOD(NMDLMaterialProperty::initWithNameSemanticString) {
  JS_UNWRAP_OR_ALLOC(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(MDLMaterialSemantic, semantic);
    declare_nullable_pointer(NSString, string);
    JS_SET_RETURN(js_value_instancetype([self initWithName: name semantic: semantic string: string]));
  }
}

#include "NMDLTextureSampler.h"

NAN_METHOD(NMDLMaterialProperty::initWithNameSemanticTextureSampler) {
  JS_UNWRAP_OR_ALLOC(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(MDLMaterialSemantic, semantic);
    declare_nullable_pointer(MDLTextureSampler, textureSampler);
    JS_SET_RETURN(js_value_instancetype([self initWithName: name semantic: semantic textureSampler: textureSampler]));
  }
}

NAN_METHOD(NMDLMaterialProperty::initWithNameSemanticColor) {
  JS_UNWRAP_OR_ALLOC(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(MDLMaterialSemantic, semantic);
    declare_value(CGColorRef, color);
    JS_SET_RETURN(js_value_instancetype([self initWithName: name semantic: semantic color: color]));
  }
}

NAN_METHOD(NMDLMaterialProperty::setProperties) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLMaterialProperty, property);
    [self setProperties: property];
  }
}

NAN_GETTER(NMDLMaterialProperty::semanticGetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialSemantic([self semantic]));
  }
}

NAN_SETTER(NMDLMaterialProperty::semanticSetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MDLMaterialSemantic, input);
    [self setSemantic: input];
  }
}

NAN_GETTER(NMDLMaterialProperty::typeGetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialPropertyType([self type]));
  }
}

NAN_SETTER(NMDLMaterialProperty::typeSetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MDLMaterialPropertyType, input);
    [self setType: input];
  }
}

NAN_GETTER(NMDLMaterialProperty::nameGetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NMDLMaterialProperty::nameSetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}

NAN_GETTER(NMDLMaterialProperty::stringValueGetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self stringValue]));
  }
}

NAN_SETTER(NMDLMaterialProperty::stringValueSetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setStringValue: input];
  }
}

NAN_GETTER(NMDLMaterialProperty::URLValueGetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self URLValue]));
  }
}

NAN_SETTER(NMDLMaterialProperty::URLValueSetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSURL, input);
    [self setURLValue: input];
  }
}

NAN_GETTER(NMDLMaterialProperty::textureSamplerValueGetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLTextureSampler([self textureSamplerValue]));
  }
}

NAN_SETTER(NMDLMaterialProperty::textureSamplerValueSetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MDLTextureSampler, input);
    [self setTextureSamplerValue: input];
  }
}

NAN_GETTER(NMDLMaterialProperty::colorGetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGColorRef([self color]));
  }
}

NAN_SETTER(NMDLMaterialProperty::colorSetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGColorRef, input);
    [self setColor: input];
  }
}

NAN_GETTER(NMDLMaterialProperty::floatValueGetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self floatValue]));
  }
}

NAN_SETTER(NMDLMaterialProperty::floatValueSetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setFloatValue: input];
  }
}

NAN_GETTER(NMDLMaterialProperty::float2ValueGetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_vector_float2([self float2Value]));
  }
}

NAN_SETTER(NMDLMaterialProperty::float2ValueSetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(vector_float2, input);
    [self setFloat2Value: input];
  }
}

NAN_GETTER(NMDLMaterialProperty::float3ValueGetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_vector_float3([self float3Value]));
  }
}

NAN_SETTER(NMDLMaterialProperty::float3ValueSetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(vector_float3, input);
    [self setFloat3Value: input];
  }
}

NAN_GETTER(NMDLMaterialProperty::float4ValueGetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_vector_float4([self float4Value]));
  }
}

NAN_SETTER(NMDLMaterialProperty::float4ValueSetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(vector_float4, input);
    [self setFloat4Value: input];
  }
}

NAN_GETTER(NMDLMaterialProperty::matrix4x4Getter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_matrix_float4x4([self matrix4x4]));
  }
}

NAN_SETTER(NMDLMaterialProperty::matrix4x4Setter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(matrix_float4x4, input);
    [self setMatrix4x4: input];
  }
}

NAN_GETTER(NMDLMaterialProperty::luminanceGetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self luminance]));
  }
}

NAN_SETTER(NMDLMaterialProperty::luminanceSetter) {
  JS_UNWRAP(MDLMaterialProperty, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setLuminance: input];
  }
}
