//
//  NSCNGeometryTessellator.mm
//
//  Created by Emily Kolar on 6/10/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNGeometry.h"

#if SCN_ENABLE_METAL

#define instancetype SCNGeometryTessellator
#define js_value_instancetype js_value_SCNGeometryTessellator

NSCNGeometryTessellator::NSCNGeometryTessellator () {}
NSCNGeometryTessellator::~NSCNGeometryTessellator () {}

JS_INIT_CLASS(SCNGeometryTessellator, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(tessellationFactorScale);
  JS_ASSIGN_PROTO_PROP(tessellationPartitionMode);
  JS_ASSIGN_PROTO_PROP(isAdaptive);
  JS_ASSIGN_PROTO_PROP(isScreenSpace);
  JS_ASSIGN_PROTO_PROP(edgeTessellationFactor);
  JS_ASSIGN_PROTO_PROP(insideTessellationFactor);
  JS_ASSIGN_PROTO_PROP(maximumEdgeLength);
  JS_ASSIGN_PROTO_PROP(smoothingMode);
  // static members (ctor)
  JS_INIT_CTOR(SCNGeometryTessellator, NSObject);
JS_INIT_CLASS_END(SCNGeometryTessellator, NSObject);

NAN_METHOD(NSCNGeometryTessellator::New) {
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `SCNGeometryTessellator(...)`, turn into construct call.
      JS_SET_RETURN_NEW(SCNGeometryTessellator, info);
      return;
    }
    SCNGeometryTessellator* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge SCNGeometryTessellator *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNGeometryTessellator alloc] init];
    }

    if (self) {
      NSCNGeometryTessellator *wrapper = new NSCNGeometryTessellator();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNGeometryTessellator::New: invalid arguments");
    }
  }
}

NAN_GETTER(NSCNGeometryTessellator::tessellationFactorScaleGetter) {
  JS_UNWRAP(SCNGeometryTessellator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self tessellationFactorScale]));
  }
}

NAN_SETTER(NSCNGeometryTessellator::tessellationFactorScaleSetter) {
  JS_UNWRAP(SCNGeometryTessellator, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setTessellationFactorScale: input];
  }
}

NAN_GETTER(NSCNGeometryTessellator::tessellationPartitionModeGetter) {
  JS_UNWRAP(SCNGeometryTessellator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTessellationPartitionMode([self tessellationPartitionMode]));
  }
}

NAN_SETTER(NSCNGeometryTessellator::tessellationPartitionModeSetter) {
  JS_UNWRAP(SCNGeometryTessellator, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLTessellationPartitionMode, input);
    [self setTessellationPartitionMode: input];
  }
}

NAN_GETTER(NSCNGeometryTessellator::isAdaptiveGetter) {
  JS_UNWRAP(SCNGeometryTessellator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAdaptive]));
  }
}

NAN_SETTER(NSCNGeometryTessellator::isAdaptiveSetter) {
  JS_UNWRAP(SCNGeometryTessellator, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAdaptive: input];
  }
}

NAN_GETTER(NSCNGeometryTessellator::isScreenSpaceGetter) {
  JS_UNWRAP(SCNGeometryTessellator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isScreenSpace]));
  }
}

NAN_SETTER(NSCNGeometryTessellator::isScreenSpaceSetter) {
  JS_UNWRAP(SCNGeometryTessellator, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setScreenSpace: input];
  }
}

NAN_GETTER(NSCNGeometryTessellator::edgeTessellationFactorGetter) {
  JS_UNWRAP(SCNGeometryTessellator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self edgeTessellationFactor]));
  }
}

NAN_SETTER(NSCNGeometryTessellator::edgeTessellationFactorSetter) {
  JS_UNWRAP(SCNGeometryTessellator, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setEdgeTessellationFactor: input];
  }
}

NAN_GETTER(NSCNGeometryTessellator::insideTessellationFactorGetter) {
  JS_UNWRAP(SCNGeometryTessellator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self insideTessellationFactor]));
  }
}

NAN_SETTER(NSCNGeometryTessellator::insideTessellationFactorSetter) {
  JS_UNWRAP(SCNGeometryTessellator, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setInsideTessellationFactor: input];
  }
}

NAN_GETTER(NSCNGeometryTessellator::maximumEdgeLengthGetter) {
  JS_UNWRAP(SCNGeometryTessellator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self maximumEdgeLength]));
  }
}

NAN_SETTER(NSCNGeometryTessellator::maximumEdgeLengthSetter) {
  JS_UNWRAP(SCNGeometryTessellator, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMaximumEdgeLength: input];
  }
}

NAN_GETTER(NSCNGeometryTessellator::smoothingModeGetter) {
  JS_UNWRAP(SCNGeometryTessellator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNTessellationSmoothingMode([self smoothingMode]));
  }
}

NAN_SETTER(NSCNGeometryTessellator::smoothingModeSetter) {
  JS_UNWRAP(SCNGeometryTessellator, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNTessellationSmoothingMode, input);
    [self setSmoothingMode: input];
  }
}

#endif // #if SCN_ENABLE_METAL
