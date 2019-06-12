//
//  NSCNGeometryElement.mm
//
//  Created by Emily Kolar on 6/10/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNGeometry.h"

#define instancetype SCNGeometryElement
#define js_value_instancetype js_value_SCNGeometryElement

NSCNGeometryElement::NSCNGeometryElement () {}
NSCNGeometryElement::~NSCNGeometryElement () {}

JS_INIT_CLASS(SCNGeometryElement, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP_READONLY(data);
  JS_ASSIGN_PROTO_PROP_READONLY(primitiveType);
  JS_ASSIGN_PROTO_PROP_READONLY(primitiveCount);
  JS_ASSIGN_PROTO_PROP(primitiveRange);
  JS_ASSIGN_PROTO_PROP_READONLY(bytesPerIndex);
  JS_ASSIGN_PROTO_PROP(pointSize);
  JS_ASSIGN_PROTO_PROP(minimumPointScreenSpaceRadius);
  JS_ASSIGN_PROTO_PROP(maximumPointScreenSpaceRadius);
  // static members (ctor)
  JS_INIT_CTOR(SCNGeometryElement, NSObject);
  JS_ASSIGN_STATIC_METHOD(geometryElementWithDataPrimitiveTypePrimitiveCountBytesPerIndex);
  JS_ASSIGN_STATIC_METHOD(geometryElementWithMDLSubmesh);
JS_INIT_CLASS_END(SCNGeometryElement, NSObject);

NAN_METHOD(NSCNGeometryElement::New) {
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `SCNGeometryElement(...)`, turn into construct call.
      JS_SET_RETURN_NEW(SCNGeometryElement, info);
      return;
    }
    SCNGeometryElement* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge SCNGeometryElement *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNGeometryElement alloc] init];
    }
    if (self) {
      NSCNGeometryElement *wrapper = new NSCNGeometryElement();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNGeometryElement::New: invalid arguments");
    }
  }
}

NAN_METHOD(NSCNGeometryElement::geometryElementWithDataPrimitiveTypePrimitiveCountBytesPerIndex) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSData, data);
    declare_value(SCNGeometryPrimitiveType, primitiveType);
    declare_value(NSInteger, primitiveCount);
    declare_value(NSInteger, bytesPerIndex);
    JS_SET_RETURN(js_value_instancetype([SCNGeometryElement geometryElementWithData: data primitiveType: primitiveType primitiveCount: primitiveCount bytesPerIndex: bytesPerIndex]));
  }
}

NAN_GETTER(NSCNGeometryElement::dataGetter) {
  JS_UNWRAP(SCNGeometryElement, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self data]));
  }
}

NAN_GETTER(NSCNGeometryElement::primitiveTypeGetter) {
  JS_UNWRAP(SCNGeometryElement, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNGeometryPrimitiveType([self primitiveType]));
  }
}

NAN_GETTER(NSCNGeometryElement::primitiveCountGetter) {
  JS_UNWRAP(SCNGeometryElement, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self primitiveCount]));
  }
}

NAN_GETTER(NSCNGeometryElement::primitiveRangeGetter) {
  JS_UNWRAP(SCNGeometryElement, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSRange([self primitiveRange]));
  }
}

NAN_SETTER(NSCNGeometryElement::primitiveRangeSetter) {
  JS_UNWRAP(SCNGeometryElement, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSRange, input);
    [self setPrimitiveRange: input];
  }
}

NAN_GETTER(NSCNGeometryElement::bytesPerIndexGetter) {
  JS_UNWRAP(SCNGeometryElement, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self bytesPerIndex]));
  }
}

NAN_GETTER(NSCNGeometryElement::pointSizeGetter) {
  JS_UNWRAP(SCNGeometryElement, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self pointSize]));
  }
}

NAN_SETTER(NSCNGeometryElement::pointSizeSetter) {
  JS_UNWRAP(SCNGeometryElement, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setPointSize: input];
  }
}

NAN_GETTER(NSCNGeometryElement::minimumPointScreenSpaceRadiusGetter) {
  JS_UNWRAP(SCNGeometryElement, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self minimumPointScreenSpaceRadius]));
  }
}

NAN_SETTER(NSCNGeometryElement::minimumPointScreenSpaceRadiusSetter) {
  JS_UNWRAP(SCNGeometryElement, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMinimumPointScreenSpaceRadius: input];
  }
}

NAN_GETTER(NSCNGeometryElement::maximumPointScreenSpaceRadiusGetter) {
  JS_UNWRAP(SCNGeometryElement, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self maximumPointScreenSpaceRadius]));
  }
}

NAN_SETTER(NSCNGeometryElement::maximumPointScreenSpaceRadiusSetter) {
  JS_UNWRAP(SCNGeometryElement, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMaximumPointScreenSpaceRadius: input];
  }
}

#include <SceneKit/ModelIO.h>
#include "NMDLSubmesh.h"

NAN_METHOD(NSCNGeometryElement::geometryElementWithMDLSubmesh) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLSubmesh, mdlSubMesh);
    JS_SET_RETURN(js_value_instancetype([SCNGeometryElement geometryElementWithMDLSubmesh: mdlSubMesh]));
  }
}
