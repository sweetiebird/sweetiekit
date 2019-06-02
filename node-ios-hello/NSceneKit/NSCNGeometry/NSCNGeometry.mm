//
//  SCNGeometry.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NNSObject.h"
#include "NSCNGeometry.h"

Nan::Persistent<FunctionTemplate> NSCNGeometry::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNGeometry::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNGeometry"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, name);
  JS_ASSIGN_PROP(proto, materials);
  JS_ASSIGN_PROP(proto, firstMaterial);
  JS_ASSIGN_PROP_READONLY(proto, geometrySources);
  JS_ASSIGN_PROP_READONLY(proto, geometryElements);
  JS_ASSIGN_PROP_READONLY(proto, geometryElementCount);
  JS_ASSIGN_PROP(proto, levelsOfDetail);
#if SCN_ENABLE_METAL
  JS_ASSIGN_PROP(proto, tessellator);
#endif
  JS_ASSIGN_PROP(proto, subdivisionLevel);
  JS_ASSIGN_PROP(proto, wantsAdaptiveSubdivision);
  JS_ASSIGN_PROP(proto, edgeCreasesElement);
  JS_ASSIGN_PROP(proto, edgeCreasesSource);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNGeometry::New) {
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `SCNGeometry(...)`, turn into construct call.
      JS_SET_RETURN_NEW(SCNGeometry, info);
      return;
    }
    SCNGeometry* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge SCNGeometry *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNGeometry alloc] init];
    }
    if (self) {
      NSCNGeometry *wrapper = new NSCNGeometry();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNGeometry::New: invalid arguments");
    }
  }
}

NSCNGeometry::NSCNGeometry () {}
NSCNGeometry::~NSCNGeometry () {}

NAN_GETTER(NSCNGeometry::nameGetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSString([self name]));
    return;
  }
}

NAN_SETTER(NSCNGeometry::nameSetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    [self setName: to_value_NSString(value)];
  }
}

NAN_GETTER(NSCNGeometry::materialsGetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray<SCNMaterial* >([self materials]));
    return;
  }
}

NAN_SETTER(NSCNGeometry::materialsSetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    [self setMaterials: to_value_NSArray<SCNMaterial* >(value)];
  }
}

#include "NSCNMaterial.h"

NAN_GETTER(NSCNGeometry::firstMaterialGetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMaterial([self firstMaterial]));
    return;
  }
}

NAN_SETTER(NSCNGeometry::firstMaterialSetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    [self setFirstMaterial: to_value_SCNMaterial(value)];
  }
}

NAN_GETTER(NSCNGeometry::geometrySourcesGetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray<SCNGeometrySource* >([self geometrySources]));
    return;
  }
}

NAN_GETTER(NSCNGeometry::geometryElementsGetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray<SCNGeometryElement* >([self geometryElements]));
    return;
  }
}

NAN_GETTER(NSCNGeometry::geometryElementCountGetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self geometryElementCount]));
    return;
  }
}

NAN_GETTER(NSCNGeometry::levelsOfDetailGetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray<SCNLevelOfDetail* >([self levelsOfDetail]));
    return;
  }
}

NAN_SETTER(NSCNGeometry::levelsOfDetailSetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    [self setLevelsOfDetail: to_value_NSArray<SCNLevelOfDetail* >(value)];
  }
}

#if SCN_ENABLE_METAL
#define js_value_SCNGeometryTessellator(x) js_value_wrapper_unknown(x, SCNGeometryTessellator)
#define to_value_SCNGeometryTessellator(x) to_value_wrapper_unknown(x, SCNGeometryTessellator)
#define is_value_SCNGeometryTessellator(x) is_value_wrapper_unknown(x, SCNGeometryTessellator)

NAN_GETTER(NSCNGeometry::tessellatorGetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNGeometryTessellator([self tessellator]));
    return;
  }
}

NAN_SETTER(NSCNGeometry::tessellatorSetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    [self setTessellator: to_value_SCNGeometryTessellator(value)];
  }
}
#endif

NAN_GETTER(NSCNGeometry::subdivisionLevelGetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSUInteger([self subdivisionLevel]));
    return;
  }
}

NAN_SETTER(NSCNGeometry::subdivisionLevelSetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    [self setSubdivisionLevel: to_value_NSUInteger(value)];
  }
}

NAN_GETTER(NSCNGeometry::wantsAdaptiveSubdivisionGetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self wantsAdaptiveSubdivision]));
    return;
  }
}

NAN_SETTER(NSCNGeometry::wantsAdaptiveSubdivisionSetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    [self setWantsAdaptiveSubdivision: TO_BOOL(value)];
  }
}

#define js_value_SCNGeometryElement(x) js_value_wrapper_unknown(x, SCNGeometryElement)
#define to_value_SCNGeometryElement(x) to_value_wrapper_unknown(x, SCNGeometryElement)
#define is_value_SCNGeometryElement(x) is_value_wrapper_unknown(x, SCNGeometryElement)

NAN_GETTER(NSCNGeometry::edgeCreasesElementGetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNGeometryElement([self edgeCreasesElement]));
    return;
  }
}

NAN_SETTER(NSCNGeometry::edgeCreasesElementSetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    [self setEdgeCreasesElement: to_value_SCNGeometryElement(value)];
  }
}

#define js_value_SCNGeometrySource(x) js_value_wrapper_unknown(x, SCNGeometrySource)
#define to_value_SCNGeometrySource(x) to_value_wrapper_unknown(x, SCNGeometrySource)
#define is_value_SCNGeometrySource(x) is_value_wrapper_unknown(x, SCNGeometrySource)

NAN_GETTER(NSCNGeometry::edgeCreasesSourceGetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNGeometrySource([self edgeCreasesSource]));
    return;
  }
}

NAN_SETTER(NSCNGeometry::edgeCreasesSourceSetter) {
  JS_UNWRAP(SCNGeometry, self);
  @autoreleasepool
  {
    [self setEdgeCreasesSource: to_value_SCNGeometrySource(value)];
  }
}
