//
//  NSCNHitTestResult.mm
//
//  Created by Shawn Presser on 6/2/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNHitTestResult.h"

NSCNHitTestResult::NSCNHitTestResult() {}
NSCNHitTestResult::~NSCNHitTestResult() {}

JS_INIT_CLASS(SCNHitTestResult, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, node);
  JS_ASSIGN_PROP_READONLY(proto, geometryIndex);
  JS_ASSIGN_PROP_READONLY(proto, faceIndex);
  JS_ASSIGN_PROP_READONLY(proto, localCoordinates);
  JS_ASSIGN_PROP_READONLY(proto, worldCoordinates);
  JS_ASSIGN_PROP_READONLY(proto, localNormal);
  JS_ASSIGN_PROP_READONLY(proto, worldNormal);
  JS_ASSIGN_PROP_READONLY(proto, modelTransform);
  JS_ASSIGN_PROP_READONLY(proto, boneNode);
  // static members (ctor)
  JS_INIT_CTOR(SCNHitTestResult, NSObject);
JS_INIT_CLASS_END(SCNHitTestResult, NSObject);

NAN_METHOD(NSCNHitTestResult::New) {
  JS_RECONSTRUCT(SCNHitTestResult);
  @autoreleasepool {
    SCNHitTestResult* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNHitTestResult *)(info[0].As<External>()->Value());
    } else if(info.Length() <= 0) {
      self = [[SCNHitTestResult alloc] init];
    }
    if (self) {
      NSCNHitTestResult *wrapper = new NSCNHitTestResult();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNHitTestResult::New: invalid arguments");
    }
  }
}

#include "NSCNNode.h"

NAN_GETTER(NSCNHitTestResult::nodeGetter) {
  JS_UNWRAP(SCNHitTestResult, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNNode([self node]));
    return;
  }
}

NAN_GETTER(NSCNHitTestResult::geometryIndexGetter) {
  JS_UNWRAP(SCNHitTestResult, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self geometryIndex]));
    return;
  }
}

NAN_GETTER(NSCNHitTestResult::faceIndexGetter) {
  JS_UNWRAP(SCNHitTestResult, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self faceIndex]));
    return;
  }
}

NAN_GETTER(NSCNHitTestResult::localCoordinatesGetter) {
  JS_UNWRAP(SCNHitTestResult, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self localCoordinates]));
    return;
  }
}

NAN_GETTER(NSCNHitTestResult::worldCoordinatesGetter) {
  JS_UNWRAP(SCNHitTestResult, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self worldCoordinates]));
    return;
  }
}

NAN_GETTER(NSCNHitTestResult::localNormalGetter) {
  JS_UNWRAP(SCNHitTestResult, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self localNormal]));
    return;
  }
}

NAN_GETTER(NSCNHitTestResult::worldNormalGetter) {
  JS_UNWRAP(SCNHitTestResult, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self worldNormal]));
    return;
  }
}

NAN_GETTER(NSCNHitTestResult::modelTransformGetter) {
  JS_UNWRAP(SCNHitTestResult, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMatrix4([self modelTransform]));
    return;
  }
}

NAN_GETTER(NSCNHitTestResult::boneNodeGetter) {
  JS_UNWRAP(SCNHitTestResult, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNNode([self boneNode]));
    return;
  }
}

