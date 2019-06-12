//
//  SCNGeometry.mm
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNGeometry.h"

#define instancetype SCNGeometry
#define js_value_instancetype js_value_SCNGeometry

NSCNGeometry::NSCNGeometry () {}
NSCNGeometry::~NSCNGeometry () {}

JS_INIT_CLASS(SCNGeometry, NSObject);
  // instance members (proto)
// SCNGeometry
  JS_ASSIGN_PROTO_METHOD(insertMaterialAtIndex);
  JS_ASSIGN_PROTO_METHOD(removeMaterialAtIndex);
  JS_ASSIGN_PROTO_METHOD(replaceMaterialAtIndexWithMaterial);
  JS_ASSIGN_PROTO_METHOD(materialWithName);
  JS_ASSIGN_PROTO_METHOD(geometrySourcesForSemantic);
  JS_ASSIGN_PROTO_METHOD(geometryElementAtIndex);
  JS_ASSIGN_PROTO_PROP(name);
  JS_ASSIGN_PROTO_PROP(materials);
  JS_ASSIGN_PROTO_PROP(firstMaterial);
  JS_ASSIGN_PROTO_PROP_READONLY(geometrySources);
  JS_ASSIGN_PROTO_PROP_READONLY(geometryElements);
  JS_ASSIGN_PROTO_PROP_READONLY(geometryElementCount);
  JS_ASSIGN_PROTO_PROP(levelsOfDetail);
#if SCN_ENABLE_METAL
  JS_ASSIGN_PROTO_PROP(tessellator);
#endif
  JS_ASSIGN_PROTO_PROP(subdivisionLevel);
  JS_ASSIGN_PROTO_PROP(wantsAdaptiveSubdivision);
  JS_ASSIGN_PROTO_PROP(edgeCreasesElement);
  JS_ASSIGN_PROTO_PROP(edgeCreasesSource);
  // static members (ctor)
  JS_INIT_CTOR(SCNGeometry, NSObject);
  JS_ASSIGN_STATIC_METHOD(geometry);
  JS_ASSIGN_STATIC_METHOD(geometryWithSourcesElements);
  JS_ASSIGN_STATIC_METHOD(geometryWithMDLMesh);
JS_INIT_CLASS_END(SCNGeometry, NSObject);

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

NAN_METHOD(NSCNGeometry::geometry) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([SCNGeometry geometry]));
  }
}

NAN_METHOD(NSCNGeometry::geometryWithSourcesElements) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<SCNGeometrySource*>, sources);
    declare_nullable_pointer(NSArray<SCNGeometryElement*>, elements);
    JS_SET_RETURN(js_value_instancetype([SCNGeometry geometryWithSources: sources elements: elements]));
  }
}

#include "NSCNMaterial.h"

NAN_METHOD(NSCNGeometry::insertMaterialAtIndex) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNMaterial, material);
    declare_value(NSUInteger, index);
    [self insertMaterial: material atIndex: index];
  }
}

NAN_METHOD(NSCNGeometry::removeMaterialAtIndex) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, index);
    [self removeMaterialAtIndex: index];
  }
}

NAN_METHOD(NSCNGeometry::replaceMaterialAtIndexWithMaterial) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, index);
    declare_pointer(SCNMaterial, material);
    [self replaceMaterialAtIndex: index withMaterial: material];
  }
}

NAN_METHOD(NSCNGeometry::materialWithName) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    JS_SET_RETURN(js_value_SCNMaterial([self materialWithName: name]));
  }
}

NAN_METHOD(NSCNGeometry::geometrySourcesForSemantic) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNGeometrySourceSemantic, semantic);
    JS_SET_RETURN(js_value_NSArray<SCNGeometrySource*>([self geometrySourcesForSemantic: semantic]));
  }
}

NAN_METHOD(NSCNGeometry::geometryElementAtIndex) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, elementIndex);
    JS_SET_RETURN(js_value_SCNGeometryElement([self geometryElementAtIndex: elementIndex]));
  }
}

NAN_GETTER(NSCNGeometry::nameGetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NSCNGeometry::nameSetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}

NAN_GETTER(NSCNGeometry::materialsGetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SCNMaterial*>([self materials]));
  }
}

NAN_SETTER(NSCNGeometry::materialsSetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<SCNMaterial*>, input);
    [self setMaterials: input];
  }
}

NAN_GETTER(NSCNGeometry::firstMaterialGetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNMaterial([self firstMaterial]));
  }
}

NAN_SETTER(NSCNGeometry::firstMaterialSetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNMaterial, input);
    [self setFirstMaterial: input];
  }
}

NAN_GETTER(NSCNGeometry::geometrySourcesGetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SCNGeometrySource*>([self geometrySources]));
  }
}

NAN_GETTER(NSCNGeometry::geometryElementsGetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SCNGeometryElement*>([self geometryElements]));
  }
}

NAN_GETTER(NSCNGeometry::geometryElementCountGetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self geometryElementCount]));
  }
}

NAN_GETTER(NSCNGeometry::levelsOfDetailGetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SCNLevelOfDetail*>([self levelsOfDetail]));
  }
}

NAN_SETTER(NSCNGeometry::levelsOfDetailSetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<SCNLevelOfDetail*>, input);
    [self setLevelsOfDetail: input];
  }
}

#if SCN_ENABLE_METAL
NAN_GETTER(NSCNGeometry::tessellatorGetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNGeometryTessellator([self tessellator]));
  }
}

NAN_SETTER(NSCNGeometry::tessellatorSetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNGeometryTessellator, input);
    [self setTessellator: input];
  }
}
#endif

NAN_GETTER(NSCNGeometry::subdivisionLevelGetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self subdivisionLevel]));
  }
}

NAN_SETTER(NSCNGeometry::subdivisionLevelSetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setSubdivisionLevel: input];
  }
}

NAN_GETTER(NSCNGeometry::wantsAdaptiveSubdivisionGetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self wantsAdaptiveSubdivision]));
  }
}

NAN_SETTER(NSCNGeometry::wantsAdaptiveSubdivisionSetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setWantsAdaptiveSubdivision: input];
  }
}

NAN_GETTER(NSCNGeometry::edgeCreasesElementGetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNGeometryElement([self edgeCreasesElement]));
  }
}

NAN_SETTER(NSCNGeometry::edgeCreasesElementSetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNGeometryElement, input);
    [self setEdgeCreasesElement: input];
  }
}

NAN_GETTER(NSCNGeometry::edgeCreasesSourceGetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNGeometrySource([self edgeCreasesSource]));
  }
}

NAN_SETTER(NSCNGeometry::edgeCreasesSourceSetter) {
  JS_UNWRAP(SCNGeometry, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNGeometrySource, input);
    [self setEdgeCreasesSource: input];
  }
}

#include <SceneKit/ModelIO.h>
#include "NMDLMesh.h"

NAN_METHOD(NSCNGeometry::geometryWithMDLMesh) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLMesh, mdlMesh);
    JS_SET_RETURN(js_value_instancetype([SCNGeometry geometryWithMDLMesh: mdlMesh]));
  }
}
