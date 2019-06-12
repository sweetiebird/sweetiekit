//
//  NMDLAsset.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLAsset_h
#define NMDLAsset_h    

#include "NNSObject.h"

#define js_value_MDLAsset(x) js_value_wrapper(x, MDLAsset)
#define to_value_MDLAsset(x) to_value_wrapper(x, MDLAsset)
#define is_value_MDLAsset(x) is_value_wrapper(x, MDLAsset)

JS_WRAP_CLASS(MDLAsset, NSObject);
  JS_STATIC_METHOD(canImportFileExtension);
  JS_STATIC_METHOD(canExportFileExtension);
  JS_STATIC_METHOD(placeLightProbesWithDensityHeuristicUsingIrradianceDataSource);
  JS_STATIC_METHOD(initWithURL);
  JS_STATIC_METHOD(initWithBufferAllocator);
  JS_METHOD(exportAssetToURL);
  JS_METHOD(exportAssetToURLError);
  JS_METHOD(objectAtPath);
  JS_METHOD(childObjectsOfClass);
  JS_METHOD(loadTextures);
  JS_METHOD(boundingBoxAtTime);
  JS_METHOD(addObject);
  JS_METHOD(removeObject);
  JS_METHOD(objectAtIndexedSubscript);
  JS_METHOD(objectAtIndex);
#if TODO
// MDLLightProbeIrradianceDataSource
  JS_METHOD(sphericalHarmonicsCoefficientsAtPosition);
#endif
// MDLAsset
  JS_PROP_READONLY(boundingBox);
  JS_PROP(frameInterval);
  JS_PROP(startTime);
  JS_PROP(endTime);
  JS_PROP(upAxis);
  JS_PROP_READONLY(URL);
  JS_PROP(resolver);
  JS_PROP_READONLY(bufferAllocator);
  JS_PROP_READONLY(vertexDescriptor);
  JS_PROP_READONLY(count);
  JS_PROP(masters);
  JS_PROP(animations);
#if TODO
// MDLLightProbeIrradianceDataSource
  JS_PROP(boundingBox);
  JS_PROP(sphericalHarmonicsLevel);
#endif

  JS_STATIC_METHOD(assetWithSCNScene);
  JS_STATIC_METHOD(assetWithSCNSceneBufferAllocator);
JS_WRAP_CLASS_END(MDLAsset);

#endif /* NMDLAsset_h */
