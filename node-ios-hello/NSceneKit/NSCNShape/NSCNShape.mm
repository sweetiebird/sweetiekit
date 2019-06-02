//
//  SCNShape.mm
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNShape.h"

NSCNShape::NSCNShape () {}
NSCNShape::~NSCNShape () {}

JS_INIT_CLASS(SCNShape, SCNGeometry);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, path);
  JS_ASSIGN_PROP(proto, extrusionDepth);
  JS_ASSIGN_PROP(proto, chamferMode);
  JS_ASSIGN_PROP(proto, chamferRadius);
  JS_ASSIGN_PROP(proto, chamferProfile);
  // static members (ctor)
  JS_INIT_CTOR(SCNShape, SCNGeometry);
  JS_ASSIGN_METHOD(ctor, shapeWithPathExtrusionDepth);
JS_INIT_CLASS_END(SCNShape, SCNGeometry);

#include "NUIBezierPath.h"

SCNShape*
SCNShape_shapeWithPathExtrusionDepth(
  Local<Value> path,
  Local<Value> extrusionDepth)
{
  return [SCNShape
            shapeWithPath:to_value_UIBezierPath(path)
            extrusionDepth:TO_FLOAT(extrusionDepth)];
}

NAN_METHOD(NSCNShape::shapeWithPathExtrusionDepth) {
  @autoreleasepool
  {
    Local<Value> argv[] = {
      Nan::New<External>((__bridge void*)
        SCNShape_shapeWithPathExtrusionDepth(info[0], info[1]))
    };
    JS_SET_RETURN(JS_NEW_ARGV(NSCNShape, argv));
  }
}

NAN_METHOD(NSCNShape::New) {
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `SCNShape(...)`, turn into construct call.
      JS_SET_RETURN_NEW(SCNShape, info);
      return;
    }
    SCNShape* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge SCNShape *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 2 && info[0]->IsNumber()) {
      self = SCNShape_shapeWithPathExtrusionDepth(info[0], info[1]);
    } else if (info.Length() >= 1 && info[0]->IsObject() && JS_HAS(JS_OBJ(info[0]), JS_STR("path"))) {
      self = SCNShape_shapeWithPathExtrusionDepth(
          JS_OBJ(info[0])->Get(JS_STR("path")),
          JS_OBJ(info[0])->Get(JS_STR("extrusionDepth"))
        );
    } else if (info.Length() <= 0) {
      self = [[SCNShape alloc] init];
    }
    if (self) {
      NSCNShape *wrapper = new NSCNShape();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else if (info.Length() <= 0) {
      Nan::ThrowError("SCNShape::New: invalid arguments");
    }
  }
}

#include "NUIBezierPath.h"

NAN_GETTER(NSCNShape::pathGetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIBezierPath([self path]));
    return;
  }
}

NAN_SETTER(NSCNShape::pathSetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    [self setPath: to_value_UIBezierPath(value)];
  }
}

NAN_GETTER(NSCNShape::extrusionDepthGetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self extrusionDepth]));
    return;
  }
}

NAN_SETTER(NSCNShape::extrusionDepthSetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    [self setExtrusionDepth: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNShape::chamferModeGetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNChamferMode([self chamferMode]));
    return;
  }
}

NAN_SETTER(NSCNShape::chamferModeSetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    [self setChamferMode: to_value_SCNChamferMode(value)];
  }
}

NAN_GETTER(NSCNShape::chamferRadiusGetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self chamferRadius]));
    return;
  }
}

NAN_SETTER(NSCNShape::chamferRadiusSetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    [self setChamferRadius: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNShape::chamferProfileGetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIBezierPath([self chamferProfile]));
    return;
  }
}

NAN_SETTER(NSCNShape::chamferProfileSetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    [self setChamferProfile: to_value_UIBezierPath(value)];
  }
}
