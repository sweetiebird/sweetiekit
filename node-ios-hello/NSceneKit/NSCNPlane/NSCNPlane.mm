//
//  SCNPlane.mm
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNPlane.h"

NSCNPlane::NSCNPlane () {}
NSCNPlane::~NSCNPlane () {}

JS_INIT_CLASS(SCNPlane, SCNGeometry);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, width);
  JS_ASSIGN_PROP(proto, height);
  JS_ASSIGN_PROP(proto, widthSegmentCount);
  JS_ASSIGN_PROP(proto, heightSegmentCount);
  JS_ASSIGN_PROP(proto, cornerRadius);
  JS_ASSIGN_PROP(proto, cornerSegmentCount);
  // static members (ctor)
  JS_INIT_CTOR(SCNPlane, SCNGeometry);
  JS_ASSIGN_METHOD(ctor, planeWithWidthHeight);
JS_INIT_CLASS_END(SCNPlane, SCNGeometry);

SCNPlane*
SCNPlane_planeWithWidthHeight(
  Local<Value> width,
  Local<Value> height)
{
  return [SCNPlane
            planeWithWidth:TO_FLOAT(width)
            height:TO_FLOAT(height)];
}

NAN_METHOD(NSCNPlane::planeWithWidthHeight) {
  @autoreleasepool
  {
    Local<Value> argv[] = {
      Nan::New<External>((__bridge void*)
        SCNPlane_planeWithWidthHeight(info[0], info[1]))
    };
    JS_SET_RETURN(JS_NEW_ARGV(NSCNPlane, argv));
  }
}

NAN_METHOD(NSCNPlane::New) {
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `SCNPlane(...)`, turn into construct call.
      JS_SET_RETURN_NEW(SCNPlane, info);
      return;
    }
    SCNPlane* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge SCNPlane *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 2) {
      self = SCNPlane_planeWithWidthHeight(info[0], info[1]);
    } else if (info.Length() >= 1 && info[0]->IsObject() && JS_HAS(JS_OBJ(info[0]), JS_STR("width"))) {
      self = SCNPlane_planeWithWidthHeight(
          JS_OBJ(info[0])->Get(JS_STR("width")),
          JS_OBJ(info[0])->Get(JS_STR("height"))
        );
    } else if (info.Length() <= 0) {
      self = [[SCNPlane alloc] init];
    }
    if (self) {
      NSCNPlane *wrapper = new NSCNPlane();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNPlane::New: invalid arguments");
    }
  }
}

NAN_GETTER(NSCNPlane::widthGetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self width]));
    return;
  }
}

NAN_SETTER(NSCNPlane::widthSetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    [self setWidth: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNPlane::heightGetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self height]));
    return;
  }
}

NAN_SETTER(NSCNPlane::heightSetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    [self setHeight: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNPlane::widthSegmentCountGetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self widthSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNPlane::widthSegmentCountSetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    [self setWidthSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNPlane::heightSegmentCountGetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self heightSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNPlane::heightSegmentCountSetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    [self setHeightSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNPlane::cornerRadiusGetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self cornerRadius]));
    return;
  }
}

NAN_SETTER(NSCNPlane::cornerRadiusSetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    [self setCornerRadius: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNPlane::cornerSegmentCountGetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self cornerSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNPlane::cornerSegmentCountSetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    [self setCornerSegmentCount: to_value_NSInteger(value)];
  }
}
