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
#if TODO
  JS_STATIC_METHOD(newBoxWithDimensions);
  JS_STATIC_METHOD(newEllipsoidWithRadii);
  JS_STATIC_METHOD(newCylinderWithHeight);
  JS_STATIC_METHOD(newCapsuleWithHeight);
  JS_STATIC_METHOD(newEllipticalConeWithHeight);
  JS_STATIC_METHOD(newPlaneWithDimensions);
  JS_STATIC_METHOD(newIcosahedronWithRadius);
  JS_STATIC_METHOD(newSubdividedMesh);
#endif
  JS_STATIC_METHOD(initWithBufferAllocator);
  JS_STATIC_METHOD(initWithVertexBuffer);
  JS_STATIC_METHOD(initWithVertexBuffers);
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
#if TODO
  JS_STATIC_METHOD(initBoxWithExtent);
  JS_STATIC_METHOD(initSphereWithExtent);
  JS_STATIC_METHOD(initHemisphereWithExtent);
  JS_STATIC_METHOD(initCylinderWithExtent);
  JS_STATIC_METHOD(initCapsuleWithExtent);
  JS_STATIC_METHOD(initConeWithExtent);
  JS_STATIC_METHOD(initPlaneWithExtent);
  JS_STATIC_METHOD(initIcosahedronWithExtent);
  JS_STATIC_METHOD(initMeshBySubdividingMesh);
  JS_METHOD(generateAmbientOcclusionTextureWithSize);
  JS_METHOD(generateAmbientOcclusionTextureWithQuality);
  JS_METHOD(generateAmbientOcclusionVertexColorsWithRaysPerSample);
  JS_METHOD(generateAmbientOcclusionVertexColorsWithQuality);
  JS_METHOD(generateLightMapTextureWithTextureSize);
  JS_METHOD(generateLightMapTextureWithQuality);
  JS_METHOD(generateLightMapVertexColorsWithLightsToConsider);
#endif
#if TODO
// MDLVertexAttributeData
  JS_PROP(map);
  JS_PROP(dataStart);
  JS_PROP(stride);
  JS_PROP(format);
  JS_PROP(bufferSize);
#endif
// MDLMesh
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
