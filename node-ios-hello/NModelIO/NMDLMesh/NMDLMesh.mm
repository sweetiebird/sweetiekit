//
//  NMDLMesh.mm
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLMesh.h"

#include "NMDLTypes.h"

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
  JS_ASSIGN_PROTO_METHOD(generateAmbientOcclusionTextureWithSizeRaysPerSampleAttenuationFactorObjectsToConsiderVertexAttributeNamedMaterialPropertyNamed);
  JS_ASSIGN_PROTO_METHOD(generateAmbientOcclusionTextureWithQualityAttenuationFactorObjectsToConsiderVertexAttributeNamedMaterialPropertyNamed);
  JS_ASSIGN_PROTO_METHOD(generateAmbientOcclusionVertexColorsWithRaysPerSampleAttenuationFactorObjectsToConsiderVertexAttributeNamed);
  JS_ASSIGN_PROTO_METHOD(generateAmbientOcclusionVertexColorsWithQualityAttenuationFactorObjectsToConsiderVertexAttributeNamed);
  JS_ASSIGN_PROTO_METHOD(generateLightMapTextureWithTextureSizeLightsToConsiderObjectsToConsiderVertexAttributeNamedMaterialPropertyNamed);
  JS_ASSIGN_PROTO_METHOD(generateLightMapTextureWithQualityLightsToConsiderObjectsToConsiderVertexAttributeNamedMaterialPropertyNamed);
  JS_ASSIGN_PROTO_METHOD(generateLightMapVertexColorsWithLightsToConsiderObjectsToConsiderVertexAttributeNamed);
  JS_ASSIGN_PROTO_PROP_READONLY(boundingBox);
  JS_ASSIGN_PROTO_PROP(vertexDescriptor);
  JS_ASSIGN_PROTO_PROP(vertexCount);
  JS_ASSIGN_PROTO_PROP(vertexBuffers);
  JS_ASSIGN_PROTO_PROP(submeshes);
  JS_ASSIGN_PROTO_PROP_READONLY(allocator);

  // static members (ctor)
  JS_INIT_CTOR(MDLMesh, MDLObject);
  JS_ASSIGN_PROTO_METHOD(initWithBufferAllocator);
  JS_ASSIGN_STATIC_METHOD(newBoxWithDimensionsSegmentsGeometryTypeInwardNormalsAllocator);
  JS_ASSIGN_STATIC_METHOD(newEllipsoidWithRadiiRadialSegmentsVerticalSegmentsGeometryTypeInwardNormalsHemisphereAllocator);
  JS_ASSIGN_STATIC_METHOD(newCylinderWithHeightRadiiRadialSegmentsVerticalSegmentsGeometryTypeInwardNormalsAllocator);
  JS_ASSIGN_STATIC_METHOD(newCapsuleWithHeightRadiiRadialSegmentsVerticalSegmentsHemisphereSegmentsGeometryTypeInwardNormalsAllocator);
  JS_ASSIGN_STATIC_METHOD(newEllipticalConeWithHeightRadiiRadialSegmentsVerticalSegmentsGeometryTypeInwardNormalsAllocator);
  JS_ASSIGN_STATIC_METHOD(newPlaneWithDimensionsSegmentsGeometryTypeAllocator);
  JS_ASSIGN_STATIC_METHOD(newIcosahedronWithRadiusInwardNormalsGeometryTypeAllocator);
  JS_ASSIGN_STATIC_METHOD(newIcosahedronWithRadiusInwardNormalsAllocator);
  JS_ASSIGN_STATIC_METHOD(newSubdividedMeshSubmeshIndexSubdivisionLevels);
  JS_ASSIGN_PROTO_METHOD(initWithBufferAllocator);
  JS_ASSIGN_PROTO_METHOD(initWithVertexBufferVertexCountDescriptorSubmeshes);
  JS_ASSIGN_PROTO_METHOD(initWithVertexBuffersVertexCountDescriptorSubmeshes);
  JS_ASSIGN_STATIC_METHOD(initBoxWithExtentSegmentsInwardNormalsGeometryTypeAllocator);
  JS_ASSIGN_STATIC_METHOD(initSphereWithExtentSegmentsInwardNormalsGeometryTypeAllocator);
  JS_ASSIGN_STATIC_METHOD(initHemisphereWithExtentSegmentsInwardNormalsCapGeometryTypeAllocator);
  JS_ASSIGN_STATIC_METHOD(initCylinderWithExtentSegmentsInwardNormalsTopCapBottomCapGeometryTypeAllocator);
  JS_ASSIGN_STATIC_METHOD(initCapsuleWithExtentCylinderSegmentsHemisphereSegmentsInwardNormalsGeometryTypeAllocator);
  JS_ASSIGN_STATIC_METHOD(initConeWithExtentSegmentsInwardNormalsCapGeometryTypeAllocator);
  JS_ASSIGN_STATIC_METHOD(initPlaneWithExtentSegmentsGeometryTypeAllocator);
  JS_ASSIGN_STATIC_METHOD(initIcosahedronWithExtentInwardNormalsGeometryTypeAllocator);
  JS_ASSIGN_STATIC_METHOD(initMeshBySubdividingMeshSubmeshIndexSubdivisionLevelsAllocator);

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

NAN_METHOD(NMDLMesh::newBoxWithDimensionsSegmentsGeometryTypeInwardNormalsAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, dimensions);
    declare_value(vector_uint3, segments);
    declare_value(MDLGeometryType, geometryType);
    declare_value(BOOL, inwardNormals);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newBoxWithDimensions: dimensions segments: segments geometryType: geometryType inwardNormals: inwardNormals allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::newEllipsoidWithRadiiRadialSegmentsVerticalSegmentsGeometryTypeInwardNormalsHemisphereAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, radii);
    declare_value(NSUInteger, radialSegments);
    declare_value(NSUInteger, verticalSegments);
    declare_value(MDLGeometryType, geometryType);
    declare_value(BOOL, inwardNormals);
    declare_value(BOOL, hemisphere);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newEllipsoidWithRadii: radii radialSegments: radialSegments verticalSegments: verticalSegments geometryType: geometryType inwardNormals: inwardNormals hemisphere: hemisphere allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::newCylinderWithHeightRadiiRadialSegmentsVerticalSegmentsGeometryTypeInwardNormalsAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, height);
    declare_value(vector_float2, radii);
    declare_value(NSUInteger, radialSegments);
    declare_value(NSUInteger, verticalSegments);
    declare_value(MDLGeometryType, geometryType);
    declare_value(BOOL, inwardNormals);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newCylinderWithHeight: height radii: radii radialSegments: radialSegments verticalSegments: verticalSegments geometryType: geometryType inwardNormals: inwardNormals allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::newCapsuleWithHeightRadiiRadialSegmentsVerticalSegmentsHemisphereSegmentsGeometryTypeInwardNormalsAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, height);
    declare_value(vector_float2, radii);
    declare_value(NSUInteger, radialSegments);
    declare_value(NSUInteger, verticalSegments);
    declare_value(NSUInteger, hemisphereSegments);
    declare_value(MDLGeometryType, geometryType);
    declare_value(BOOL, inwardNormals);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newCapsuleWithHeight: height radii: radii radialSegments: radialSegments verticalSegments: verticalSegments hemisphereSegments: hemisphereSegments geometryType: geometryType inwardNormals: inwardNormals allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::newEllipticalConeWithHeightRadiiRadialSegmentsVerticalSegmentsGeometryTypeInwardNormalsAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, height);
    declare_value(vector_float2, radii);
    declare_value(NSUInteger, radialSegments);
    declare_value(NSUInteger, verticalSegments);
    declare_value(MDLGeometryType, geometryType);
    declare_value(BOOL, inwardNormals);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newEllipticalConeWithHeight: height radii: radii radialSegments: radialSegments verticalSegments: verticalSegments geometryType: geometryType inwardNormals: inwardNormals allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::newPlaneWithDimensionsSegmentsGeometryTypeAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float2, dimensions);
    declare_value(vector_uint2, segments);
    declare_value(MDLGeometryType, geometryType);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newPlaneWithDimensions: dimensions segments: segments geometryType: geometryType allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::newIcosahedronWithRadiusInwardNormalsGeometryTypeAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, radius);
    declare_value(BOOL, inwardNormals);
    declare_value(MDLGeometryType, geometryType);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newIcosahedronWithRadius: radius inwardNormals: inwardNormals geometryType: geometryType allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::newIcosahedronWithRadiusInwardNormalsAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, radius);
    declare_value(BOOL, inwardNormals);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newIcosahedronWithRadius: radius inwardNormals: inwardNormals allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::newSubdividedMeshSubmeshIndexSubdivisionLevels) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLMesh, mesh);
    declare_value(NSUInteger, submeshIndex);
    declare_value(NSUInteger, subdivisionLevels);
    JS_SET_RETURN(js_value_instancetype([MDLMesh newSubdividedMesh: mesh submeshIndex: submeshIndex subdivisionLevels: subdivisionLevels]));
  }
}

NAN_METHOD(NMDLMesh::initWithBufferAllocator) {
  JS_UNWRAP_OR_ALLOC(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, bufferAllocator);
    JS_SET_RETURN(js_value_instancetype([self initWithBufferAllocator: bufferAllocator]));
  }
}

#include "NMDLVertexDescriptor.h"
#include "NMDLSubmesh.h"

NAN_METHOD(NMDLMesh::initWithVertexBufferVertexCountDescriptorSubmeshes) {
  JS_UNWRAP_OR_ALLOC(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MDLMeshBuffer>*/, vertexBuffer);
    declare_value(NSUInteger, vertexCount);
    declare_pointer(MDLVertexDescriptor, descriptor);
    declare_pointer(NSArray<MDLSubmesh*>, submeshes);
    JS_SET_RETURN(js_value_instancetype([self initWithVertexBuffer: vertexBuffer
                         vertexCount:vertexCount
                          descriptor:descriptor
                           submeshes:submeshes]));
  }
}

NAN_METHOD(NMDLMesh::initWithVertexBuffersVertexCountDescriptorSubmeshes) {
  JS_UNWRAP_OR_ALLOC(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<id/* <MDLMeshBuffer>*/>, vertexBuffers);
    declare_value(NSUInteger, vertexCount);
    declare_pointer(MDLVertexDescriptor, descriptor);
    declare_pointer(NSArray<MDLSubmesh*>, submeshes);
    JS_SET_RETURN(js_value_instancetype([self initWithVertexBuffers: vertexBuffers
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

NAN_METHOD(NMDLMesh::initBoxWithExtentSegmentsInwardNormalsGeometryTypeAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, extent);
    declare_value(vector_uint3, segments);
    declare_value(BOOL, inwardNormals);
    declare_value(MDLGeometryType, geometryType);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initBoxWithExtent: extent segments: segments inwardNormals: inwardNormals geometryType: geometryType allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::initSphereWithExtentSegmentsInwardNormalsGeometryTypeAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, extent);
    declare_value(vector_uint2, segments);
    declare_value(BOOL, inwardNormals);
    declare_value(MDLGeometryType, geometryType);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initSphereWithExtent: extent segments: segments inwardNormals: inwardNormals geometryType: geometryType allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::initHemisphereWithExtentSegmentsInwardNormalsCapGeometryTypeAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, extent);
    declare_value(vector_uint2, segments);
    declare_value(BOOL, inwardNormals);
    declare_value(BOOL, cap);
    declare_value(MDLGeometryType, geometryType);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initHemisphereWithExtent: extent segments: segments inwardNormals: inwardNormals cap: cap geometryType: geometryType allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::initCylinderWithExtentSegmentsInwardNormalsTopCapBottomCapGeometryTypeAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, extent);
    declare_value(vector_uint2, segments);
    declare_value(BOOL, inwardNormals);
    declare_value(BOOL, topCap);
    declare_value(BOOL, bottomCap);
    declare_value(MDLGeometryType, geometryType);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initCylinderWithExtent: extent segments: segments inwardNormals: inwardNormals topCap: topCap bottomCap: bottomCap geometryType: geometryType allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::initCapsuleWithExtentCylinderSegmentsHemisphereSegmentsInwardNormalsGeometryTypeAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, extent);
    declare_value(vector_uint2, segments);
    declare_value(int, hemisphereSegments);
    declare_value(BOOL, inwardNormals);
    declare_value(MDLGeometryType, geometryType);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initCapsuleWithExtent: extent cylinderSegments: segments hemisphereSegments: hemisphereSegments inwardNormals: inwardNormals geometryType: geometryType allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::initConeWithExtentSegmentsInwardNormalsCapGeometryTypeAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, extent);
    declare_value(vector_uint2, segments);
    declare_value(BOOL, inwardNormals);
    declare_value(BOOL, cap);
    declare_value(MDLGeometryType, geometryType);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initConeWithExtent: extent segments: segments inwardNormals: inwardNormals cap: cap geometryType: geometryType allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::initPlaneWithExtentSegmentsGeometryTypeAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, extent);
    declare_value(vector_uint2, segments);
    declare_value(MDLGeometryType, geometryType);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initPlaneWithExtent: extent segments: segments geometryType: geometryType allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::initIcosahedronWithExtentInwardNormalsGeometryTypeAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, extent);
    declare_value(BOOL, inwardNormals);
    declare_value(MDLGeometryType, geometryType);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initIcosahedronWithExtent: extent inwardNormals: inwardNormals geometryType: geometryType allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::initMeshBySubdividingMeshSubmeshIndexSubdivisionLevelsAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLMesh, mesh);
    declare_value(int, submeshIndex);
    declare_value(uint32_t, subdivisionLevels);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, allocator);
    JS_SET_RETURN(js_value_instancetype([[MDLMesh alloc] initMeshBySubdividingMesh: mesh submeshIndex: submeshIndex subdivisionLevels: subdivisionLevels allocator: allocator]));
  }
}

NAN_METHOD(NMDLMesh::generateAmbientOcclusionTextureWithSizeRaysPerSampleAttenuationFactorObjectsToConsiderVertexAttributeNamedMaterialPropertyNamed) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_int2, textureSize);
    declare_value(NSInteger, raysPerSample);
    declare_value(float, attenuationFactor);
    declare_pointer(NSArray<MDLObject*>, objectsToConsider);
    declare_pointer(NSString, vertexAttributeName);
    declare_pointer(NSString, materialPropertyName);
    JS_SET_RETURN(js_value_BOOL([self generateAmbientOcclusionTextureWithSize: textureSize raysPerSample: raysPerSample attenuationFactor: attenuationFactor objectsToConsider: objectsToConsider vertexAttributeNamed: vertexAttributeName materialPropertyNamed: materialPropertyName]));
  }
}

#include "NMDLObject.h"

NAN_METHOD(NMDLMesh::generateAmbientOcclusionTextureWithQualityAttenuationFactorObjectsToConsiderVertexAttributeNamedMaterialPropertyNamed) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, bakeQuality);
    declare_value(float, attenuationFactor);
    declare_pointer(NSArray<MDLObject*>, objectsToConsider);
    declare_pointer(NSString, vertexAttributeName);
    declare_pointer(NSString, materialPropertyName);
    JS_SET_RETURN(js_value_BOOL([self generateAmbientOcclusionTextureWithQuality: bakeQuality attenuationFactor: attenuationFactor objectsToConsider: objectsToConsider vertexAttributeNamed: vertexAttributeName materialPropertyNamed: materialPropertyName]));
  }
}

NAN_METHOD(NMDLMesh::generateAmbientOcclusionVertexColorsWithRaysPerSampleAttenuationFactorObjectsToConsiderVertexAttributeNamed) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, raysPerSample);
    declare_value(float, attenuationFactor);
    declare_pointer(NSArray<MDLObject*>, objectsToConsider);
    declare_pointer(NSString, vertexAttributeName);
    JS_SET_RETURN(js_value_BOOL([self generateAmbientOcclusionVertexColorsWithRaysPerSample: raysPerSample attenuationFactor: attenuationFactor objectsToConsider: objectsToConsider vertexAttributeNamed: vertexAttributeName]));
  }
}

NAN_METHOD(NMDLMesh::generateAmbientOcclusionVertexColorsWithQualityAttenuationFactorObjectsToConsiderVertexAttributeNamed) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, bakeQuality);
    declare_value(float, attenuationFactor);
    declare_pointer(NSArray<MDLObject*>, objectsToConsider);
    declare_pointer(NSString, vertexAttributeName);
    JS_SET_RETURN(js_value_BOOL([self generateAmbientOcclusionVertexColorsWithQuality: bakeQuality attenuationFactor: attenuationFactor objectsToConsider: objectsToConsider vertexAttributeNamed: vertexAttributeName]));
  }
}

#include "NMDLLight.h"

NAN_METHOD(NMDLMesh::generateLightMapTextureWithTextureSizeLightsToConsiderObjectsToConsiderVertexAttributeNamedMaterialPropertyNamed) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_int2, textureSize);
    declare_pointer(NSArray<MDLLight*>, lightsToConsider);
    declare_pointer(NSArray<MDLObject*>, objectsToConsider);
    declare_pointer(NSString, vertexAttributeName);
    declare_pointer(NSString, materialPropertyName);
    JS_SET_RETURN(js_value_BOOL([self generateLightMapTextureWithTextureSize: textureSize lightsToConsider: lightsToConsider objectsToConsider: objectsToConsider vertexAttributeNamed: vertexAttributeName materialPropertyNamed: materialPropertyName]));
  }
}

NAN_METHOD(NMDLMesh::generateLightMapTextureWithQualityLightsToConsiderObjectsToConsiderVertexAttributeNamedMaterialPropertyNamed) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, bakeQuality);
    declare_pointer(NSArray<MDLLight*>, lightsToConsider);
    declare_pointer(NSArray<MDLObject*>, objectsToConsider);
    declare_pointer(NSString, vertexAttributeName);
    declare_pointer(NSString, materialPropertyName);
    JS_SET_RETURN(js_value_BOOL([self generateLightMapTextureWithQuality: bakeQuality lightsToConsider: lightsToConsider objectsToConsider: objectsToConsider vertexAttributeNamed: vertexAttributeName materialPropertyNamed: materialPropertyName]));
  }
}

NAN_METHOD(NMDLMesh::generateLightMapVertexColorsWithLightsToConsiderObjectsToConsiderVertexAttributeNamed) {
  JS_UNWRAP(MDLMesh, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<MDLLight*>, lightsToConsider);
    declare_pointer(NSArray<MDLObject*>, objectsToConsider);
    declare_pointer(NSString, vertexAttributeName);
    JS_SET_RETURN(js_value_BOOL([self generateLightMapVertexColorsWithLightsToConsider: lightsToConsider objectsToConsider: objectsToConsider vertexAttributeNamed: vertexAttributeName]));
  }
}

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

