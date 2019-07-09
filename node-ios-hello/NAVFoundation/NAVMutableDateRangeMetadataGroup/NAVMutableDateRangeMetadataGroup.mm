//
//  NAVMutableDateRangeMetadataGroup.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVMutableDateRangeMetadataGroup.h"

#define instancetype AVMutableDateRangeMetadataGroup
#define js_value_instancetype js_value_AVMutableDateRangeMetadataGroup

NAVMutableDateRangeMetadataGroup::NAVMutableDateRangeMetadataGroup() {}
NAVMutableDateRangeMetadataGroup::~NAVMutableDateRangeMetadataGroup() {}

JS_INIT_CLASS(AVMutableDateRangeMetadataGroup, AVDateRangeMetadataGroup);
  JS_ASSIGN_PROTO_PROP(startDate);
  JS_ASSIGN_PROTO_PROP(endDate);
  JS_ASSIGN_PROTO_PROP(items);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVMutableDateRangeMetadataGroup, AVDateRangeMetadataGroup);
  // constant values (exports)
JS_INIT_CLASS_END(AVMutableDateRangeMetadataGroup, AVDateRangeMetadataGroup);

NAN_METHOD(NAVMutableDateRangeMetadataGroup::New) {
  JS_RECONSTRUCT(AVMutableDateRangeMetadataGroup);
  @autoreleasepool {
    AVMutableDateRangeMetadataGroup* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVMutableDateRangeMetadataGroup *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVMutableDateRangeMetadataGroup alloc] init];
    }
    if (self) {
      NAVMutableDateRangeMetadataGroup *wrapper = new NAVMutableDateRangeMetadataGroup();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVMutableDateRangeMetadataGroup::New: invalid arguments");
    }
  }
}

NAN_GETTER(NAVMutableDateRangeMetadataGroup::startDateGetter) {
  JS_UNWRAP(AVMutableDateRangeMetadataGroup, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDate([self startDate]));
  }
}

NAN_SETTER(NAVMutableDateRangeMetadataGroup::startDateSetter) {
  JS_UNWRAP(AVMutableDateRangeMetadataGroup, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDate, input);
    [self setStartDate: input];
  }
}

NAN_GETTER(NAVMutableDateRangeMetadataGroup::endDateGetter) {
  JS_UNWRAP(AVMutableDateRangeMetadataGroup, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDate([self endDate]));
  }
}

NAN_SETTER(NAVMutableDateRangeMetadataGroup::endDateSetter) {
  JS_UNWRAP(AVMutableDateRangeMetadataGroup, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDate, input);
    [self setEndDate: input];
  }
}

NAN_GETTER(NAVMutableDateRangeMetadataGroup::itemsGetter) {
  JS_UNWRAP(AVMutableDateRangeMetadataGroup, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVMetadataItem*>([self items]));
  }
}

NAN_SETTER(NAVMutableDateRangeMetadataGroup::itemsSetter) {
  JS_UNWRAP(AVMutableDateRangeMetadataGroup, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<AVMetadataItem*>, input);
    [self setItems: input];
  }
}
