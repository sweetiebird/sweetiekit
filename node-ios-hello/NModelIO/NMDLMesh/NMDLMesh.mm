//
//  NMDLMesh.mm
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLMesh.h"

#define instancetype MDLMesh
#define js_value_instancetype js_value_MDLMesh

NMDLMesh::NMDLMesh() {}
NMDLMesh::~NMDLMesh() {}

JS_INIT_CLASS(MDLMesh, MDLObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(vertexAttributeDataForAttributeNamed);
  JS_ASSIGN_PROTO_METHOD(vertexAttributeDataForAttributeNamedAsFormat);
  JS_ASSIGN_PROTO_METHOD(addAttributeWithNameFormat);
  JS_ASSIGN_PROTO_METHOD(addAttributeWithNameFormatTypeDataStride);
  JS_ASSIGN_PROTO_METHOD(addAttributeWithNameFormatTypeDataStrideTime);
  JS_ASSIGN_PROTO_METHOD(addNormalsWithAttributeNamedCreaseThreshold);
  JS_ASSIGN_PROTO_METHOD(addTangentBasisForTextureCoordinateAttributeNamedTangentAttributeNameBitangentAttributeName);
  JS_ASSIGN_PROTO_METHOD(addTangentBasisForTextureCoordinateAttributeNamedNormalAttributeNamedTangentAttributeNamed);
  JS_ASSIGN_PROTO_METHOD(addOrthTanBasisForTextureCoordinateAttributeNamedNormalAttributeNamedTangentAttributeNamed);
  JS_ASSIGN_PROTO_METHOD(addUnwrappedTextureCoordinatesForAttributeNamed);
  JS_ASSIGN_PROTO_METHOD(flipTextureCoordinatesInAttributeNamed);
  JS_ASSIGN_PROTO_METHOD(makeVerticesUnique);
  JS_ASSIGN_PROTO_METHOD(makeVerticesUniqueAndReturnError);
  JS_ASSIGN_PROTO_METHOD(replaceAttributeNamed);
  JS_ASSIGN_PROTO_METHOD(updateAttributeNamed);
  JS_ASSIGN_PROTO_METHOD(removeAttributeNamed);
#if TODO
  JS_ASSIGN_PROTO_METHOD(generateAmbientOcclusionTextureWithSize);
  JS_ASSIGN_PROTO_METHOD(generateAmbientOcclusionTextureWithQuality);
  JS_ASSIGN_PROTO_METHOD(generateAmbientOcclusionVertexColorsWithRaysPerSample);
  JS_ASSIGN_PROTO_METHOD(generateAmbientOcclusionVertexColorsWithQuality);
  JS_ASSIGN_PROTO_METHOD(generateLightMapTextureWithTextureSize);
  JS_ASSIGN_PROTO_METHOD(generateLightMapTextureWithQuality);
  JS_ASSIGN_PROTO_METHOD(generateLightMapVertexColorsWithLightsToConsider);
#endif
#if TODO
// MDLVertexAttributeData
  JS_ASSIGN_PROTO_PROP(map);
  JS_ASSIGN_PROTO_PROP(dataStart);
  JS_ASSIGN_PROTO_PROP(stride);
  JS_ASSIGN_PROTO_PROP(format);
  JS_ASSIGN_PROTO_PROP(bufferSize);
#endif
// MDLMesh
  JS_ASSIGN_PROTO_PROP_READONLY(boundingBox);
  JS_ASSIGN_PROTO_PROP(vertexDescriptor);
  JS_ASSIGN_PROTO_PROP(vertexCount);
  JS_ASSIGN_PROTO_PROP(vertexBuffers);
  JS_ASSIGN_PROTO_PROP(submeshes);
  JS_ASSIGN_PROTO_PROP_READONLY(allocator);

  // static members (ctor)
  JS_INIT_CTOR(MDLMesh, MDLObject);
#if TODO
  JS_ASSIGN_STATIC_METHOD(newBoxWithDimensions);
  JS_ASSIGN_STATIC_METHOD(newEllipsoidWithRadii);
  JS_ASSIGN_STATIC_METHOD(newCylinderWithHeight);
  JS_ASSIGN_STATIC_METHOD(newCapsuleWithHeight);
  JS_ASSIGN_STATIC_METHOD(newEllipticalConeWithHeight);
  JS_ASSIGN_STATIC_METHOD(newPlaneWithDimensions);
  JS_ASSIGN_STATIC_METHOD(newIcosahedronWithRadius);
  JS_ASSIGN_STATIC_METHOD(newSubdividedMesh);
#endif
  JS_ASSIGN_STATIC_METHOD(initWithBufferAllocator);
  JS_ASSIGN_STATIC_METHOD(initWithVertexBuffer);
  JS_ASSIGN_STATIC_METHOD(initWithVertexBuffers);
#if TODO
  JS_ASSIGN_STATIC_METHOD(initBoxWithExtent);
  JS_ASSIGN_STATIC_METHOD(initSphereWithExtent);
  JS_ASSIGN_STATIC_METHOD(initHemisphereWithExtent);
  JS_ASSIGN_STATIC_METHOD(initCylinderWithExtent);
  JS_ASSIGN_STATIC_METHOD(initCapsuleWithExtent);
  JS_ASSIGN_STATIC_METHOD(initConeWithExtent);
  JS_ASSIGN_STATIC_METHOD(initPlaneWithExtent);
  JS_ASSIGN_STATIC_METHOD(initIcosahedronWithExtent);
  JS_ASSIGN_STATIC_METHOD(initMeshBySubdividingMesh);
#endif
  JS_ASSIGN_STATIC_METHOD(meshWithSCNGeometry);
  JS_ASSIGN_STATIC_METHOD(meshWithSCNGeometryBufferAllocator);
JS_INIT_CLASS_END(MDLMesh, MDLObject);

NAN_METHOD(NMDLMesh::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLMesh(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLMesh, info);
      return;
    }

    MDLMesh* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLMesh *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLMesh alloc] init];
    }
    if (self) {
      NMDLMesh *wrapper = new NMDLMesh();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLMesh::New: invalid arguments");
    }
  }
}

#if TODO
NAN_METHOD(NMDLMesh::newBoxWithDimensions) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, dimensions);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newBoxWithDimensions: dimensions]));
  }
}

NAN_METHOD(NMDLMesh::newEllipsoidWithRadii) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, radii);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newEllipsoidWithRadii: radii]));
  }
}

NAN_METHOD(NMDLMesh::newCylinderWithHeight) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, height);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newCylinderWithHeight: height]));
  }
}

NAN_METHOD(NMDLMesh::newCapsuleWithHeight) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, height);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newCapsuleWithHeight: height]));
  }
}

NAN_METHOD(NMDLMesh::newEllipticalConeWithHeight) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, height);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newEllipticalConeWithHeight: height]));
  }
}

NAN_METHOD(NMDLMesh::newPlaneWithDimensions) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float2, dimensions);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newPlaneWithDimensions: dimensions]));
  }
}

NAN_METHOD(NMDLMesh::newIcosahedronWithRadius) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, radius);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newIcosahedronWithRadius: radius]));
  }
}

NAN_METHOD(NMDLMesh::newIcosahedronWithRadius) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, radius);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newIcosahedronWithRadius: radius]));
  }
}

NAN_METHOD(NMDLMesh::newSubdividedMesh) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLMesh, mesh);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newSubdividedMesh: mesh]));
  }
}
#endif

NAN_METHOD(NMDLMesh::initWithBufferAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, bufferAllocator);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initWithBufferAllocator: bufferAllocator]));
  }
}

#include "NMDLVertexDescriptor.h"
#include "NMDLSubmesh.h"

NAN_METHOD(NMDLMesh::initWithVertexBuffer) {
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MDLMeshBuffer>*/, vertexBuffer);
    declare_value(NSUInteger, vertexCount);
    declare_pointer(MDLVertexDescriptor, descriptor);
    declare_pointer(NSArray<MDLSubmesh*>, submeshes);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initWithVertexBuffer: vertexBuffer
                         vertexCount:vertexCount
                          descriptor:descriptor
                           submeshes:submeshes]));
  }
}

NAN_METHOD(NMDLMesh::initWithVertexBuffers) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<id/* <MDLMeshBuffer>*/>, vertexBuffers);
    declare_value(NSUInteger, vertexCount);
    declare_pointer(MDLVertexDescriptor, descriptor);
    declare_pointer(NSArray<MDLSubmesh*>, submeshes);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initWithVertexBuffers: vertexBuffers
                          vertexCount:(NSUInteger)vertexCount
                           descriptor:(MDLVertexDescriptor *)descriptor
                            submeshes:(NSArray<MDLSubmesh*> *)submeshes]));
  }
}

#include "NMDLVertexAttributeData.h"

NAN_METHOD(NMDLMesh::vertexAttributeDataForAttributeNamed) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    JS_SET_RETURN(js_value_MDLVertexAttributeData([self vertexAttributeDataForAttributeNamed: name]));
  }
}

NAN_METHOD(NMDLMesh::vertexAttributeDataForAttributeNamedAsFormat) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(MDLVertexFormat, format);
    JS_SET_RETURN(js_value_MDLVertexAttributeData([self vertexAttributeDataForAttributeNamed: name asFormat: format]));
  }
}

NAN_METHOD(NMDLMesh::addAttributeWithNameFormat) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(MDLVertexFormat, format);
    [self addAttributeWithName: name format: format];
  }
}

NAN_METHOD(NMDLMesh::addAttributeWithNameFormatTypeDataStride) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(MDLVertexFormat, format);
    declare_pointer(NSString, type);
    declare_pointer(NSData, data);
    declare_value(NSInteger, stride);
    [self addAttributeWithName: name
                     format:(MDLVertexFormat)format
                       type:(NSString *)type
                       data:(NSData *)data
                     stride:(NSInteger)stride];
  }
}

NAN_METHOD(NMDLMesh::addAttributeWithNameFormatTypeDataStrideTime) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(MDLVertexFormat, format);
    declare_pointer(NSString, type);
    declare_pointer(NSData, data);
    declare_value(NSInteger, stride);
    declare_value(NSTimeInterval, time);
    [self addAttributeWithName: name
                     format:(MDLVertexFormat)format
                       type:(NSString *)type
                       data:(NSData *)data
                     stride:(NSInteger)stride
                       time:(NSTimeInterval)time];
  }
}

NAN_METHOD(NMDLMesh::addNormalsWithAttributeNamedCreaseThreshold) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, attributeName);
    declare_value(float, creaseThreshold);
    [self addNormalsWithAttributeNamed: attributeName
          creaseThreshold: creaseThreshold];
  }
}

NAN_METHOD(NMDLMesh::addTangentBasisForTextureCoordinateAttributeNamedTangentAttributeNameBitangentAttributeName) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, textureCoordinateAttributeName);
    declare_pointer(NSString, tangentAttributeName);
    declare_nullable_pointer(NSString, bitangentAttributeName);
    [self addTangentBasisForTextureCoordinateAttributeNamed:textureCoordinateAttributeName
      tangentAttributeNamed:tangentAttributeName
      bitangentAttributeNamed:bitangentAttributeName];
  }
}

NAN_METHOD(NMDLMesh::addTangentBasisForTextureCoordinateAttributeNamedNormalAttributeNamedTangentAttributeNamed) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, textureCoordinateAttributeName);
    declare_pointer(NSString, normalAttributeName);
    declare_pointer(NSString, tangentAttributeName);
    [self addTangentBasisForTextureCoordinateAttributeNamed: textureCoordinateAttributeName
                                     normalAttributeNamed:normalAttributeName
                                    tangentAttributeNamed:tangentAttributeName];
  }
}

NAN_METHOD(NMDLMesh::addOrthTanBasisForTextureCoordinateAttributeNamedNormalAttributeNamedTangentAttributeNamed) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, textureCoordinateAttributeName);
    declare_pointer(NSString, normalAttributeName);
    declare_pointer(NSString, tangentAttributeName);
    [self addOrthTanBasisForTextureCoordinateAttributeNamed: textureCoordinateAttributeName
          normalAttributeNamed:normalAttributeName
          tangentAttributeNamed:tangentAttributeName];
  }
}

NAN_METHOD(NMDLMesh::addUnwrappedTextureCoordinatesForAttributeNamed) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, textureCoordinateAttributeName);
    [self addUnwrappedTextureCoordinatesForAttributeNamed: textureCoordinateAttributeName];
  }
}

NAN_METHOD(NMDLMesh::flipTextureCoordinatesInAttributeNamed) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, textureCoordinateAttributeName);
    [self flipTextureCoordinatesInAttributeNamed: textureCoordinateAttributeName];
  }
}

NAN_METHOD(NMDLMesh::makeVerticesUnique) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    [self makeVerticesUnique];
  }
}

NAN_METHOD(NMDLMesh::makeVerticesUniqueAndReturnError) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self makeVerticesUniqueAndReturnError: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NMDLMesh::replaceAttributeNamed) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_pointer(MDLVertexAttributeData, newData);
    [self replaceAttributeNamed: name
                     withData:newData];
  }
}

NAN_METHOD(NMDLMesh::updateAttributeNamed) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_pointer(MDLVertexAttributeData, newData);
    [self updateAttributeNamed: name
                     withData:newData];
  }
}

NAN_METHOD(NMDLMesh::removeAttributeNamed) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    [self removeAttributeNamed: name];
  }
}

#if TODO
NAN_METHOD(NMDLMesh::initBoxWithExtent) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, extent);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initBoxWithExtent: extent]));
  }
}

NAN_METHOD(NMDLMesh::initSphereWithExtent) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, extent);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initSphereWithExtent: extent]));
  }
}

NAN_METHOD(NMDLMesh::initHemisphereWithExtent) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, extent);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initHemisphereWithExtent: extent]));
  }
}

NAN_METHOD(NMDLMesh::initCylinderWithExtent) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, extent);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initCylinderWithExtent: extent]));
  }
}

NAN_METHOD(NMDLMesh::initCapsuleWithExtent) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, extent);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initCapsuleWithExtent: extent]));
  }
}

NAN_METHOD(NMDLMesh::initConeWithExtent) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, extent);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initConeWithExtent: extent]));
  }
}

NAN_METHOD(NMDLMesh::initPlaneWithExtent) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, extent);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initPlaneWithExtent: extent]));
  }
}

NAN_METHOD(NMDLMesh::initIcosahedronWithExtent) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, extent);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initIcosahedronWithExtent: extent]));
  }
}

NAN_METHOD(NMDLMesh::initMeshBySubdividingMesh) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLMesh, mesh);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initMeshBySubdividingMesh: mesh]));
  }
}

NAN_METHOD(NMDLMesh::generateAmbientOcclusionTextureWithSize) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_int2, textureSize);
    JS_SET_RETURN(js_value_BOOL([self generateAmbientOcclusionTextureWithSize: textureSize]));
  }
}

NAN_METHOD(NMDLMesh::generateAmbientOcclusionTextureWithQuality) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, bakeQuality);
    JS_SET_RETURN(js_value_BOOL([self generateAmbientOcclusionTextureWithQuality: bakeQuality]));
  }
}

NAN_METHOD(NMDLMesh::generateAmbientOcclusionVertexColorsWithRaysPerSample) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, raysPerSample);
    JS_SET_RETURN(js_value_BOOL([self generateAmbientOcclusionVertexColorsWithRaysPerSample: raysPerSample]));
  }
}

NAN_METHOD(NMDLMesh::generateAmbientOcclusionVertexColorsWithQuality) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, bakeQuality);
    JS_SET_RETURN(js_value_BOOL([self generateAmbientOcclusionVertexColorsWithQuality: bakeQuality]));
  }
}

NAN_METHOD(NMDLMesh::generateLightMapTextureWithTextureSize) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_int2, textureSize);
    JS_SET_RETURN(js_value_BOOL([self generateLightMapTextureWithTextureSize: textureSize]));
  }
}

NAN_METHOD(NMDLMesh::generateLightMapTextureWithQuality) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, bakeQuality);
    JS_SET_RETURN(js_value_BOOL([self generateLightMapTextureWithQuality: bakeQuality]));
  }
}

NAN_METHOD(NMDLMesh::generateLightMapVertexColorsWithLightsToConsider) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<MDLLight*>, lightsToConsider);
    JS_SET_RETURN(js_value_BOOL([self generateLightMapVertexColorsWithLightsToConsider: lightsToConsider]));
  }
}

NAN_GETTER(NMDLVertexAttributeData::mapGetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLMeshBufferMap([self map]));
  }
}

NAN_SETTER(NMDLVertexAttributeData::mapSetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MDLMeshBufferMap, input);
    [self setMap: input];
  }
}

NAN_GETTER(NMDLVertexAttributeData::dataStartGetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_void_pointer([self dataStart]));
  }
}

NAN_SETTER(NMDLVertexAttributeData::dataStartSetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(void, input);
    [self setDataStart: input];
  }
}

NAN_GETTER(NMDLVertexAttributeData::strideGetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self stride]));
  }
}

NAN_SETTER(NMDLVertexAttributeData::strideSetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setStride: input];
  }
}

NAN_GETTER(NMDLVertexAttributeData::formatGetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLVertexFormat([self format]));
  }
}

NAN_SETTER(NMDLVertexAttributeData::formatSetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MDLVertexFormat, input);
    [self setFormat: input];
  }
}

NAN_GETTER(NMDLVertexAttributeData::bufferSizeGetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self bufferSize]));
  }
}

NAN_SETTER(NMDLVertexAttributeData::bufferSizeSetter) {
  JS_UNWRAP(MDLVertexAttributeData, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setBufferSize: input];
  }
}
#endif

#include "NMDLTypes.h"

NAN_GETTER(NMDLMesh::boundingBoxGetter) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLAxisAlignedBoundingBox([self boundingBox]));
  }
}

NAN_GETTER(NMDLMesh::vertexDescriptorGetter) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLVertexDescriptor([self vertexDescriptor]));
  }
}

NAN_SETTER(NMDLMesh::vertexDescriptorSetter) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MDLVertexDescriptor, input);
    [self setVertexDescriptor: input];
  }
}

NAN_GETTER(NMDLMesh::vertexCountGetter) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self vertexCount]));
  }
}

NAN_SETTER(NMDLMesh::vertexCountSetter) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setVertexCount: input];
  }
}

NAN_GETTER(NMDLMesh::vertexBuffersGetter) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<id<MDLMeshBuffer>>([self vertexBuffers]));
  }
}

NAN_SETTER(NMDLMesh::vertexBuffersSetter) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<id<MDLMeshBuffer>>, input);
    [self setVertexBuffers: input];
  }
}

NAN_GETTER(NMDLMesh::submeshesGetter) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<MDLSubmesh*>([self submeshes]));
  }
}

NAN_SETTER(NMDLMesh::submeshesSetter) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<MDLSubmesh*>, input);
    [self setSubmeshes: input];
  }
}

NAN_GETTER(NMDLMesh::allocatorGetter) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MDLMeshBufferAllocator>*/([self allocator]));
  }
}

#include <SceneKit/ModelIO.h>
#include "NSCNGeometry.h"

NAN_METHOD(NMDLMesh::meshWithSCNGeometry) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNGeometry, scnGeometry);
    JS_SET_RETURN(js_value_instancetype([MDLMesh meshWithSCNGeometry: scnGeometry]));
  }
}

NAN_METHOD(NMDLMesh::meshWithSCNGeometryBufferAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNGeometry, scnGeometry);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, bufferAllocator);
    JS_SET_RETURN(js_value_instancetype([MDLMesh meshWithSCNGeometry: scnGeometry bufferAllocator: bufferAllocator]));
  }
}
