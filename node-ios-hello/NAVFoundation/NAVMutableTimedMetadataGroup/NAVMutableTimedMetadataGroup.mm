//
//  NAVMutableTimedMetadataGroup.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVMutableTimedMetadataGroup.h"

#define instancetype AVMutableTimedMetadataGroup
#define js_value_instancetype js_value_AVMutableTimedMetadataGroup

NAVMutableTimedMetadataGroup::NAVMutableTimedMetadataGroup() {}
NAVMutableTimedMetadataGroup::~NAVMutableTimedMetadataGroup() {}

JS_INIT_CLASS(AVMutableTimedMetadataGroup, AVTimedMetadataGroup);
  JS_ASSIGN_PROTO_PROP(timeRange);
  JS_ASSIGN_PROTO_PROP(items);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVMutableTimedMetadataGroup, AVTimedMetadataGroup);
  // constant values (exports)
JS_INIT_CLASS_END(AVMutableTimedMetadataGroup, AVTimedMetadataGroup);

NAN_METHOD(NAVMutableTimedMetadataGroup::New) {
  JS_RECONSTRUCT(AVMutableTimedMetadataGroup);
  @autoreleasepool {
    AVMutableTimedMetadataGroup* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVMutableTimedMetadataGroup *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVMutableTimedMetadataGroup alloc] init];
    }
    if (self) {
      NAVMutableTimedMetadataGroup *wrapper = new NAVMutableTimedMetadataGroup();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVMutableTimedMetadataGroup::New: invalid arguments");
    }
  }
}

#include "NCMTimeRange.h"

NAN_GETTER(NAVMutableTimedMetadataGroup::timeRangeGetter) {
  JS_UNWRAP(AVMutableTimedMetadataGroup, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMTimeRange([self timeRange]));
  }
}

NAN_SETTER(NAVMutableTimedMetadataGroup::timeRangeSetter) {
  JS_UNWRAP(AVMutableTimedMetadataGroup, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CMTimeRange, input);
    [self setTimeRange: input];
  }
}

NAN_GETTER(NAVMutableTimedMetadataGroup::itemsGetter) {
  JS_UNWRAP(AVMutableTimedMetadataGroup, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVMetadataItem*>([self items]));
  }
}

NAN_SETTER(NAVMutableTimedMetadataGroup::itemsSetter) {
  JS_UNWRAP(AVMutableTimedMetadataGroup, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<AVMetadataItem*>, input);
    [self setItems: input];
  }
}
