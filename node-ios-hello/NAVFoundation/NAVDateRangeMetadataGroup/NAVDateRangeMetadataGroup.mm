//
//  NAVDateRangeMetadataGroup.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVDateRangeMetadataGroup.h"

#define instancetype AVDateRangeMetadataGroup
#define js_value_instancetype js_value_AVDateRangeMetadataGroup

NAVDateRangeMetadataGroup::NAVDateRangeMetadataGroup() {}
NAVDateRangeMetadataGroup::~NAVDateRangeMetadataGroup() {}

JS_INIT_CLASS(AVDateRangeMetadataGroup, AVMetadataGroup);
  JS_ASSIGN_PROTO_METHOD(initWithItemsStartDateEndDate);
  JS_ASSIGN_PROTO_PROP_READONLY(startDate);
  JS_ASSIGN_PROTO_PROP_READONLY(endDate);
  JS_ASSIGN_PROTO_PROP_READONLY(items);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVDateRangeMetadataGroup, AVMetadataGroup);
  // constant values (exports)
JS_INIT_CLASS_END(AVDateRangeMetadataGroup, AVMetadataGroup);

NAN_METHOD(NAVDateRangeMetadataGroup::New) {
  JS_RECONSTRUCT(AVDateRangeMetadataGroup);
  @autoreleasepool {
    AVDateRangeMetadataGroup* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVDateRangeMetadataGroup *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVDateRangeMetadataGroup alloc] init];
    }
    if (self) {
      NAVDateRangeMetadataGroup *wrapper = new NAVDateRangeMetadataGroup();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVDateRangeMetadataGroup::New: invalid arguments");
    }
  }
}

NAN_METHOD(NAVDateRangeMetadataGroup::initWithItemsStartDateEndDate) {
  JS_UNWRAP_OR_ALLOC(AVDateRangeMetadataGroup, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<AVMetadataItem*>, items);
    declare_pointer(NSDate, startDate);
    declare_nullable_pointer(NSDate, endDate);
    JS_SET_RETURN(js_value_instancetype([self initWithItems: items startDate: startDate endDate: endDate]));
  }
}

NAN_GETTER(NAVDateRangeMetadataGroup::startDateGetter) {
  JS_UNWRAP(AVDateRangeMetadataGroup, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDate([self startDate]));
  }
}

NAN_GETTER(NAVDateRangeMetadataGroup::endDateGetter) {
  JS_UNWRAP(AVDateRangeMetadataGroup, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDate([self endDate]));
  }
}

NAN_GETTER(NAVDateRangeMetadataGroup::itemsGetter) {
  JS_UNWRAP(AVDateRangeMetadataGroup, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVMetadataItem*>([self items]));
  }
}
