//
//  SKPhysicsBody.mm
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKPhysicsBody.h"

NSKPhysicsBody::NSKPhysicsBody() {}
NSKPhysicsBody::~NSKPhysicsBody() {}

JS_INIT_CLASS(SKPhysicsBody, NSObject);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, applyImpulse);
  JS_ASSIGN_METHOD(proto, applyAngularImpulse);
  JS_ASSIGN_METHOD(proto, applyImpulseAtPoint);
  JS_ASSIGN_METHOD(proto, applyForce);
  JS_ASSIGN_METHOD(proto, applyForceAtPoint);
  JS_ASSIGN_METHOD(proto, applyTorque);
  JS_ASSIGN_PROP(proto, dynamic);
  JS_ASSIGN_PROP(proto, usesPreciseCollisionDetection);
  JS_ASSIGN_PROP(proto, allowsRotation);
  JS_ASSIGN_PROP(proto, pinned);
  JS_ASSIGN_PROP(proto, resting);
  JS_ASSIGN_PROP(proto, friction);
  JS_ASSIGN_PROP(proto, charge);
  JS_ASSIGN_PROP(proto, restitution);
  JS_ASSIGN_PROP(proto, linearDamping);
  JS_ASSIGN_PROP(proto, angularDamping);
  JS_ASSIGN_PROP(proto, density);
  JS_ASSIGN_PROP(proto, mass);
  JS_ASSIGN_PROP_READONLY(proto, area);
  JS_ASSIGN_PROP(proto, affectedByGravity);
  JS_ASSIGN_PROP(proto, fieldBitMask);
  JS_ASSIGN_PROP(proto, categoryBitMask);
  JS_ASSIGN_PROP(proto, collisionBitMask);
  JS_ASSIGN_PROP(proto, contactTestBitMask);
  JS_ASSIGN_PROP_READONLY(proto, joints);
  JS_ASSIGN_PROP_READONLY(proto, node);
  JS_ASSIGN_PROP(proto, velocity);
  JS_ASSIGN_PROP(proto, angularVelocity);
  // static members (ctor)
  JS_INIT_CTOR(SKPhysicsBody, NSObject);
  JS_ASSIGN_METHOD(ctor, bodyWithCircleOfRadius);
  JS_ASSIGN_METHOD(ctor, bodyWithTexture);
  JS_ASSIGN_METHOD(ctor, bodyWithRectangleOfSize);
  JS_ASSIGN_METHOD(ctor, bodyWithEdgeLoopFromRect);
JS_INIT_CLASS_END(SKPhysicsBody, NSObject);

NAN_METHOD(NSKPhysicsBody::New) {
  JS_RECONSTRUCT(SKPhysicsBody);

  Local<Object> obj = info.This();

  NSKPhysicsBody *body = new NSKPhysicsBody();

  if (info[0]->IsExternal()) {
    body->SetNSObject((__bridge SKPhysicsBody *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      body->SetNSObject([[SKPhysicsBody alloc] init]);
    }
  }
  body->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NSKPhysicsBody::bodyWithCircleOfRadius) {
  if (info.Length() >= 2) {
    JS_SET_RETURN_EXTERNAL(SKPhysicsBody,
      [SKPhysicsBody bodyWithCircleOfRadius:to_value_CGFloat(info[0])
                     center:to_value_CGPoint(info[1])]);
  } else {
    JS_SET_RETURN_EXTERNAL(SKPhysicsBody,
      [SKPhysicsBody bodyWithCircleOfRadius:to_value_CGFloat(info[0])]);
  }
}

#include "NSKTexture.h"

NAN_METHOD(NSKPhysicsBody::bodyWithTexture) {
  if (info.Length() >= 3) {
    JS_SET_RETURN_EXTERNAL(SKPhysicsBody,
      [SKPhysicsBody bodyWithTexture:to_value_SKTexture(info[0])
                     alphaThreshold:to_value_float(info[1])
                     size:to_value_CGSize(info[2])]);
  } else {
    JS_SET_RETURN_EXTERNAL(SKPhysicsBody,
      [SKPhysicsBody bodyWithTexture:to_value_SKTexture(info[0])
                     size:to_value_CGSize(info[1])]);
  }
}

NAN_METHOD(NSKPhysicsBody::bodyWithRectangleOfSize) {
  if (info.Length() >= 2) {
    JS_SET_RETURN_EXTERNAL(SKPhysicsBody,
      [SKPhysicsBody bodyWithRectangleOfSize:to_value_CGSize(info[0])
                     center:to_value_CGPoint(info[1])]);
  } else {
    JS_SET_RETURN_EXTERNAL(SKPhysicsBody,
      [SKPhysicsBody bodyWithRectangleOfSize:to_value_CGSize(info[0])]);
  }
}

NAN_METHOD(NSKPhysicsBody::bodyWithEdgeLoopFromRect) {
  JS_SET_RETURN_EXTERNAL(SKPhysicsBody,
    [SKPhysicsBody bodyWithEdgeLoopFromRect:to_value_CGRect(info[0])]);
}

//NAN_GETTER(NSKPhysicsBody::nodeGetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SKPhysicsBody, body);
//
//  JS_SET_RETURN(sweetiekit::GetWrapperFor([body node], NSKNode::type));
//}
//
//NAN_SETTER(NSKPhysicsBody::nodeSetter) {
//  Nan::EscapableHandleScope scope;
//
//  Nan::ThrowError("NSKPhysicsBody::nodeSetter not yet implemented");
//}

//NAN_GETTER(NSKPhysicsBody::categoryBitMaskGetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SKPhysicsBody, body);
//
//  NSInteger mask = [body categoryBitMask];
//
//  JS_SET_RETURN(JS_NUM(mask));
//}
//
//NAN_SETTER(NSKPhysicsBody::categoryBitMaskSetter) {
//  Nan::EscapableHandleScope scope;
//
//  JS_UNWRAP(SKPhysicsBody, body);
//
//  uint32_t mask = TO_INT32(value);
//
//  [body setCategoryBitMask:mask];
//}
//
//NAN_GETTER(NSKPhysicsBody::contactTestBitMaskGetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SKPhysicsBody, body);
//
//  NSInteger mask = [body contactTestBitMask];
//
//  JS_SET_RETURN(JS_NUM(mask));
//}
//
//NAN_SETTER(NSKPhysicsBody::contactTestBitMaskSetter) {
//  Nan::EscapableHandleScope scope;
//
//  JS_UNWRAP(SKPhysicsBody, body);
//
//  uint32_t mask = TO_INT32(value);
//
//  [body setContactTestBitMask:mask];
//}
//
//NAN_GETTER(NSKPhysicsBody::collisionBitMaskGetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SKPhysicsBody, body);
//
//  NSInteger mask = [body collisionBitMask];
//
//  JS_SET_RETURN(JS_NUM(mask));
//}
//
//NAN_SETTER(NSKPhysicsBody::collisionBitMaskSetter) {
//  Nan::EscapableHandleScope scope;
//
//  JS_UNWRAP(SKPhysicsBody, body);
//
//  uint32_t mask = TO_INT32(value);
//
//  [body setCollisionBitMask:mask];
//}

NAN_METHOD(NSKPhysicsBody::applyImpulse) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self applyImpulse:to_value_CGVector(info[0])];
  }
}

NAN_METHOD(NSKPhysicsBody::applyAngularImpulse) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self applyAngularImpulse:TO_FLOAT(info[0])];
  }
}

NAN_METHOD(NSKPhysicsBody::applyImpulseAtPoint) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self applyImpulse:to_value_CGVector(info[0]) atPoint:to_value_CGPoint(info[1])];
  }
}

NAN_METHOD(NSKPhysicsBody::applyForce) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self applyForce:to_value_CGVector(info[0])];
  }
}

NAN_METHOD(NSKPhysicsBody::applyForceAtPoint) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self applyForce:to_value_CGVector(info[0]) atPoint:to_value_CGPoint(info[1])];
  }
}

NAN_METHOD(NSKPhysicsBody::applyTorque) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self applyTorque:TO_FLOAT(info[0])];
  }
}

NAN_GETTER(NSKPhysicsBody::dynamicGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isDynamic]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::dynamicSetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setDynamic: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::usesPreciseCollisionDetectionGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self usesPreciseCollisionDetection]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::usesPreciseCollisionDetectionSetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setUsesPreciseCollisionDetection: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::allowsRotationGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self allowsRotation]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::allowsRotationSetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setAllowsRotation: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::pinnedGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self pinned]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::pinnedSetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setPinned: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::restingGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isResting]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::restingSetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setResting: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::frictionGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self friction]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::frictionSetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setFriction: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::chargeGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self charge]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::chargeSetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setCharge: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::restitutionGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self restitution]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::restitutionSetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setRestitution: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::linearDampingGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self linearDamping]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::linearDampingSetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setLinearDamping: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::angularDampingGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self angularDamping]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::angularDampingSetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setAngularDamping: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::densityGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self density]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::densitySetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setDensity: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::massGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self mass]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::massSetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setMass: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::areaGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self area]));
    return;
  }
}

NAN_GETTER(NSKPhysicsBody::affectedByGravityGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self affectedByGravity]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::affectedByGravitySetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setAffectedByGravity: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::fieldBitMaskGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_UINT([self fieldBitMask]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::fieldBitMaskSetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setFieldBitMask: TO_UINT32(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::categoryBitMaskGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_UINT([self categoryBitMask]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::categoryBitMaskSetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setCategoryBitMask: TO_UINT32(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::collisionBitMaskGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_UINT([self collisionBitMask]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::collisionBitMaskSetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setCollisionBitMask: TO_UINT32(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::contactTestBitMaskGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_UINT([self contactTestBitMask]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::contactTestBitMaskSetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setContactTestBitMask: TO_UINT32(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::jointsGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray<SKPhysicsJoint*>([self joints]));
    return;
  }
}

#include "NSKNode.h"

NAN_GETTER(NSKPhysicsBody::nodeGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKNode([self node]));
    return;
  }
}

NAN_GETTER(NSKPhysicsBody::velocityGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGVector([self velocity]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::velocitySetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setVelocity: to_value_CGVector(value)];
  }
}

NAN_GETTER(NSKPhysicsBody::angularVelocityGetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self angularVelocity]));
    return;
  }
}

NAN_SETTER(NSKPhysicsBody::angularVelocitySetter) {
  JS_UNWRAP(SKPhysicsBody, self);
  @autoreleasepool
  {
    [self setAngularVelocity: TO_FLOAT(value)];
  }
}
