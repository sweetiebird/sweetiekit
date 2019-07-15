//
//  NARCollaborationData.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARCollaborationData.h"

#define instancetype ARCollaborationData
#define js_value_instancetype js_value_ARCollaborationData

NARCollaborationData::NARCollaborationData() {}
NARCollaborationData::~NARCollaborationData() {}

JS_INIT_CLASS(ARCollaborationData, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(priority);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARCollaborationData, NSObject);
  // constant values (exports)

  /**
   A value describing the priority of the collaboration data.
   */
#if defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && (__IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_13_0)
  //API_AVAILABLE(ios(13.0))
  //typedef NS_ENUM(NSInteger, ARCollaborationDataPriority) {
    
    /// The data is important for establishing or continuing a collaborative session. For best results, use network transmission mechanisms that ensure delivery, such as MCSessionSendDataModeReliable.
    JS_ASSIGN_ENUM(ARCollaborationDataPriorityCritical, NSInteger);
    
    /// The data is time-sensitive but not important to collaborative session quality. Timely synchronization of this data between participants produces a smoother shared session, but the session can continue if the data is not received.
    /// For best results, use network transmission mechanisms that prioritize speed over delivery guarantees, such as MCSessionSendDataModeUnreliable.
    JS_ASSIGN_ENUM(ARCollaborationDataPriorityOptional, NSInteger);
  //} NS_SWIFT_NAME(ARCollaborationData.Priority);
#endif

JS_INIT_CLASS_END(ARCollaborationData, NSObject);

NAN_METHOD(NARCollaborationData::New) {
  JS_RECONSTRUCT(ARCollaborationData);
  @autoreleasepool {
    ARCollaborationData* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARCollaborationData *)(info[0].As<External>()->Value());
    }
    if (self) {
      NARCollaborationData *wrapper = new NARCollaborationData();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARCollaborationData::New: invalid arguments");
    }
  }
}

NAN_GETTER(NARCollaborationData::priorityGetter) {
  JS_UNWRAP(ARCollaborationData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARCollaborationDataPriority([self priority]));
  }
}
