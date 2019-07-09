//
//  NVNDetectFaceLandmarksRequest.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNDetectFaceLandmarksRequest.h"

#import <Vision/VNDetectFaceLandmarksRequest.h>

#define instancetype VNDetectFaceLandmarksRequest
#define js_value_instancetype js_value_VNDetectFaceLandmarksRequest

NVNDetectFaceLandmarksRequest::NVNDetectFaceLandmarksRequest() {}
NVNDetectFaceLandmarksRequest::~NVNDetectFaceLandmarksRequest() {}

#include "NVNFaceObservationAccepting.h"

JS_INIT_CLASS(VNDetectFaceLandmarksRequest, VNImageBasedRequest);
  JS_ASSIGN_STATIC_METHOD(revisionSupportsConstellation);
  JS_ASSIGN_PROTO_PROP(constellation);
  
  // VNFaceObservationAccepting
  {
    JS_WITH_TYPE(VNFaceObservationAccepting);
    JS_ASSIGN_PROTO_PROP_AS(NVNFaceObservationAccepting::inputFaceObservations, "inputFaceObservations");
  }

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNDetectFaceLandmarksRequest, VNImageBasedRequest);
  // constant values (exports)

  /*!
   @brief    Constellation type defines how many landmark points are used to map a face. Revisions 1, 2, and 3 support 65 points, where Rev3 also supports 76 points.
   */
  //typedef NS_ENUM(NSUInteger, VNRequestFaceLandmarksConstellation) {
    JS_ASSIGN_ENUM(VNRequestFaceLandmarksConstellationNotDefined, NSInteger); //  = 0,
    JS_ASSIGN_ENUM(VNRequestFaceLandmarksConstellation65Points, NSInteger); // ,
    JS_ASSIGN_ENUM(VNRequestFaceLandmarksConstellation76Points, NSInteger); // 
  //};

JS_INIT_CLASS_END(VNDetectFaceLandmarksRequest, VNImageBasedRequest);

NAN_METHOD(NVNDetectFaceLandmarksRequest::New) {
  JS_RECONSTRUCT(VNDetectFaceLandmarksRequest);
  @autoreleasepool {
    VNDetectFaceLandmarksRequest* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNDetectFaceLandmarksRequest *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNDetectFaceLandmarksRequest alloc] init];
    }
    if (self) {
      NVNDetectFaceLandmarksRequest *wrapper = new NVNDetectFaceLandmarksRequest();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNDetectFaceLandmarksRequest::New: invalid arguments");
    }
  }
}

NAN_METHOD(NVNDetectFaceLandmarksRequest::revisionSupportsConstellation) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, requestRevision);
    declare_value(VNRequestFaceLandmarksConstellation, constellation);
    JS_SET_RETURN(js_value_BOOL([VNDetectFaceLandmarksRequest revision: requestRevision supportsConstellation: constellation]));
  }
}

NAN_GETTER(NVNDetectFaceLandmarksRequest::constellationGetter) {
  JS_UNWRAP(VNDetectFaceLandmarksRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_VNRequestFaceLandmarksConstellation([self constellation]));
  }
}

NAN_SETTER(NVNDetectFaceLandmarksRequest::constellationSetter) {
  JS_UNWRAP(VNDetectFaceLandmarksRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(VNRequestFaceLandmarksConstellation, input);
    [self setConstellation: input];
  }
}
