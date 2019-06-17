//
//  NMDLMaterial.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLMaterial.h"

#define instancetype MDLMaterial
#define js_value_instancetype js_value_MDLMaterial

NMDLMaterial::NMDLMaterial() {}
NMDLMaterial::~NMDLMaterial() {}

JS_INIT_CLASS(MDLMaterial, NSObject);
  // instance members (proto)
#if TODO
// MDLMaterialPropertyConnection
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_STATIC_METHOD(initWithOutput);
// MDLMaterialPropertyNode
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_STATIC_METHOD(initWithInputs);
// MDLMaterialPropertyGraph
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_STATIC_METHOD(initWithNodes);
  JS_ASSIGN_PROTO_METHOD(evaluate);
#endif
// MDLMaterial
  JS_ASSIGN_PROTO_METHOD(setProperty);
  JS_ASSIGN_PROTO_METHOD(removeProperty);
  JS_ASSIGN_PROTO_METHOD(propertyNamed);
  JS_ASSIGN_PROTO_METHOD(propertyWithSemantic);
  JS_ASSIGN_PROTO_METHOD(propertiesWithSemantic);
  JS_ASSIGN_PROTO_METHOD(removeAllProperties);
  JS_ASSIGN_PROTO_METHOD(resolveTexturesWithResolver);
  JS_ASSIGN_PROTO_METHOD(loadTexturesUsingResolver);
  JS_ASSIGN_PROTO_METHOD(objectAtIndexedSubscript);
  JS_ASSIGN_PROTO_METHOD(objectForKeyedSubscript);
#if TODO
// MDLMaterialPropertyConnection
  JS_ASSIGN_PROTO_PROP_READONLY(output);
  JS_ASSIGN_PROTO_PROP_READONLY(input);
// MDLMaterialPropertyNode
  JS_ASSIGN_PROTO_PROP(MDLMaterialPropertyNode());
  JS_ASSIGN_PROTO_PROP_READONLY(inputs);
  JS_ASSIGN_PROTO_PROP_READONLY(outputs);
// MDLMaterialPropertyGraph
  JS_ASSIGN_PROTO_PROP_READONLY(nodes);
  JS_ASSIGN_PROTO_PROP_READONLY(connections);
#endif
// MDLMaterial
  JS_ASSIGN_PROTO_PROP_READONLY(scatteringFunction);
  JS_ASSIGN_PROTO_PROP(name);
  JS_ASSIGN_PROTO_PROP(baseMaterial);
  JS_ASSIGN_PROTO_PROP_READONLY(count);
  JS_ASSIGN_PROTO_PROP(materialFace);

  // static members (ctor)
  JS_INIT_CTOR(MDLMaterial, NSObject);
  JS_ASSIGN_STATIC_METHOD(initWithNameScatteringFunction);
  
  JS_ASSIGN_STATIC_METHOD(materialWithSCNMaterial);
JS_INIT_CLASS_END(MDLMaterial, NSObject);

NAN_METHOD(NMDLMaterial::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLMaterial(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLMaterial, info);
      return;
    }

    MDLMaterial* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLMaterial *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLMaterial alloc] init];
    }
    if (self) {
      NMDLMaterial *wrapper = new NMDLMaterial();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLMaterial::New: invalid arguments");
    }
  }
}

#if TODO
NAN_METHOD(NMDLMaterialPropertyConnection::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[MDLMaterialPropertyConnection alloc] init]));
  }
}

NAN_METHOD(NMDLMaterialPropertyConnection::initWithOutput) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLMaterialProperty, output);
    JS_SET_RETURN(js_value_instancetype([[MDLMaterialPropertyConnection alloc] initWithOutput: output]));
  }
}

NAN_METHOD(NMDLMaterialPropertyNode::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[MDLMaterialPropertyNode alloc] init]));
  }
}

NAN_METHOD(NMDLMaterialPropertyNode::initWithInputs) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<MDLMaterialProperty*>, inputs);
    JS_SET_RETURN(js_value_instancetype([[MDLMaterialPropertyNode alloc] initWithInputs: inputs]));
  }
}

NAN_METHOD(NMDLMaterialPropertyGraph::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[MDLMaterialPropertyGraph alloc] init]));
  }
}

NAN_METHOD(NMDLMaterialPropertyGraph::initWithNodes) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<MDLMaterialPropertyNode*>, nodes);
    JS_SET_RETURN(js_value_instancetype([[MDLMaterialPropertyGraph alloc] initWithNodes: nodes]));
  }
}

NAN_METHOD(NMDLMaterialPropertyGraph::evaluate) {
  JS_UNWRAP(MDLMaterialPropertyGraph, self);
  declare_autoreleasepool {
    [self evaluate];
  }
}
#endif

#include "NMDLScatteringFunction.h"

NAN_METHOD(NMDLMaterial::initWithNameScatteringFunction) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_pointer(MDLScatteringFunction, scatteringFunction);
    JS_SET_RETURN(js_value_instancetype([[MDLMaterial alloc] initWithName: name scatteringFunction: scatteringFunction]));
  }
}

#include "NMDLMaterialProperty.h"

NAN_METHOD(NMDLMaterial::setProperty) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLMaterialProperty, property);
    [self setProperty: property];
  }
}

NAN_METHOD(NMDLMaterial::removeProperty) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLMaterialProperty, property);
    [self removeProperty: property];
  }
}

NAN_METHOD(NMDLMaterial::propertyNamed) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    JS_SET_RETURN(js_value_MDLMaterialProperty([self propertyNamed: name]));
  }
}

NAN_METHOD(NMDLMaterial::propertyWithSemantic) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MDLMaterialSemantic, semantic);
    JS_SET_RETURN(js_value_MDLMaterialProperty([self propertyWithSemantic: semantic]));
  }
}

NAN_METHOD(NMDLMaterial::propertiesWithSemantic) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MDLMaterialSemantic, semantic);
    JS_SET_RETURN(js_value_NSArray<MDLMaterialProperty*>([self propertiesWithSemantic: semantic]));
  }
}

NAN_METHOD(NMDLMaterial::removeAllProperties) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    [self removeAllProperties];
  }
}

NAN_METHOD(NMDLMaterial::resolveTexturesWithResolver) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id/* <MDLAssetResolver>*/, resolver);
    [self resolveTexturesWithResolver: resolver];
  }
}

NAN_METHOD(NMDLMaterial::loadTexturesUsingResolver) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id/* <MDLAssetResolver>*/, resolver);
    [self loadTexturesUsingResolver: resolver];
  }
}

NAN_METHOD(NMDLMaterial::objectAtIndexedSubscript) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, idx);
    JS_SET_RETURN(js_value_MDLMaterialProperty([self objectAtIndexedSubscript: idx]));
  }
}

NAN_METHOD(NMDLMaterial::objectForKeyedSubscript) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    JS_SET_RETURN(js_value_MDLMaterialProperty([self objectForKeyedSubscript: name]));
  }
}

#if TODO

NAN_GETTER(NMDLMaterialPropertyConnection::outputGetter) {
  JS_UNWRAP(MDLMaterialPropertyConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self output]));
  }
}

NAN_GETTER(NMDLMaterialPropertyConnection::inputGetter) {
  JS_UNWRAP(MDLMaterialPropertyConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialProperty([self input]));
  }
}

NAN_GETTER(NMDLMaterialPropertyNode::MDLMaterialPropertyNode()Getter) {
  JS_UNWRAP(MDLMaterialPropertyNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_void 94evaluationFunction([self MDLMaterialPropertyNode()]));
  }
}

NAN_SETTER(NMDLMaterialPropertyNode::MDLMaterialPropertyNode()Setter) {
  JS_UNWRAP(MDLMaterialPropertyNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(void ^evaluationFunction, input);
    [self set-MDLMaterialPropertyNode: input];
  }
}

NAN_GETTER(NMDLMaterialPropertyNode::inputsGetter) {
  JS_UNWRAP(MDLMaterialPropertyNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<MDLMaterialProperty*>([self inputs]));
  }
}

NAN_GETTER(NMDLMaterialPropertyNode::outputsGetter) {
  JS_UNWRAP(MDLMaterialPropertyNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<MDLMaterialProperty*>([self outputs]));
  }
}

NAN_GETTER(NMDLMaterialPropertyGraph::nodesGetter) {
  JS_UNWRAP(MDLMaterialPropertyGraph, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<MDLMaterialPropertyNode*>([self nodes]));
  }
}

NAN_GETTER(NMDLMaterialPropertyGraph::connectionsGetter) {
  JS_UNWRAP(MDLMaterialPropertyGraph, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<MDLMaterialPropertyConnection*>([self connections]));
  }
}
#endif

NAN_GETTER(NMDLMaterial::scatteringFunctionGetter) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLScatteringFunction([self scatteringFunction]));
  }
}

NAN_GETTER(NMDLMaterial::nameGetter) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NMDLMaterial::nameSetter) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}

NAN_GETTER(NMDLMaterial::baseMaterialGetter) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterial([self baseMaterial]));
  }
}

NAN_SETTER(NMDLMaterial::baseMaterialSetter) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MDLMaterial, input);
    [self setBaseMaterial: input];
  }
}

NAN_GETTER(NMDLMaterial::countGetter) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self count]));
  }
}

NAN_GETTER(NMDLMaterial::materialFaceGetter) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterialFace([self materialFace]));
  }
}

NAN_SETTER(NMDLMaterial::materialFaceSetter) {
  JS_UNWRAP(MDLMaterial, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MDLMaterialFace, input);
    [self setMaterialFace: input];
  }
}

#include <SceneKit/ModelIO.h>
#include "NSCNMaterial.h"

NAN_METHOD(NMDLMaterial::materialWithSCNMaterial) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNMaterial, scnMaterial);
    JS_SET_RETURN(js_value_instancetype([MDLMaterial materialWithSCNMaterial: scnMaterial]));
  }
}