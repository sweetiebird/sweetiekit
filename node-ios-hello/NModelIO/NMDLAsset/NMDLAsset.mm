//
//  NMDLAsset.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLAsset.h"

#include "NMDLTypes.h"

#define instancetype MDLAsset
#define js_value_instancetype js_value_MDLAsset

NMDLAsset::NMDLAsset() {}
NMDLAsset::~NMDLAsset() {}

JS_INIT_CLASS(MDLAsset, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(exportAssetToURL);
  JS_ASSIGN_PROTO_METHOD(exportAssetToURLError);
  JS_ASSIGN_PROTO_METHOD(objectAtPath);
  JS_ASSIGN_PROTO_METHOD(childObjectsOfClass);
  JS_ASSIGN_PROTO_METHOD(loadTextures);
  JS_ASSIGN_PROTO_METHOD(boundingBoxAtTime);
  JS_ASSIGN_PROTO_METHOD(addObject);
  JS_ASSIGN_PROTO_METHOD(removeObject);
  JS_ASSIGN_PROTO_METHOD(objectAtIndexedSubscript);
  JS_ASSIGN_PROTO_METHOD(objectAtIndex);
#if TODO
// MDLLightProbeIrradianceDataSource
  JS_ASSIGN_PROTO_METHOD(sphericalHarmonicsCoefficientsAtPosition);
#endif
// MDLAsset
  JS_ASSIGN_PROTO_PROP_READONLY(boundingBox);
  JS_ASSIGN_PROTO_PROP(frameInterval);
  JS_ASSIGN_PROTO_PROP(startTime);
  JS_ASSIGN_PROTO_PROP(endTime);
  JS_ASSIGN_PROTO_PROP(upAxis);
  JS_ASSIGN_PROTO_PROP_READONLY(URL);
  JS_ASSIGN_PROTO_PROP(resolver);
  JS_ASSIGN_PROTO_PROP_READONLY(bufferAllocator);
  JS_ASSIGN_PROTO_PROP_READONLY(vertexDescriptor);
  JS_ASSIGN_PROTO_PROP_READONLY(count);
  JS_ASSIGN_PROTO_PROP(masters);
  JS_ASSIGN_PROTO_PROP(animations);
#if TODO
// MDLLightProbeIrradianceDataSource
  JS_ASSIGN_PROTO_PROP(boundingBox);
  JS_ASSIGN_PROTO_PROP(sphericalHarmonicsLevel);
#endif
  // static members (ctor)
  JS_INIT_CTOR(MDLAsset, NSObject);
  JS_ASSIGN_STATIC_METHOD(canImportFileExtension);
  JS_ASSIGN_STATIC_METHOD(canExportFileExtension);
  JS_ASSIGN_STATIC_METHOD(placeLightProbesWithDensityHeuristicUsingIrradianceDataSource);
  JS_ASSIGN_STATIC_METHOD(initWithURL);
  JS_ASSIGN_STATIC_METHOD(initWithBufferAllocator);
  JS_ASSIGN_STATIC_METHOD(assetWithSCNScene);
  JS_ASSIGN_STATIC_METHOD(assetWithSCNSceneBufferAllocator);
JS_INIT_CLASS_END(MDLAsset, NSObject);

NAN_METHOD(NMDLAsset::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLAsset(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLAsset, info);
      return;
    }

    MDLAsset* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLAsset *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLAsset alloc] init];
    }
    if (self) {
      NMDLAsset *wrapper = new NMDLAsset();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLAsset::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMDLAsset::canImportFileExtension) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, extension);
    JS_SET_RETURN(js_value_BOOL([MDLAsset canImportFileExtension: extension]));
  }
}

NAN_METHOD(NMDLAsset::canExportFileExtension) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, extension);
    JS_SET_RETURN(js_value_BOOL([MDLAsset canExportFileExtension: extension]));
  }
}

NAN_METHOD(NMDLAsset::placeLightProbesWithDensityHeuristicUsingIrradianceDataSource) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, value);
    declare_value(MDLProbePlacement, type);
    declare_value(id/* <MDLLightProbeIrradianceDataSource>*/, dataSource);
    JS_SET_RETURN(js_value_NSArray<MDLLightProbe*>([MDLAsset placeLightProbesWithDensity: value heuristic: type usingIrradianceDataSource: dataSource]));
  }
}

#include "NNSURL.h"

NAN_METHOD(NMDLAsset::initWithURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, URL);
    JS_SET_RETURN(js_value_instancetype([[MDLAsset alloc] initWithURL: URL]));
  }
}

NAN_METHOD(NMDLAsset::initWithBufferAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, bufferAllocator);
    JS_SET_RETURN(js_value_instancetype([[MDLAsset alloc] initWithBufferAllocator: bufferAllocator]));
  }
}

NAN_METHOD(NMDLAsset::exportAssetToURL) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, URL);
    JS_SET_RETURN(js_value_BOOL([self exportAssetToURL: URL]));
  }
}

NAN_METHOD(NMDLAsset::exportAssetToURLError) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, URL);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self exportAssetToURL: URL error: &error]));
    js_panic_NSError(error);
  }
}

#include "NMDLObject.h"

NAN_METHOD(NMDLAsset::objectAtPath) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, path);
    JS_SET_RETURN(js_value_MDLObject([self objectAtPath: path]));
  }
}

NAN_METHOD(NMDLAsset::childObjectsOfClass) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <Class>*/, objectClass);
    JS_SET_RETURN(js_value_NSArray<MDLObject*>([self childObjectsOfClass: objectClass]));
  }
}

NAN_METHOD(NMDLAsset::loadTextures) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    [self loadTextures];
  }
}

NAN_METHOD(NMDLAsset::boundingBoxAtTime) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, time);
    JS_SET_RETURN(js_value_MDLAxisAlignedBoundingBox([self boundingBoxAtTime: time]));
  }
}

#include "NMDLObject.h"

NAN_METHOD(NMDLAsset::addObject) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLObject, object);
    [self addObject: object];
  }
}

NAN_METHOD(NMDLAsset::removeObject) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLObject, object);
    [self removeObject: object];
  }
}

NAN_METHOD(NMDLAsset::objectAtIndexedSubscript) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, index);
    JS_SET_RETURN(js_value_MDLObject([self objectAtIndexedSubscript: index]));
  }
}

NAN_METHOD(NMDLAsset::objectAtIndex) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, index);
    JS_SET_RETURN(js_value_MDLObject([self objectAtIndex: index]));
  }
}

#if TODO
NAN_METHOD(NMDLLightProbeIrradianceDataSource::sphericalHarmonicsCoefficientsAtPosition) {
  JS_UNWRAP(MDLLightProbeIrradianceDataSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, position);
    JS_SET_RETURN(js_value_NSData([self sphericalHarmonicsCoefficientsAtPosition: position]));
  }
}
#endif

NAN_GETTER(NMDLAsset::boundingBoxGetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLAxisAlignedBoundingBox([self boundingBox]));
  }
}

NAN_GETTER(NMDLAsset::frameIntervalGetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self frameInterval]));
  }
}

NAN_SETTER(NMDLAsset::frameIntervalSetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTimeInterval, input);
    [self setFrameInterval: input];
  }
}

NAN_GETTER(NMDLAsset::startTimeGetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self startTime]));
  }
}

NAN_SETTER(NMDLAsset::startTimeSetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTimeInterval, input);
    [self setStartTime: input];
  }
}

NAN_GETTER(NMDLAsset::endTimeGetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self endTime]));
  }
}

NAN_SETTER(NMDLAsset::endTimeSetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTimeInterval, input);
    [self setEndTime: input];
  }
}

NAN_GETTER(NMDLAsset::upAxisGetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_vector_float3([self upAxis]));
  }
}

NAN_SETTER(NMDLAsset::upAxisSetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(vector_float3, input);
    [self setUpAxis: input];
  }
}

NAN_GETTER(NMDLAsset::URLGetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self URL]));
  }
}

NAN_GETTER(NMDLAsset::resolverGetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MDLAssetResolver>*/([self resolver]));
  }
}

NAN_SETTER(NMDLAsset::resolverSetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <MDLAssetResolver>*/, input);
    [self setResolver: input];
  }
}

NAN_GETTER(NMDLAsset::bufferAllocatorGetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MDLMeshBufferAllocator>*/([self bufferAllocator]));
  }
}

#include "NMDLVertexDescriptor.h"

NAN_GETTER(NMDLAsset::vertexDescriptorGetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLVertexDescriptor([self vertexDescriptor]));
  }
}

NAN_GETTER(NMDLAsset::countGetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self count]));
  }
}

NAN_GETTER(NMDLAsset::mastersGetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MDLObjectContainerComponent>*/([self masters]));
  }
}

NAN_SETTER(NMDLAsset::mastersSetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <MDLObjectContainerComponent>*/, input);
    [self setMasters: input];
  }
}

NAN_GETTER(NMDLAsset::animationsGetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MDLObjectContainerComponent>*/([self animations]));
  }
}

NAN_SETTER(NMDLAsset::animationsSetter) {
  JS_UNWRAP(MDLAsset, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <MDLObjectContainerComponent>*/, input);
    [self setAnimations: input];
  }
}

#if TODO
NAN_GETTER(NMDLLightProbeIrradianceDataSource::boundingBoxGetter) {
  JS_UNWRAP(MDLLightProbeIrradianceDataSource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLAxisAlignedBoundingBox([self boundingBox]));
  }
}

NAN_SETTER(NMDLLightProbeIrradianceDataSource::boundingBoxSetter) {
  JS_UNWRAP(MDLLightProbeIrradianceDataSource, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MDLAxisAlignedBoundingBox, input);
    [self setBoundingBox: input];
  }
}

NAN_GETTER(NMDLLightProbeIrradianceDataSource::sphericalHarmonicsLevelGetter) {
  JS_UNWRAP(MDLLightProbeIrradianceDataSource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self sphericalHarmonicsLevel]));
  }
}

NAN_SETTER(NMDLLightProbeIrradianceDataSource::sphericalHarmonicsLevelSetter) {
  JS_UNWRAP(MDLLightProbeIrradianceDataSource, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setSphericalHarmonicsLevel: input];
  }
}
#endif

#include <SceneKit/ModelIO.h>
#include "NSCNScene.h"

NAN_METHOD(NMDLAsset::assetWithSCNScene) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNScene, scnScene);
    JS_SET_RETURN(js_value_instancetype([MDLAsset assetWithSCNScene: scnScene]));
  }
}

NAN_METHOD(NMDLAsset::assetWithSCNSceneBufferAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNScene, scnScene);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, bufferAllocator);
    JS_SET_RETURN(js_value_instancetype([MDLAsset assetWithSCNScene: scnScene bufferAllocator: bufferAllocator]));
  }
}
