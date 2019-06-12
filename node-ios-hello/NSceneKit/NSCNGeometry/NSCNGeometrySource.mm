//
//  NSCNGeometrySource.mm
//
//  Created by Emily Kolar on 6/10/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNGeometry.h"

#define instancetype SCNGeometrySource
#define js_value_instancetype js_value_SCNGeometrySource

NSCNGeometrySource::NSCNGeometrySource () {}
NSCNGeometrySource::~NSCNGeometrySource () {}

JS_INIT_CLASS(SCNGeometrySource, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP_READONLY(data);
  JS_ASSIGN_PROTO_PROP_READONLY(semantic);
  JS_ASSIGN_PROTO_PROP_READONLY(vectorCount);
  JS_ASSIGN_PROTO_PROP_READONLY(floatComponents);
  JS_ASSIGN_PROTO_PROP_READONLY(componentsPerVector);
  JS_ASSIGN_PROTO_PROP_READONLY(bytesPerComponent);
  JS_ASSIGN_PROTO_PROP_READONLY(dataOffset);
  JS_ASSIGN_PROTO_PROP_READONLY(dataStride);
  // static members (ctor)
  JS_INIT_CTOR(SCNGeometrySource, NSObject);
  JS_ASSIGN_STATIC_METHOD(geometrySourceWithDataSemanticVectorCountFloatComponentsComponentsPerVectorBytesPerComponentDataOffsetDataStride);
  JS_ASSIGN_STATIC_METHOD(geometrySourceWithVerticesCount);
  JS_ASSIGN_STATIC_METHOD(geometrySourceWithNormalsCount);
  JS_ASSIGN_STATIC_METHOD(geometrySourceWithTextureCoordinatesCount);
#if SCN_ENABLE_METAL
  JS_ASSIGN_STATIC_METHOD(geometrySourceWithBufferVertexFormatSemanticVertexCountDataOffsetDataStride);
#endif

JS_INIT_CLASS_END(SCNGeometrySource, NSObject);

NAN_METHOD(NSCNGeometrySource::New) {
  JS_RECONSTRUCT(SCNGeometrySource);
  @autoreleasepool {
    SCNGeometrySource* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNGeometrySource *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNGeometrySource alloc] init];
    }
    if (self) {
      NSCNGeometrySource *wrapper = new NSCNGeometrySource();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNGeometrySource::New: invalid arguments");
    }
  }
}

NAN_METHOD(NSCNGeometrySource::geometrySourceWithDataSemanticVectorCountFloatComponentsComponentsPerVectorBytesPerComponentDataOffsetDataStride) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_value(SCNGeometrySourceSemantic, semantic);
    declare_value(NSInteger, vectorCount);
    declare_value(BOOL, floatComponents);
    declare_value(NSInteger, componentsPerVector);
    declare_value(NSInteger, bytesPerComponent);
    declare_value(NSInteger, offset);
    declare_value(NSInteger, stride);
    JS_SET_RETURN(js_value_instancetype([SCNGeometrySource geometrySourceWithData: data semantic: semantic vectorCount: vectorCount floatComponents: floatComponents componentsPerVector: componentsPerVector bytesPerComponent: bytesPerComponent dataOffset: offset dataStride: stride]));
  }
}

NAN_METHOD(NSCNGeometrySource::geometrySourceWithVerticesCount) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, vertices);
    declare_value(NSInteger, count);

    const SCNVector3* bytes = (const SCNVector3 *)[vertices bytes];
    JS_SET_RETURN(js_value_instancetype([SCNGeometrySource geometrySourceWithVertices: bytes count: count]));
  }
}

NAN_METHOD(NSCNGeometrySource::geometrySourceWithNormalsCount) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, normals);
    declare_value(NSInteger, count);

    const SCNVector3* bytes = (const SCNVector3 *)[normals bytes];
    JS_SET_RETURN(js_value_instancetype([SCNGeometrySource geometrySourceWithNormals: bytes count: count]));
  }
}

NAN_METHOD(NSCNGeometrySource::geometrySourceWithTextureCoordinatesCount) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, texcoord);
    declare_value(NSInteger, count);

    const CGPoint* bytes = (const CGPoint *)[texcoord bytes];
    JS_SET_RETURN(js_value_instancetype([SCNGeometrySource geometrySourceWithTextureCoordinates: bytes count: count]));
  }
}

#if SCN_ENABLE_METAL
NAN_METHOD(NSCNGeometrySource::geometrySourceWithBufferVertexFormatSemanticVertexCountDataOffsetDataStride) {
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MTLBuffer>*/, mtlBuffer);
    declare_value(MTLVertexFormat, vertexFormat);
    declare_value(SCNGeometrySourceSemantic, semantic);
    declare_value(NSInteger, vertexCount);
    declare_value(NSInteger, offset);
    declare_value(NSInteger, stride);
    JS_SET_RETURN(js_value_instancetype([SCNGeometrySource geometrySourceWithBuffer: mtlBuffer vertexFormat: vertexFormat semantic: semantic vertexCount: vertexCount dataOffset: offset dataStride: stride]));
  }
}
#endif

NAN_GETTER(NSCNGeometrySource::dataGetter) {
  JS_UNWRAP(SCNGeometrySource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self data]));
  }
}

NAN_GETTER(NSCNGeometrySource::semanticGetter) {
  JS_UNWRAP(SCNGeometrySource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNGeometrySourceSemantic([self semantic]));
  }
}

NAN_GETTER(NSCNGeometrySource::vectorCountGetter) {
  JS_UNWRAP(SCNGeometrySource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self vectorCount]));
  }
}

NAN_GETTER(NSCNGeometrySource::floatComponentsGetter) {
  JS_UNWRAP(SCNGeometrySource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self floatComponents]));
  }
}

NAN_GETTER(NSCNGeometrySource::componentsPerVectorGetter) {
  JS_UNWRAP(SCNGeometrySource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self componentsPerVector]));
  }
}

NAN_GETTER(NSCNGeometrySource::bytesPerComponentGetter) {
  JS_UNWRAP(SCNGeometrySource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self bytesPerComponent]));
  }
}

NAN_GETTER(NSCNGeometrySource::dataOffsetGetter) {
  JS_UNWRAP(SCNGeometrySource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self dataOffset]));
  }
}

NAN_GETTER(NSCNGeometrySource::dataStrideGetter) {
  JS_UNWRAP(SCNGeometrySource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self dataStride]));
  }
}
