//
//  NARFrame.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARFrame.h"

#if TARGET_OS_IPHONE

#include "NARCamera.h"
#include "NARLightEstimate.h"
#include "NARWorldTrackingConfiguration.h"
#include "NUIImage.h"
#include "NCIImage.h"

NARFrame::NARFrame () {}
NARFrame::~NARFrame () {}

JS_INIT_CLASS(ARFrame, NSObject);
  JS_ASSIGN_PROTO_METHOD(hitTestTypes);
  JS_ASSIGN_PROTO_METHOD(raycastQueryFromPointAllowingTargetAlignment);
  JS_ASSIGN_PROTO_METHOD(displayTransformForOrientationViewportSize);
  JS_ASSIGN_PROTO_PROP_READONLY(timestamp);
  JS_ASSIGN_PROTO_PROP_READONLY(capturedImage);
  JS_ASSIGN_PROTO_PROP_READONLY(cameraGrainTexture);
  JS_ASSIGN_PROTO_PROP_READONLY(cameraGrainIntensity);
  JS_ASSIGN_PROTO_PROP_READONLY(capturedDepthData);
  JS_ASSIGN_PROTO_PROP_READONLY(capturedDepthDataTimestamp);
  JS_ASSIGN_PROTO_PROP_READONLY(camera);
  JS_ASSIGN_PROTO_PROP_READONLY(anchors);
  JS_ASSIGN_PROTO_PROP_READONLY(lightEstimate);
  JS_ASSIGN_PROTO_PROP_READONLY(rawFeaturePoints);
  JS_ASSIGN_PROTO_PROP_READONLY(worldMappingStatus);
  JS_ASSIGN_PROTO_PROP_READONLY(segmentationBuffer);
  JS_ASSIGN_PROTO_PROP_READONLY(estimatedDepthData);
  JS_ASSIGN_PROTO_PROP_READONLY(detectedBody);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARFrame, NSObject);
  // constants (exports)

  /**
   Segmentation classes which defines a pixel's semantic label.
   @discussion When running a configuration with 'ARFrameSemanticPersonSegmentation' every pixel in the
   segmentationBuffer on the ARFrame will conform to one of these classes.
   @see -[ARConfiguration setFrameSemantics:]
   @see -[ARFrame segmentationBuffer]
  */
#if defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && (__IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_13_0)
  //API_AVAILABLE(ios(13.0))
  //typedef NS_ENUM(uint8_t, ARSegmentationClass) {

     /* Pixel has been not been classified. */
    JS_ASSIGN_ENUM(ARSegmentationClassNone, uint8_t); //       = 0,

    /* Pixel has been classified as person. */
    JS_ASSIGN_ENUM(ARSegmentationClassPerson, uint8_t); //     = 255

  //} NS_SWIFT_NAME(ARFrame.SegmentationClass);
#endif

  /**
   A value describing the world mapping status for the area visible in a given frame.
   */
  //API_AVAILABLE(ios(12.0))
  //typedef NS_ENUM(NSInteger, ARWorldMappingStatus) {
    /** World mapping is not available. */
    JS_ASSIGN_ENUM(ARWorldMappingStatusNotAvailable, NSInteger); // ,
    
    /** World mapping is available but has limited features.
     For the device's current position, the session’s world map is not recommended for relocalization. */
    JS_ASSIGN_ENUM(ARWorldMappingStatusLimited, NSInteger); // ,
    
    /** World mapping is actively extending the map with the user's motion.
     The world map will be relocalizable for previously visited areas but is still being updated for the current space. */
    JS_ASSIGN_ENUM(ARWorldMappingStatusExtending, NSInteger); // ,
    
    /** World mapping has adequately mapped the visible area.
     The map can be used to relocalize for the device's current position. */
    JS_ASSIGN_ENUM(ARWorldMappingStatusMapped, NSInteger); // 
  //} NS_SWIFT_NAME(ARFrame.WorldMappingStatus);

JS_INIT_CLASS_END(ARFrame, NSObject);

NAN_METHOD(NARFrame::New) {
  JS_RECONSTRUCT(ARFrame);
  @autoreleasepool {
    ARFrame* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARFrame *)(info[0].As<External>()->Value());
    }
    if (self) {
      NARFrame *wrapper = new NARFrame();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARFrame::New: invalid arguments");
    }
  }
}

#include "NARHitTestResult.h"

NAN_METHOD(NARFrame::hitTestTypes) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_value(ARHitTestResultType, types);
    JS_SET_RETURN(js_value_NSArray<ARHitTestResult*>([self hitTest: point types: types]));
  }
}

#include "NARRaycastQuery.h"

NAN_METHOD(NARFrame::raycastQueryFromPointAllowingTargetAlignment) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_value(ARRaycastTarget, target);
    declare_value(ARRaycastTargetAlignment, alignment);
    JS_SET_RETURN(js_value_ARRaycastQuery([self raycastQueryFromPoint: point allowingTarget: target alignment: alignment]));
  }
}

#include "NUIApplication.h"

NAN_METHOD(NARFrame::displayTransformForOrientationViewportSize) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIInterfaceOrientation, orientation);
    declare_value(CGSize, viewportSize);
    JS_SET_RETURN(js_value_CGAffineTransform([self displayTransformForOrientation: orientation viewportSize: viewportSize]));
  }
}

NAN_GETTER(NARFrame::timestampGetter) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self timestamp]));
  }
}

NAN_GETTER(NARFrame::capturedImageGetter) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CVPixelBufferRef([self capturedImage]));
  }
}

#include "NMTLTexture.h"

NAN_GETTER(NARFrame::cameraGrainTextureGetter) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTexture([self cameraGrainTexture]));
  }
}

NAN_GETTER(NARFrame::cameraGrainIntensityGetter) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self cameraGrainIntensity]));
  }
}

#define js_value_AVDepthData(x) js_value_wrapper_unknown(x, AVDepthData)
#define to_value_AVDepthData(x) to_value_wrapper_unknown(x, AVDepthData)
#define is_value_AVDepthData(x) is_value_wrapper_unknown(x, AVDepthData)

NAN_GETTER(NARFrame::capturedDepthDataGetter) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVDepthData([self capturedDepthData]));
  }
}

NAN_GETTER(NARFrame::capturedDepthDataTimestampGetter) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self capturedDepthDataTimestamp]));
  }
}

NAN_GETTER(NARFrame::cameraGetter) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARCamera([self camera]));
  }
}

NAN_GETTER(NARFrame::anchorsGetter) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<ARAnchor*>([self anchors]));
  }
}

NAN_GETTER(NARFrame::lightEstimateGetter) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARLightEstimate([self lightEstimate]));
  }
}

#include "NARPointCloud.h"

NAN_GETTER(NARFrame::rawFeaturePointsGetter) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARPointCloud([self rawFeaturePoints]));
  }
}

NAN_GETTER(NARFrame::worldMappingStatusGetter) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARWorldMappingStatus([self worldMappingStatus]));
  }
}

NAN_GETTER(NARFrame::segmentationBufferGetter) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CVPixelBufferRef([self segmentationBuffer]));
  }
}

NAN_GETTER(NARFrame::estimatedDepthDataGetter) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CVPixelBufferRef([self estimatedDepthData]));
  }
}

#define js_value_ARBody2D(x) js_value_wrapper_unknown(x, ARBody2D)
#define to_value_ARBody2D(x) to_value_wrapper_unknown(x, ARBody2D)
#define is_value_ARBody2D(x) is_value_wrapper_unknown(x, ARBody2D)

NAN_GETTER(NARFrame::detectedBodyGetter) {
  JS_UNWRAP(ARFrame, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARBody2D([self detectedBody]));
  }
}


#endif
