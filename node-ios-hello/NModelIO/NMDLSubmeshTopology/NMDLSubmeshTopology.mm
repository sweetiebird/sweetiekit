//
//  NMDLSubmeshTopology.mm
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLSubmeshTopology.h"

#define instancetype MDLSubmeshTopology
#define js_value_instancetype js_value_MDLSubmeshTopology

NMDLSubmeshTopology::NMDLSubmeshTopology() {}
NMDLSubmeshTopology::~NMDLSubmeshTopology() {}

JS_INIT_CLASS(MDLSubmeshTopology, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(faceTopology);
  JS_ASSIGN_PROTO_PROP(faceCount);
  JS_ASSIGN_PROTO_PROP(vertexCreaseIndices);
  JS_ASSIGN_PROTO_PROP(vertexCreases);
  JS_ASSIGN_PROTO_PROP(vertexCreaseCount);
  JS_ASSIGN_PROTO_PROP(edgeCreaseIndices);
  JS_ASSIGN_PROTO_PROP(edgeCreases);
  JS_ASSIGN_PROTO_PROP(edgeCreaseCount);
  JS_ASSIGN_PROTO_PROP(holes);
  JS_ASSIGN_PROTO_PROP(holeCount);
  // static members (ctor)
  JS_INIT_CTOR(MDLSubmeshTopology, NSObject);
  JS_ASSIGN_STATIC_METHOD(initWithSubmesh);
JS_INIT_CLASS_END(MDLSubmeshTopology, NSObject);

NAN_METHOD(NMDLSubmeshTopology::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLSubmeshTopology(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLSubmeshTopology, info);
      return;
    }

    MDLSubmeshTopology* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLSubmeshTopology *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLSubmeshTopology alloc] init];
    }
    if (self) {
      NMDLSubmeshTopology *wrapper = new NMDLSubmeshTopology();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLSubmeshTopology::New: invalid arguments");
    }
  }
}

#include "NMDLSubmesh.h"

NAN_METHOD(NMDLSubmeshTopology::initWithSubmesh) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLSubmesh, submesh);
    JS_SET_RETURN(js_value_instancetype([[MDLSubmeshTopology alloc] initWithSubmesh: submesh]));
  }
}

NAN_GETTER(NMDLSubmeshTopology::faceTopologyGetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MDLMeshBuffer>*/([self faceTopology]));
  }
}

NAN_SETTER(NMDLSubmeshTopology::faceTopologySetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <MDLMeshBuffer>*/, input);
    [self setFaceTopology: input];
  }
}

NAN_GETTER(NMDLSubmeshTopology::faceCountGetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self faceCount]));
  }
}

NAN_SETTER(NMDLSubmeshTopology::faceCountSetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setFaceCount: input];
  }
}

NAN_GETTER(NMDLSubmeshTopology::vertexCreaseIndicesGetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MDLMeshBuffer>*/([self vertexCreaseIndices]));
  }
}

NAN_SETTER(NMDLSubmeshTopology::vertexCreaseIndicesSetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <MDLMeshBuffer>*/, input);
    [self setVertexCreaseIndices: input];
  }
}

NAN_GETTER(NMDLSubmeshTopology::vertexCreasesGetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MDLMeshBuffer>*/([self vertexCreases]));
  }
}

NAN_SETTER(NMDLSubmeshTopology::vertexCreasesSetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <MDLMeshBuffer>*/, input);
    [self setVertexCreases: input];
  }
}

NAN_GETTER(NMDLSubmeshTopology::vertexCreaseCountGetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self vertexCreaseCount]));
  }
}

NAN_SETTER(NMDLSubmeshTopology::vertexCreaseCountSetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setVertexCreaseCount: input];
  }
}

NAN_GETTER(NMDLSubmeshTopology::edgeCreaseIndicesGetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MDLMeshBuffer>*/([self edgeCreaseIndices]));
  }
}

NAN_SETTER(NMDLSubmeshTopology::edgeCreaseIndicesSetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <MDLMeshBuffer>*/, input);
    [self setEdgeCreaseIndices: input];
  }
}

NAN_GETTER(NMDLSubmeshTopology::edgeCreasesGetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MDLMeshBuffer>*/([self edgeCreases]));
  }
}

NAN_SETTER(NMDLSubmeshTopology::edgeCreasesSetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <MDLMeshBuffer>*/, input);
    [self setEdgeCreases: input];
  }
}

NAN_GETTER(NMDLSubmeshTopology::edgeCreaseCountGetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self edgeCreaseCount]));
  }
}

NAN_SETTER(NMDLSubmeshTopology::edgeCreaseCountSetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setEdgeCreaseCount: input];
  }
}

NAN_GETTER(NMDLSubmeshTopology::holesGetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MDLMeshBuffer>*/([self holes]));
  }
}

NAN_SETTER(NMDLSubmeshTopology::holesSetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <MDLMeshBuffer>*/, input);
    [self setHoles: input];
  }
}

NAN_GETTER(NMDLSubmeshTopology::holeCountGetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self holeCount]));
  }
}

NAN_SETTER(NMDLSubmeshTopology::holeCountSetter) {
  JS_UNWRAP(MDLSubmeshTopology, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setHoleCount: input];
  }
}
