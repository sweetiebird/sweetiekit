//
//  NSCNGeometry.h
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNGeometry_h
#define NSCNGeometry_h    

#include "NNSObject.h"

#define js_value_SCNGeometry(x) js_value_wrapper(x, SCNGeometry)
#define to_value_SCNGeometry(x) to_value_wrapper(x, SCNGeometry)
#define is_value_SCNGeometry(x) is_value_wrapper(x, SCNGeometry)

// SceneKit constants

#define js_value_SCNGeometrySourceSemantic(x) JS_ENUM(SCNGeometrySourceSemantic, NSString, x)
#define to_value_SCNGeometrySourceSemantic(x) TO_ENUM(SCNGeometrySourceSemantic, NSString, x)
#define is_value_SCNGeometrySourceSemantic(x) IS_ENUM(SCNGeometrySourceSemantic, NSString, x)

#define js_value_SCNGeometryPrimitiveType(x) JS_ENUM(SCNGeometryPrimitiveType, NSInteger, x)
#define to_value_SCNGeometryPrimitiveType(x) TO_ENUM(SCNGeometryPrimitiveType, NSInteger, x)
#define is_value_SCNGeometryPrimitiveType(x) IS_ENUM(SCNGeometryPrimitiveType, NSInteger, x)

#define js_value_MTLVertexFormat(x) JS_ENUM(MTLVertexFormat, NSUInteger, x)
#define to_value_MTLVertexFormat(x) TO_ENUM(MTLVertexFormat, NSUInteger, x)
#define is_value_MTLVertexFormat(x) IS_ENUM(MTLVertexFormat, NSUInteger, x)

JS_WRAP_CLASS(SCNGeometry, NSObject);
  JS_PROP(name);
  JS_PROP(materials);
  JS_PROP(firstMaterial);
  JS_PROP(geometrySources);
  JS_PROP(geometryElements);
  JS_PROP(geometryElementCount);
  JS_PROP(levelsOfDetail);
  JS_PROP(tessellator);
  JS_PROP(subdivisionLevel);
  JS_PROP(wantsAdaptiveSubdivision);
  JS_PROP(edgeCreasesElement);
  JS_PROP(edgeCreasesSource);
JS_WRAP_CLASS_END(SCNGeometry);

#define js_value_SCNGeometrySource(x) js_value_wrapper(x, SCNGeometrySource)
#define to_value_SCNGeometrySource(x) to_value_wrapper(x, SCNGeometrySource)
#define is_value_SCNGeometrySource(x) is_value_wrapper(x, SCNGeometrySource)

JS_WRAP_CLASS(SCNGeometrySource, NSObject);
  JS_STATIC_METHOD(geometrySourceWithDataSemanticVectorCountFloatComponentsComponentsPerVectorBytesPerComponentDataOffsetDataStride);
  JS_STATIC_METHOD(geometrySourceWithVerticesCount);
  JS_STATIC_METHOD(geometrySourceWithNormalsCount);
  JS_STATIC_METHOD(geometrySourceWithTextureCoordinatesCount);
#if SCN_ENABLE_METAL
  JS_STATIC_METHOD(geometrySourceWithBufferVertexFormatSemanticVertexCountDataOffsetDataStride);
  #endif
  JS_PROP_READONLY(data);
  JS_PROP_READONLY(semantic);
  JS_PROP_READONLY(vectorCount);
  JS_PROP_READONLY(floatComponents);
  JS_PROP_READONLY(componentsPerVector);
  JS_PROP_READONLY(bytesPerComponent);
  JS_PROP_READONLY(dataOffset);
  JS_PROP_READONLY(dataStride);
JS_WRAP_CLASS_END(SCNGeometrySource);

#define js_value_SCNGeometryElement(x) js_value_wrapper(x, SCNGeometryElement)
#define to_value_SCNGeometryElement(x) to_value_wrapper(x, SCNGeometryElement)
#define is_value_SCNGeometryElement(x) is_value_wrapper(x, SCNGeometryElement)

JS_WRAP_CLASS(SCNGeometryElement, NSObject);
  JS_STATIC_METHOD(geometryElementWithDataPrimitiveTypePrimitiveCountBytesPerIndex);
  JS_PROP_READONLY(data);
  JS_PROP_READONLY(primitiveType);
  JS_PROP_READONLY(primitiveCount);
  JS_PROP(primitiveRange);
  JS_PROP_READONLY(bytesPerIndex);
  JS_PROP(pointSize);
  JS_PROP(minimumPointScreenSpaceRadius);
  JS_PROP(maximumPointScreenSpaceRadius);
JS_WRAP_CLASS_END(SCNGeometryElement);

#if SCN_ENABLE_METAL
#define js_value_SCNGeometryTessellator(x) js_value_wrapper(x, SCNGeometryTessellator)
#define to_value_SCNGeometryTessellator(x) to_value_wrapper(x, SCNGeometryTessellator)
#define is_value_SCNGeometryTessellator(x) is_value_wrapper(x, SCNGeometryTessellator)

#define js_value_SCNTessellationSmoothingMode(x) JS_ENUM(SCNTessellationSmoothingMode, NSInteger, x)
#define to_value_SCNTessellationSmoothingMode(x) TO_ENUM(SCNTessellationSmoothingMode, NSInteger, x)
#define is_value_SCNTessellationSmoothingMode(x) IS_ENUM(SCNTessellationSmoothingMode, NSInteger, x)

#define js_value_MTLTessellationPartitionMode(x) JS_ENUM(MTLTessellationPartitionMode, NSUInteger, x)
#define to_value_MTLTessellationPartitionMode(x) TO_ENUM(MTLTessellationPartitionMode, NSUInteger, x)
#define is_value_MTLTessellationPartitionMode(x) IS_ENUM(MTLTessellationPartitionMode, NSUInteger, x)

JS_WRAP_CLASS(SCNGeometryTessellator, NSObject);
  JS_PROP(tessellationFactorScale);
  JS_PROP(tessellationPartitionMode);
  JS_PROP(isAdaptive);
  JS_PROP(isScreenSpace);
  JS_PROP(edgeTessellationFactor);
  JS_PROP(insideTessellationFactor);
  JS_PROP(maximumEdgeLength);
  JS_PROP(smoothingMode);
JS_WRAP_CLASS_END(SCNGeometryTessellator);
#endif

#endif /* NSCNGeometry_h */
