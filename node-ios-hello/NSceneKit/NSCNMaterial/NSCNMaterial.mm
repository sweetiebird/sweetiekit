//
//  SCNMaterial.m
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#include "NSCNMaterial.h"

Nan::Persistent<FunctionTemplate> NSCNMaterial::type;

NSCNMaterial::NSCNMaterial () {}
NSCNMaterial::~NSCNMaterial () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNMaterial::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNMaterial"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate(); proto = proto;
  JS_ASSIGN_PROP(proto, name);
  JS_ASSIGN_PROP_READONLY(proto, diffuse);
  JS_ASSIGN_PROP_READONLY(proto, ambient);
  JS_ASSIGN_PROP_READONLY(proto, specular);
  JS_ASSIGN_PROP_READONLY(proto, emission);
  JS_ASSIGN_PROP_READONLY(proto, transparent);
  JS_ASSIGN_PROP_READONLY(proto, reflective);
  JS_ASSIGN_PROP_READONLY(proto, multiply);
  JS_ASSIGN_PROP_READONLY(proto, normal);
  JS_ASSIGN_PROP_READONLY(proto, displacement);
  JS_ASSIGN_PROP_READONLY(proto, ambientOcclusion);
  JS_ASSIGN_PROP_READONLY(proto, selfIllumination);
  JS_ASSIGN_PROP_READONLY(proto, metalness);
  JS_ASSIGN_PROP_READONLY(proto, roughness);
  JS_ASSIGN_PROP(proto, shininess);
  JS_ASSIGN_PROP(proto, transparency);
  JS_ASSIGN_PROP(proto, lightingModelName);
  JS_ASSIGN_PROP(proto, litPerPixel);
  JS_ASSIGN_PROP(proto, doubleSided);
  JS_ASSIGN_PROP(proto, fillMode);
  JS_ASSIGN_PROP(proto, cullMode);
  JS_ASSIGN_PROP(proto, transparencyMode);
  JS_ASSIGN_PROP(proto, locksAmbientWithDiffuse);
  JS_ASSIGN_PROP(proto, writesToDepthBuffer);
  JS_ASSIGN_PROP(proto, colorBufferWriteMask);
  JS_ASSIGN_PROP(proto, readsFromDepthBuffer);
  JS_ASSIGN_PROP(proto, fresnelExponent);
  JS_ASSIGN_PROP(proto, blendMode);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNMaterial::New) {
  @autoreleasepool {
    Local<Object> obj = info.This();

    NSCNMaterial *ui = new NSCNMaterial();

    if (info[0]->IsExternal()) {
      ui->SetNSObject((__bridge SCNMaterial *)(info[0].As<External>()->Value()));
    } else {
      ui->SetNSObject([[SCNMaterial alloc] init]);
    }
    ui->Wrap(obj);

    JS_SET_RETURN(obj);
  }
}

NAN_GETTER(NSCNMaterial::nameGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSString([self name]));
    return;
  }
}

NAN_SETTER(NSCNMaterial::nameSetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    [self setName: to_value_NSString(value)];
  }
}

#define js_value_SCNMaterialProperty(x) js_value_wrapper_unknown(x, SCNMaterialProperty)
#define to_value_SCNMaterialProperty(x) to_value_wrapper_unknown(x, SCNMaterialProperty)
#define is_value_SCNMaterialProperty(x) is_value_wrapper_unknown(x, SCNMaterialProperty)

NAN_GETTER(NSCNMaterial::diffuseGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMaterialProperty([self diffuse]));
    return;
  }
}

NAN_GETTER(NSCNMaterial::ambientGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMaterialProperty([self ambient]));
    return;
  }
}

NAN_GETTER(NSCNMaterial::specularGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMaterialProperty([self specular]));
    return;
  }
}

NAN_GETTER(NSCNMaterial::emissionGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMaterialProperty([self emission]));
    return;
  }
}

NAN_GETTER(NSCNMaterial::transparentGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMaterialProperty([self transparent]));
    return;
  }
}

NAN_GETTER(NSCNMaterial::reflectiveGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMaterialProperty([self reflective]));
    return;
  }
}

NAN_GETTER(NSCNMaterial::multiplyGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMaterialProperty([self multiply]));
    return;
  }
}

NAN_GETTER(NSCNMaterial::normalGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMaterialProperty([self normal]));
    return;
  }
}

NAN_GETTER(NSCNMaterial::displacementGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMaterialProperty([self displacement]));
    return;
  }
}

NAN_GETTER(NSCNMaterial::ambientOcclusionGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMaterialProperty([self ambientOcclusion]));
    return;
  }
}

NAN_GETTER(NSCNMaterial::selfIlluminationGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMaterialProperty([self selfIllumination]));
    return;
  }
}

NAN_GETTER(NSCNMaterial::metalnessGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMaterialProperty([self metalness]));
    return;
  }
}

NAN_GETTER(NSCNMaterial::roughnessGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMaterialProperty([self roughness]));
    return;
  }
}

NAN_GETTER(NSCNMaterial::shininessGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self shininess]));
    return;
  }
}

NAN_SETTER(NSCNMaterial::shininessSetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    [self setShininess: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNMaterial::transparencyGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self transparency]));
    return;
  }
}

NAN_SETTER(NSCNMaterial::transparencySetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    [self setTransparency: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNMaterial::lightingModelNameGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNLightingModel([self lightingModelName]));
    return;
  }
}

NAN_SETTER(NSCNMaterial::lightingModelNameSetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    [self setLightingModelName: to_value_SCNLightingModel(value)];
  }
}

NAN_GETTER(NSCNMaterial::litPerPixelGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isLitPerPixel]));
    return;
  }
}

NAN_SETTER(NSCNMaterial::litPerPixelSetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    [self setLitPerPixel: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNMaterial::doubleSidedGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isDoubleSided]));
    return;
  }
}

NAN_SETTER(NSCNMaterial::doubleSidedSetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    [self setDoubleSided: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNMaterial::fillModeGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNFillMode([self fillMode]));
    return;
  }
}

NAN_SETTER(NSCNMaterial::fillModeSetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    [self setFillMode: to_value_SCNFillMode(value)];
  }
}

NAN_GETTER(NSCNMaterial::cullModeGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNCullMode([self cullMode]));
    return;
  }
}

NAN_SETTER(NSCNMaterial::cullModeSetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    [self setCullMode: to_value_SCNCullMode(value)];
  }
}

NAN_GETTER(NSCNMaterial::transparencyModeGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNTransparencyMode([self transparencyMode]));
    return;
  }
}

NAN_SETTER(NSCNMaterial::transparencyModeSetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    [self setTransparencyMode: to_value_SCNTransparencyMode(value)];
  }
}

NAN_GETTER(NSCNMaterial::locksAmbientWithDiffuseGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self locksAmbientWithDiffuse]));
    return;
  }
}

NAN_SETTER(NSCNMaterial::locksAmbientWithDiffuseSetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    [self setLocksAmbientWithDiffuse: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNMaterial::writesToDepthBufferGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self writesToDepthBuffer]));
    return;
  }
}

NAN_SETTER(NSCNMaterial::writesToDepthBufferSetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    [self setWritesToDepthBuffer: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNMaterial::colorBufferWriteMaskGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNColorMask([self colorBufferWriteMask]));
    return;
  }
}

NAN_SETTER(NSCNMaterial::colorBufferWriteMaskSetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    [self setColorBufferWriteMask: to_value_SCNColorMask(value)];
  }
}

NAN_GETTER(NSCNMaterial::readsFromDepthBufferGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self readsFromDepthBuffer]));
    return;
  }
}

NAN_SETTER(NSCNMaterial::readsFromDepthBufferSetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    [self setReadsFromDepthBuffer: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNMaterial::fresnelExponentGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self fresnelExponent]));
    return;
  }
}

NAN_SETTER(NSCNMaterial::fresnelExponentSetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    [self setFresnelExponent: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNMaterial::blendModeGetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNBlendMode([self blendMode]));
    return;
  }
}

NAN_SETTER(NSCNMaterial::blendModeSetter) {
  JS_UNWRAP(SCNMaterial, self);
  @autoreleasepool
  {
    [self setBlendMode: to_value_SCNBlendMode(value)];
  }
}

