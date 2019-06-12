//
//  NMDLMesh.h
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLMesh_h
#define NMDLMesh_h    

#include "NMDLObject.h"

#define js_value_MDLMesh(x) js_value_wrapper(x, MDLMesh)
#define to_value_MDLMesh(x) to_value_wrapper(x, MDLMesh)
#define is_value_MDLMesh(x) is_value_wrapper(x, MDLMesh)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MDLMesh, MDLObject);
// MDLMesh
  JS_STATIC_METHOD(newBoxWithDimensionsSegmentsGeometryTypeInwardNormalsAllocator);
  JS_STATIC_METHOD(newEllipsoidWithRadiiRadialSegmentsVerticalSegmentsGeometryTypeInwardNormalsHemisphereAllocator);
  JS_STATIC_METHOD(newCylinderWithHeightRadiiRadialSegmentsVerticalSegmentsGeometryTypeInwardNormalsAllocator);
  JS_STATIC_METHOD(newCapsuleWithHeightRadiiRadialSegmentsVerticalSegmentsHemisphereSegmentsGeometryTypeInwardNormalsAllocator);
  JS_STATIC_METHOD(newEllipticalConeWithHeightRadiiRadialSegmentsVerticalSegmentsGeometryTypeInwardNormalsAllocator);
  JS_STATIC_METHOD(newPlaneWithDimensionsSegmentsGeometryTypeAllocator);
  JS_STATIC_METHOD(newIcosahedronWithRadiusInwardNormalsGeometryTypeAllocator);
  JS_STATIC_METHOD(newIcosahedronWithRadiusInwardNormalsAllocator);
  JS_STATIC_METHOD(newSubdividedMeshSubmeshIndexSubdivisionLevels);
  JS_STATIC_METHOD(initWithBufferAllocator);
  JS_STATIC_METHOD(initWithVertexBufferVertexCountDescriptorSubmeshes);
  JS_STATIC_METHOD(initWithVertexBuffersVertexCountDescriptorSubmeshes);
  JS_METHOD(vertexAttributeDataForAttributeNamed);
  JS_METHOD(vertexAttributeDataForAttributeNamedAsFormat);
  JS_METHOD(addAttributeWithNameFormat);
  JS_METHOD(addAttributeWithNameFormatTypeDataStride);
  JS_METHOD(addAttributeWithNameFormatTypeDataStrideTime);
  JS_METHOD(addNormalsWithAttributeNamedCreaseThreshold);
  JS_METHOD(addTangentBasisForTextureCoordinateAttributeNamedTangentAttributeNameBitangentAttributeName);
  JS_METHOD(addTangentBasisForTextureCoordinateAttributeNamedNormalAttributeNamedTangentAttributeNamed);
  JS_METHOD(addOrthTanBasisForTextureCoordinateAttributeNamedNormalAttributeNamedTangentAttributeNamed);
  JS_METHOD(addUnwrappedTextureCoordinatesForAttributeNamed);
  JS_METHOD(flipTextureCoordinatesInAttributeNamed);
  JS_METHOD(makeVerticesUnique);
  JS_METHOD(makeVerticesUniqueAndReturnError);
  JS_METHOD(replaceAttributeNamed);
  JS_METHOD(updateAttributeNamed);
  JS_METHOD(removeAttributeNamed);
  JS_STATIC_METHOD(initBoxWithExtentSegmentsInwardNormalsGeometryTypeAllocator);
  JS_STATIC_METHOD(initSphereWithExtentSegmentsInwardNormalsGeometryTypeAllocator);
  JS_STATIC_METHOD(initHemisphereWithExtentSegmentsInwardNormalsCapGeometryTypeAllocator);
  JS_STATIC_METHOD(initCylinderWithExtentSegmentsInwardNormalsTopCapBottomCapGeometryTypeAllocator);
  JS_STATIC_METHOD(initCapsuleWithExtentCylinderSegmentsHemisphereSegmentsInwardNormalsGeometryTypeAllocator);
  JS_STATIC_METHOD(initConeWithExtentSegmentsInwardNormalsCapGeometryTypeAllocator);
  JS_STATIC_METHOD(initPlaneWithExtentSegmentsGeometryTypeAllocator);
  JS_STATIC_METHOD(initIcosahedronWithExtentInwardNormalsGeometryTypeAllocator);
  JS_STATIC_METHOD(initMeshBySubdividingMeshSubmeshIndexSubdivisionLevelsAllocator);
  JS_METHOD(generateAmbientOcclusionTextureWithSizeRaysPerSampleAttenuationFactorObjectsToConsiderVertexAttributeNamedMaterialPropertyNamed);
  JS_METHOD(generateAmbientOcclusionTextureWithQualityAttenuationFactorObjectsToConsiderVertexAttributeNamedMaterialPropertyNamed);
  JS_METHOD(generateAmbientOcclusionVertexColorsWithRaysPerSampleAttenuationFactorObjectsToConsiderVertexAttributeNamed);
  JS_METHOD(generateAmbientOcclusionVertexColorsWithQualityAttenuationFactorObjectsToConsiderVertexAttributeNamed);
  JS_METHOD(generateLightMapTextureWithTextureSizeLightsToConsiderObjectsToConsiderVertexAttributeNamedMaterialPropertyNamed);
  JS_METHOD(generateLightMapTextureWithQualityLightsToConsiderObjectsToConsiderVertexAttributeNamedMaterialPropertyNamed);
  JS_METHOD(generateLightMapVertexColorsWithLightsToConsiderObjectsToConsiderVertexAttributeNamed);
  JS_PROP_READONLY(boundingBox);
  JS_PROP(vertexDescriptor);
  JS_PROP(vertexCount);
  JS_PROP(vertexBuffers);
  JS_PROP(submeshes);
  JS_PROP_READONLY(allocator);

  JS_STATIC_METHOD(meshWithSCNGeometry);
  JS_STATIC_METHOD(meshWithSCNGeometryBufferAllocator);
JS_WRAP_CLASS_END(MDLMesh);

#endif /* NMDLMesh_h */
