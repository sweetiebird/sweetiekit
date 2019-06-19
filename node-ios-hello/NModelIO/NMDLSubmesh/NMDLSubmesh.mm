//
//  NMDLSubmesh.mm
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLSubmesh.h"

#include "NMDLTypes.h"

#define instancetype MDLSubmesh
#define js_value_instancetype js_value_MDLSubmesh

NMDLSubmesh::NMDLSubmesh() {}
NMDLSubmesh::~NMDLSubmesh() {}

JS_INIT_CLASS(MDLSubmesh, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(indexBufferAsIndexType);
  JS_ASSIGN_PROTO_PROP_READONLY(indexBuffer);
  JS_ASSIGN_PROTO_PROP_READONLY(indexCount);
  JS_ASSIGN_PROTO_PROP_READONLY(indexType);
  JS_ASSIGN_PROTO_PROP_READONLY(geometryType);
  JS_ASSIGN_PROTO_PROP(material);
  JS_ASSIGN_PROTO_PROP(topology);
  JS_ASSIGN_PROTO_PROP(name);

  // static members (ctor)
  JS_INIT_CTOR(MDLSubmesh, NSObject);
#if TODO
  JS_ASSIGN_PROTO_METHOD(initWithName);
  JS_ASSIGN_PROTO_METHOD(initWithIndexBuffer);
  JS_ASSIGN_PROTO_METHOD(initWithName);
  JS_ASSIGN_PROTO_METHOD(initWithMDLSubmesh);
#endif
  JS_ASSIGN_STATIC_METHOD(submeshWithSCNGeometryElement);
  JS_ASSIGN_STATIC_METHOD(submeshWithSCNGeometryElementBufferAllocator);
JS_INIT_CLASS_END(MDLSubmesh, NSObject);

NAN_METHOD(NMDLSubmesh::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLSubmesh(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLSubmesh, info);
      return;
    }

    MDLSubmesh* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLSubmesh *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLSubmesh alloc] init];
    }
    if (self) {
      NMDLSubmesh *wrapper = new NMDLSubmesh();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLSubmesh::New: invalid arguments");
    }
  }
}

#include <SceneKit/ModelIO.h>
#include "NSCNGeometry.h"

NAN_METHOD(NMDLSubmesh::submeshWithSCNGeometryElement) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNGeometryElement, scnGeometryElement);
    JS_SET_RETURN(js_value_instancetype([MDLSubmesh submeshWithSCNGeometryElement: scnGeometryElement]));
  }
}

NAN_METHOD(NMDLSubmesh::submeshWithSCNGeometryElementBufferAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNGeometryElement, scnGeometryElement);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, bufferAllocator);
    JS_SET_RETURN(js_value_instancetype([MDLSubmesh submeshWithSCNGeometryElement: scnGeometryElement bufferAllocator: bufferAllocator]));
  }
}

#if TODO
NAN_METHOD(NMDLSubmesh::initWithName) {
  JS_UNWRAP_OR_ALLOC(MDLSubmesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    JS_SET_RETURN(js_value_instancetype([self initWithName: name]));
  }
}

NAN_METHOD(NMDLSubmesh::initWithIndexBuffer) {
  JS_UNWRAP_OR_ALLOC(MDLSubmesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id<MDLMeshBuffer>, indexBuffer);
    JS_SET_RETURN(js_value_instancetype([self initWithIndexBuffer: indexBuffer]));
  }
}

NAN_METHOD(NMDLSubmesh::initWithName) {
  JS_UNWRAP_OR_ALLOC(MDLSubmesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    JS_SET_RETURN(js_value_instancetype([self initWithName: name]));
  }
}

NAN_METHOD(NMDLSubmesh::initWithMDLSubmesh) {
  JS_UNWRAP_OR_ALLOC(MDLSubmesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(nonnull-MDLSubmesh, submesh);
    JS_SET_RETURN(js_value_instancetype([self initWithMDLSubmesh: submesh]));
  }
}
#endif

NAN_METHOD(NMDLSubmesh::indexBufferAsIndexType) {
  JS_UNWRAP(MDLSubmesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MDLIndexBitDepth, indexType);
    JS_SET_RETURN(js_value_id/* <MDLMeshBuffer>*/([self indexBufferAsIndexType: indexType]));
  }
}

NAN_GETTER(NMDLSubmesh::indexBufferGetter) {
  JS_UNWRAP(MDLSubmesh, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MDLMeshBuffer>*/([self indexBuffer]));
  }
}

NAN_GETTER(NMDLSubmesh::indexCountGetter) {
  JS_UNWRAP(MDLSubmesh, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self indexCount]));
  }
}

NAN_GETTER(NMDLSubmesh::indexTypeGetter) {
  JS_UNWRAP(MDLSubmesh, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLIndexBitDepth([self indexType]));
  }
}

NAN_GETTER(NMDLSubmesh::geometryTypeGetter) {
  JS_UNWRAP(MDLSubmesh, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLGeometryType([self geometryType]));
  }
}

#include "NMDLMaterial.h"

NAN_GETTER(NMDLSubmesh::materialGetter) {
  JS_UNWRAP(MDLSubmesh, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMaterial([self material]));
  }
}

NAN_SETTER(NMDLSubmesh::materialSetter) {
  JS_UNWRAP(MDLSubmesh, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MDLMaterial, input);
    [self setMaterial: input];
  }
}

#include "NMDLSubmeshTopology.h"

NAN_GETTER(NMDLSubmesh::topologyGetter) {
  JS_UNWRAP(MDLSubmesh, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLSubmeshTopology([self topology]));
  }
}

NAN_SETTER(NMDLSubmesh::topologySetter) {
  JS_UNWRAP(MDLSubmesh, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MDLSubmeshTopology, input);
    [self setTopology: input];
  }
}

NAN_GETTER(NMDLSubmesh::nameGetter) {
  JS_UNWRAP(MDLSubmesh, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NMDLSubmesh::nameSetter) {
  JS_UNWRAP(MDLSubmesh, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}

