//
//  NARSession.mm
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARSession.h"

#if TARGET_OS_IPHONE

#define instancetype ARSession
#define js_value_instancetype js_value_ARSession

#include "NARAnchor.h"
#include "NARFrame.h"
#include "NARWorldTrackingConfiguration.h"

NARSession::NARSession () {}
NARSession::~NARSession () {}

JS_INIT_CLASS(ARSession, NSObject);
  JS_ASSIGN_PROTO_METHOD(runWithConfiguration);
  JS_ASSIGN_PROTO_METHOD(runWithConfigurationOptions);
  JS_ASSIGN_PROTO_METHOD(pause);
  JS_ASSIGN_PROTO_METHOD(addAnchor);
  JS_ASSIGN_PROTO_METHOD(removeAnchor);
  JS_ASSIGN_PROTO_METHOD(setWorldOrigin);
  JS_ASSIGN_PROTO_METHOD(getCurrentWorldMapWithCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(createReferenceObjectWithTransformCenterExtentCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(raycast);
  JS_ASSIGN_PROTO_METHOD(trackedRaycastUpdateHandler);
  JS_ASSIGN_PROTO_METHOD(updateWithCollaborationData);
  JS_ASSIGN_PROTO_PROP_READONLY(identifier);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(delegateQueue);
  JS_ASSIGN_PROTO_PROP_READONLY(currentFrame);
  JS_ASSIGN_PROTO_PROP_READONLY(configuration);
  JS_ASSIGN_PROTO_PROP_READONLY(identifier);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(delegateQueue);
  JS_ASSIGN_PROTO_PROP_READONLY(currentFrame);
  JS_ASSIGN_PROTO_PROP_READONLY(configuration);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARSession, NSObject);
  // alias members
  JS_ASSIGN_PROTO_METHOD_AS(runWithConfiguration, "run");
  JS_ASSIGN_PROTO_METHOD_AS(addAnchor, "add");
  JS_ASSIGN_PROTO_METHOD_AS(removeAnchor, "remove");
  // constants (exports)
  /**
   Set of options for running the session.
   @discussion These options alter the behavior of calling run on a session.
   Providing no options will result in the default behavior of resuming tracking
   from the last known position and keeping all existing anchors.
   */
  //API_AVAILABLE(ios(11.0))
  //typedef NS_OPTIONS(NSUInteger, ARSessionRunOptions) {
    /** The session will reset tracking. */
    JS_ASSIGN_ENUM(ARSessionRunOptionResetTracking, NSInteger); //            = (1 << 0),
    
    /** The session will remove existing anchors. */
    JS_ASSIGN_ENUM(ARSessionRunOptionRemoveExistingAnchors, NSInteger); //    = (1 << 1)
  //} NS_SWIFT_NAME(ARSession.RunOptions);
  
JS_INIT_CLASS_END(ARSession, NSObject);

NAN_METHOD(NARSession::New) {
  JS_RECONSTRUCT(ARSession);
  @autoreleasepool {
    ARSession* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARSession *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[ARSession alloc] init];
    }
    if (self) {
      NARSession *wrapper = new NARSession();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARSession::New: invalid arguments");
    }
  }
}

NAN_METHOD(NARSession::runWithConfiguration) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(ARConfiguration, configuration);
    [self runWithConfiguration: configuration];
  }
}

#include "NARConfiguration.h"

NAN_METHOD(NARSession::runWithConfigurationOptions) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(ARConfiguration, configuration);
    declare_value(ARSessionRunOptions, options);
    [self runWithConfiguration: configuration options: options];
  }
}

NAN_METHOD(NARSession::pause) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    [self pause];
  }
}

NAN_METHOD(NARSession::addAnchor) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(ARAnchor, anchor);
    [self addAnchor: anchor];
  }
}

NAN_METHOD(NARSession::removeAnchor) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(ARAnchor, anchor);
    [self removeAnchor: anchor];
  }
}

NAN_METHOD(NARSession::setWorldOrigin) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_float4x4, relativeTransform);
    [self setWorldOrigin: relativeTransform];
  }
}

#include "NARWorldMap.h"
#include "NNSError.h"

NAN_METHOD(NARSession::getCurrentWorldMapWithCompletionHandler) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(completionHandler);
    [self getCurrentWorldMapWithCompletionHandler:^(ARWorldMap * _Nullable worldMap, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NARSession::getCurrentWorldMapWithCompletionHandler",
            js_value_ARWorldMap(worldMap),
            js_value_NSError(error));
        }
      });
    }];
  }
}

#include "NARReferenceObject.h"

NAN_METHOD(NARSession::createReferenceObjectWithTransformCenterExtentCompletionHandler) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_float4x4, transform);
    declare_value(simd_float3, center);
    declare_value(simd_float3, extent);
    declare_callback(completionHandler);
    [self createReferenceObjectWithTransform: transform center: center extent: extent completionHandler:^(ARReferenceObject * _Nullable referenceObject, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NARSession::createReferenceObjectWithTransformCenterExtentCompletionHandler",
            js_value_ARReferenceObject(referenceObject),
            js_value_NSError(error));
        }
      });
    }];
  }
}

#include "NARRaycastQuery.h"

NAN_METHOD(NARSession::raycast) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(ARRaycastQuery, query);
    JS_SET_RETURN(js_value_NSArray<ARRaycastResult*>([self raycast: query]));
  }
}

#include "NARTrackedRaycast.h"

NAN_METHOD(NARSession::trackedRaycastUpdateHandler) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(ARRaycastQuery, query);
    declare_callback(updateHandler);
    JS_SET_RETURN(js_value_ARTrackedRaycast([self trackedRaycast: query updateHandler:^(NSArray<ARRaycastResult *> * _Nonnull results) {
      dispatch_main(^{
        if (updateHandler) {
          [updateHandler jsFunction]->Call("NARSession::trackedRaycastUpdateHandler",
            js_value_NSArray<ARRaycastResult*>(results));
        }
      });
    }]));
  }
}

#include "NARCollaborationData.h"

NAN_METHOD(NARSession::updateWithCollaborationData) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(ARCollaborationData, collaborationData);
    [self updateWithCollaborationData: collaborationData];
  }
}

#include "NNSUUID.h"

NAN_GETTER(NARSession::identifierGetter) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUUID([self identifier]));
  }
}

#include "NARSessionDelegate.h"

NAN_GETTER(NARSession::delegateGetter) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARSessionDelegate([self delegate]));
  }
}

NAN_SETTER(NARSession::delegateSetter) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(ARSessionDelegate, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"NARSession::delegate"];
  }
}

#include "NDispatchQueue.h"

NAN_GETTER(NARSession::delegateQueueGetter) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_dispatch_queue_t([self delegateQueue]));
  }
}

NAN_SETTER(NARSession::delegateQueueSetter) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(dispatch_queue_t, input);
    [self setDelegateQueue: input];
  }
}

#include "NARFrame.h"

NAN_GETTER(NARSession::currentFrameGetter) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARFrame([self currentFrame]));
  }
}

#include "NARConfiguration.h"

NAN_GETTER(NARSession::configurationGetter) {
  JS_UNWRAP(ARSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARConfiguration([self configuration]));
  }
}

#endif
