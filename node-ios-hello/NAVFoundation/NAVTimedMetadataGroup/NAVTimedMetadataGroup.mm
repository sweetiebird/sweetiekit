//
//  NAVTimedMetadataGroup.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVTimedMetadataGroup.h"

#define instancetype AVTimedMetadataGroup
#define js_value_instancetype js_value_AVTimedMetadataGroup

NAVTimedMetadataGroup::NAVTimedMetadataGroup() {}
NAVTimedMetadataGroup::~NAVTimedMetadataGroup() {}

JS_INIT_CLASS(AVTimedMetadataGroup, AVMetadataGroup);
  JS_ASSIGN_PROTO_METHOD(initWithItemsTimeRange);
  JS_ASSIGN_PROTO_METHOD(initWithSampleBuffer);
  JS_ASSIGN_PROTO_METHOD(copyFormatDescription);
  JS_ASSIGN_PROTO_PROP_READONLY(timeRange);
  JS_ASSIGN_PROTO_PROP_READONLY(items);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVTimedMetadataGroup, AVMetadataGroup);
  // constant values (exports)
JS_INIT_CLASS_END(AVTimedMetadataGroup, AVMetadataGroup);

NAN_METHOD(NAVTimedMetadataGroup::New) {
  JS_RECONSTRUCT(AVTimedMetadataGroup);
  @autoreleasepool {
    AVTimedMetadataGroup* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVTimedMetadataGroup *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVTimedMetadataGroup alloc] init];
    }
    if (self) {
      NAVTimedMetadataGroup *wrapper = new NAVTimedMetadataGroup();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVTimedMetadataGroup::New: invalid arguments");
    }
  }
}

#include "NCMTimeRange.h"

NAN_METHOD(NAVTimedMetadataGroup::initWithItemsTimeRange) {
  JS_UNWRAP_OR_ALLOC(AVTimedMetadataGroup, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<AVMetadataItem*>, items);
    declare_value(CMTimeRange, timeRange);
    JS_SET_RETURN(js_value_instancetype([self initWithItems: items timeRange: timeRange]));
  }
}

#include "NCMSampleBuffer.h"

NAN_METHOD(NAVTimedMetadataGroup::initWithSampleBuffer) {
  JS_UNWRAP_OR_ALLOC(AVTimedMetadataGroup, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CMSampleBufferRef, sampleBuffer);
    JS_SET_RETURN(js_value_instancetype([self initWithSampleBuffer: sampleBuffer]));
  }
}

#include "NCMFormatDescription.h"

NAN_METHOD(NAVTimedMetadataGroup::copyFormatDescription) {
  JS_UNWRAP(AVTimedMetadataGroup, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMMetadataFormatDescriptionRef([self copyFormatDescription]));
  }
}

NAN_GETTER(NAVTimedMetadataGroup::timeRangeGetter) {
  JS_UNWRAP(AVTimedMetadataGroup, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMTimeRange([self timeRange]));
  }
}

NAN_GETTER(NAVTimedMetadataGroup::itemsGetter) {
  JS_UNWRAP(AVTimedMetadataGroup, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVMetadataItem*>([self items]));
  }
}
