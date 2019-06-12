//
//  SCNPyramid.mm
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNPyramid.h"

NSCNPyramid::NSCNPyramid() {}
NSCNPyramid::~NSCNPyramid() {}

JS_INIT_CLASS(SCNPyramid, SCNGeometry);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, width);
  JS_ASSIGN_PROP(proto, height);
  JS_ASSIGN_PROP(proto, length);
  JS_ASSIGN_PROP(proto, widthSegmentCount);
  JS_ASSIGN_PROP(proto, heightSegmentCount);
  JS_ASSIGN_PROP(proto, lengthSegmentCount);
  // static members (ctor)
  JS_INIT_CTOR(SCNPyramid, SCNGeometry);
  JS_ASSIGN_METHOD(ctor, pyramidWithWidthHeightLength);
JS_INIT_CLASS_END(SCNPyramid, SCNGeometry);

SCNPyramid*
SCNPyramid_pyramidWithWidthHeightLength(
  Local<Value> width,
  Local<Value> height,
  Local<Value> length)
{
  return [SCNPyramid
            pyramidWithWidth:TO_FLOAT(width)
            height:TO_FLOAT(height)
            length:TO_FLOAT(length)];
}

NAN_METHOD(NSCNPyramid::pyramidWithWidthHeightLength) {
  @autoreleasepool
  {
    Local<Value> argv[] = {
      Nan::New<External>((__bridge void*)
        SCNPyramid_pyramidWithWidthHeightLength(info[0], info[1], info[2]))
    };
    JS_SET_RETURN(JS_NEW_ARGV(NSCNPyramid, argv));
  }
}

NAN_METHOD(NSCNPyramid::New) {
  JS_RECONSTRUCT(SCNPyramid);
  @autoreleasepool {
    SCNPyramid* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNPyramid *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 3) {
      self = SCNPyramid_pyramidWithWidthHeightLength(info[0], info[1], info[2]);
    } else if (info.Length() >= 1 && info[0]->IsObject() && JS_HAS(JS_OBJ(info[0]), JS_STR("width"))) {
      self = SCNPyramid_pyramidWithWidthHeightLength(
          JS_OBJ(info[0])->Get(JS_STR("width")),
          JS_OBJ(info[0])->Get(JS_STR("height")),
          JS_OBJ(info[0])->Get(JS_STR("length"))
        );
    } else if (info.Length() <= 0) {
      self = [[SCNPyramid alloc] init];
    }
    if (self) {
      NSCNPyramid *wrapper = new NSCNPyramid();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNPyramid::New: invalid arguments");
    }
  }
}

NAN_GETTER(NSCNPyramid::widthGetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self width]));
    return;
  }
}

NAN_SETTER(NSCNPyramid::widthSetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    [self setWidth: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNPyramid::heightGetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self height]));
    return;
  }
}

NAN_SETTER(NSCNPyramid::heightSetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    [self setHeight: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNPyramid::lengthGetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self length]));
    return;
  }
}

NAN_SETTER(NSCNPyramid::lengthSetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    [self setLength: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNPyramid::widthSegmentCountGetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self widthSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNPyramid::widthSegmentCountSetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    [self setWidthSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNPyramid::heightSegmentCountGetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self heightSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNPyramid::heightSegmentCountSetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    [self setHeightSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNPyramid::lengthSegmentCountGetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self lengthSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNPyramid::lengthSegmentCountSetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    [self setLengthSegmentCount: to_value_NSInteger(value)];
  }
}
