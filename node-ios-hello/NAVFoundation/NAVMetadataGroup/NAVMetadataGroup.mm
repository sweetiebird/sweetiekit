//
//  NAVMetadataGroup.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVMetadataGroup.h"

#define instancetype AVMetadataGroup
#define js_value_instancetype js_value_AVMetadataGroup

NAVMetadataGroup::NAVMetadataGroup() {}
NAVMetadataGroup::~NAVMetadataGroup() {}

JS_INIT_CLASS(AVMetadataGroup, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(items);
  JS_ASSIGN_PROTO_PROP_READONLY(classifyingLabel);
  JS_ASSIGN_PROTO_PROP_READONLY(uniqueID);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVMetadataGroup, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(AVMetadataGroup, NSObject);

NAN_METHOD(NAVMetadataGroup::New) {
  JS_RECONSTRUCT(AVMetadataGroup);
  @autoreleasepool {
    AVMetadataGroup* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVMetadataGroup *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVMetadataGroup alloc] init];
    }
    if (self) {
      NAVMetadataGroup *wrapper = new NAVMetadataGroup();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVMetadataGroup::New: invalid arguments");
    }
  }
}

NAN_GETTER(NAVMetadataGroup::itemsGetter) {
  JS_UNWRAP(AVMetadataGroup, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVMetadataItem*>([self items]));
  }
}

NAN_GETTER(NAVMetadataGroup::classifyingLabelGetter) {
  JS_UNWRAP(AVMetadataGroup, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self classifyingLabel]));
  }
}

NAN_GETTER(NAVMetadataGroup::uniqueIDGetter) {
  JS_UNWRAP(AVMetadataGroup, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self uniqueID]));
  }
}
