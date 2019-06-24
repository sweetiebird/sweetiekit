//
//  NSCNPhysicsShape.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNPhysicsShape.h"

#define instancetype SCNPhysicsShape
#define js_value_instancetype js_value_SCNPhysicsShape

NSCNPhysicsShape::NSCNPhysicsShape() {}
NSCNPhysicsShape::~NSCNPhysicsShape() {}

JS_INIT_CLASS(SCNPhysicsShape, NSObject);
  JS_ASSIGN_STATIC_METHOD(shapeWithGeometryOptions);
  JS_ASSIGN_STATIC_METHOD(shapeWithNodeOptions);
  JS_ASSIGN_STATIC_METHOD(shapeWithShapesTransforms);
  JS_ASSIGN_PROTO_PROP_READONLY(options);
  JS_ASSIGN_PROTO_PROP_READONLY(sourceObject);
  JS_ASSIGN_PROTO_PROP_READONLY(transforms);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNPhysicsShape, NSObject);
  // constant values (exports)


  //typedef NSString * SCNPhysicsShapeOption NS_STRING_ENUM;
  JS_ASSIGN_ENUM(SCNPhysicsShapeTypeKey, SCNPhysicsShapeOption); //               API_AVAILABLE(macos(10.10));                        // Type of the physics shape. Default is SCNPhysicsShapeTypeConvexHull. See below for the list of shape types.
  JS_ASSIGN_ENUM(SCNPhysicsShapeKeepAsCompoundKey, SCNPhysicsShapeOption); //     API_AVAILABLE(macos(10.10));                        // A boolean to decide if a hierarchy is kept as a compound of shapes or flattened as one single volume. Default is true.
  JS_ASSIGN_ENUM(SCNPhysicsShapeScaleKey, SCNPhysicsShapeOption); //              API_AVAILABLE(macos(10.10));                        // Local scaling of the physics shape (as an SCNVector3 wrapped in a NSValue)
  JS_ASSIGN_ENUM(SCNPhysicsShapeOptionCollisionMargin, SCNPhysicsShapeOption); // API_AVAILABLE(macos(10.12), ios(10.0), tvos(10.0)); // Collision margin of the physics shape (as an NSNumber)

  // Values for SCNPhysicsShapeOptionType
  //typedef NSString * SCNPhysicsShapeType NS_STRING_ENUM;
  JS_ASSIGN_ENUM(SCNPhysicsShapeTypeBoundingBox, SCNPhysicsShapeType); // API_AVAILABLE(macos(10.10));
  JS_ASSIGN_ENUM(SCNPhysicsShapeTypeConvexHull, SCNPhysicsShapeType); // API_AVAILABLE(macos(10.10));
  JS_ASSIGN_ENUM(SCNPhysicsShapeTypeConcavePolyhedron, SCNPhysicsShapeType); // API_AVAILABLE(macos(10.10));

JS_INIT_CLASS_END(SCNPhysicsShape, NSObject);

NAN_METHOD(NSCNPhysicsShape::New) {
  JS_RECONSTRUCT(SCNPhysicsShape);
  @autoreleasepool {
    SCNPhysicsShape* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNPhysicsShape *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNPhysicsShape alloc] init];
    }
    if (self) {
      NSCNPhysicsShape *wrapper = new NSCNPhysicsShape();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNPhysicsShape::New: invalid arguments");
    }
  }
}

#include "NSCNGeometry.h"

NAN_METHOD(NSCNPhysicsShape::shapeWithGeometryOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNGeometry, geometry);
    declare_nullable_pointer(NSDictionary/* <SCNPhysicsShapeOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([SCNPhysicsShape shapeWithGeometry: geometry options: options]));
  }
}

#include "NSCNNode.h"

NAN_METHOD(NSCNPhysicsShape::shapeWithNodeOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNNode, node);
    declare_nullable_pointer(NSDictionary/* <SCNPhysicsShapeOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([SCNPhysicsShape shapeWithNode: node options: options]));
  }
}

NAN_METHOD(NSCNPhysicsShape::shapeWithShapesTransforms) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<SCNPhysicsShape*>, shapes);
    declare_nullable_pointer(NSArray<NSValue*>, transforms);
    JS_SET_RETURN(js_value_instancetype([SCNPhysicsShape shapeWithShapes: shapes transforms: transforms]));
  }
}

NAN_GETTER(NSCNPhysicsShape::optionsGetter) {
  JS_UNWRAP(SCNPhysicsShape, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <SCNPhysicsShapeOption, id>*/([self options]));
  }
}

NAN_GETTER(NSCNPhysicsShape::sourceObjectGetter) {
  JS_UNWRAP(SCNPhysicsShape, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self sourceObject]));
  }
}

NAN_GETTER(NSCNPhysicsShape::transformsGetter) {
  JS_UNWRAP(SCNPhysicsShape, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSValue*>([self transforms]));
  }
}

