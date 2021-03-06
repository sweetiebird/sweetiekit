//
//  SCNCapsule.mm
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNCapsule.h"

NSCNCapsule::NSCNCapsule () {}
NSCNCapsule::~NSCNCapsule () {}

JS_INIT_CLASS(SCNCapsule, SCNGeometry);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, capRadius);
  JS_ASSIGN_PROP(proto, height);
  JS_ASSIGN_PROP(proto, radialSegmentCount);
  JS_ASSIGN_PROP(proto, heightSegmentCount);
  JS_ASSIGN_PROP(proto, capSegmentCount);
  // static members (ctor)
  JS_INIT_CTOR(SCNCapsule, SCNGeometry);
  JS_ASSIGN_METHOD(ctor, capsuleWithCapRadiusHeight);
JS_INIT_CLASS_END(SCNCapsule, SCNGeometry);

SCNCapsule*
SCNCapsule_capsuleWithCapRadiusHeight(
  Local<Value> radius,
  Local<Value> height)
{
  return [SCNCapsule
            capsuleWithCapRadius:TO_FLOAT(radius)
            height:TO_FLOAT(height)];
}

NAN_METHOD(NSCNCapsule::capsuleWithCapRadiusHeight) {
  @autoreleasepool
  {
    Local<Value> argv[] = {
      Nan::New<External>((__bridge void*)
        SCNCapsule_capsuleWithCapRadiusHeight(info[0], info[1]))
    };
    JS_SET_RETURN(JS_NEW_ARGV(NSCNCapsule, argv));
  }
}

NAN_METHOD(NSCNCapsule::New) {
  JS_RECONSTRUCT(SCNCapsule);
  @autoreleasepool {
    SCNCapsule* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNCapsule *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 2 && info[0]->IsNumber()) {
      self = SCNCapsule_capsuleWithCapRadiusHeight(info[0], info[1]);
    } else if (info.Length() >= 1 && info[0]->IsObject() && JS_HAS(JS_OBJ(info[0]), JS_STR("capRadius"))) {
      self = SCNCapsule_capsuleWithCapRadiusHeight(
          JS_OBJ(info[0])->Get(JS_STR("capRadius")),
          JS_OBJ(info[0])->Get(JS_STR("height"))
        );
    } else if (info.Length() <= 0) {
      self = [[SCNCapsule alloc] init];
    }
    if (self) {
      NSCNCapsule *wrapper = new NSCNCapsule();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else if (info.Length() <= 0) {
      Nan::ThrowError("SCNCapsule::New: invalid arguments");
    }
  }
}

NAN_GETTER(NSCNCapsule::capRadiusGetter) {
  JS_UNWRAP(SCNCapsule, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self capRadius]));
    return;
  }
}

NAN_SETTER(NSCNCapsule::capRadiusSetter) {
  JS_UNWRAP(SCNCapsule, self);
  @autoreleasepool
  {
    [self setCapRadius: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNCapsule::heightGetter) {
  JS_UNWRAP(SCNCapsule, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self height]));
    return;
  }
}

NAN_SETTER(NSCNCapsule::heightSetter) {
  JS_UNWRAP(SCNCapsule, self);
  @autoreleasepool
  {
    [self setHeight: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNCapsule::radialSegmentCountGetter) {
  JS_UNWRAP(SCNCapsule, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self radialSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNCapsule::radialSegmentCountSetter) {
  JS_UNWRAP(SCNCapsule, self);
  @autoreleasepool
  {
    [self setRadialSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNCapsule::heightSegmentCountGetter) {
  JS_UNWRAP(SCNCapsule, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self heightSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNCapsule::heightSegmentCountSetter) {
  JS_UNWRAP(SCNCapsule, self);
  @autoreleasepool
  {
    [self setHeightSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNCapsule::capSegmentCountGetter) {
  JS_UNWRAP(SCNCapsule, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self capSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNCapsule::capSegmentCountSetter) {
  JS_UNWRAP(SCNCapsule, self);
  @autoreleasepool
  {
    [self setCapSegmentCount: to_value_NSInteger(value)];
  }
}

