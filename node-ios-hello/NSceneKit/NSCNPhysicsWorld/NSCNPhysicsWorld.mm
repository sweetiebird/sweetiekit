//
//  NSCNPhysicsWorld.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNPhysicsWorld.h"

#define instancetype SCNPhysicsWorld
#define js_value_instancetype js_value_SCNPhysicsWorld

NSCNPhysicsWorld::NSCNPhysicsWorld() {}
NSCNPhysicsWorld::~NSCNPhysicsWorld() {}

JS_INIT_CLASS(SCNPhysicsWorld, NSObject);
  JS_ASSIGN_PROTO_METHOD(addBehavior);
  JS_ASSIGN_PROTO_METHOD(removeBehavior);
  JS_ASSIGN_PROTO_METHOD(removeAllBehaviors);
  JS_ASSIGN_PROTO_METHOD(rayTestWithSegmentFromPointToPointOptions);
  JS_ASSIGN_PROTO_METHOD(contactTestBetweenBodyAndBodyOptions);
  JS_ASSIGN_PROTO_METHOD(contactTestWithBodyOptions);
  JS_ASSIGN_PROTO_METHOD(convexSweepTestWithShapeFromTransformToTransformOptions);
  JS_ASSIGN_PROTO_METHOD(updateCollisionPairs);
  JS_ASSIGN_PROTO_PROP(gravity);
  JS_ASSIGN_PROTO_PROP(speed);
  JS_ASSIGN_PROTO_PROP(timeStep);
  JS_ASSIGN_PROTO_PROP(contactDelegate);
  JS_ASSIGN_PROTO_PROP_READONLY(allBehaviors);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNPhysicsWorld, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(SCNPhysicsWorld, NSObject);

NAN_METHOD(NSCNPhysicsWorld::New) {
  JS_RECONSTRUCT(SCNPhysicsWorld);
  @autoreleasepool {
    SCNPhysicsWorld* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNPhysicsWorld *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNPhysicsWorld alloc] init];
    }
    if (self) {
      NSCNPhysicsWorld *wrapper = new NSCNPhysicsWorld();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNPhysicsWorld::New: invalid arguments");
    }
  }
}

#include "NSCNPhysicsBehavior.h"

NAN_METHOD(NSCNPhysicsWorld::addBehavior) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNPhysicsBehavior, behavior);
    [self addBehavior: behavior];
  }
}

NAN_METHOD(NSCNPhysicsWorld::removeBehavior) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNPhysicsBehavior, behavior);
    [self removeBehavior: behavior];
  }
}

NAN_METHOD(NSCNPhysicsWorld::removeAllBehaviors) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    [self removeAllBehaviors];
  }
}

NAN_METHOD(NSCNPhysicsWorld::rayTestWithSegmentFromPointToPointOptions) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNVector3, origin);
    declare_value(SCNVector3, dest);
    declare_nullable_pointer(NSDictionary/* <SCNPhysicsTestOption, id>*/, options);
    JS_SET_RETURN(js_value_NSArray<SCNHitTestResult*>([self rayTestWithSegmentFromPoint: origin toPoint: dest options: options]));
  }
}

#include "NSCNPhysicsBody.h"

NAN_METHOD(NSCNPhysicsWorld::contactTestBetweenBodyAndBodyOptions) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNPhysicsBody, bodyA);
    declare_pointer(SCNPhysicsBody, bodyB);
    declare_nullable_pointer(NSDictionary/* <SCNPhysicsTestOption, id>*/, options);
    JS_SET_RETURN(js_value_NSArray<SCNPhysicsContact*>([self contactTestBetweenBody: bodyA andBody: bodyB options: options]));
  }
}

NAN_METHOD(NSCNPhysicsWorld::contactTestWithBodyOptions) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNPhysicsBody, body);
    declare_nullable_pointer(NSDictionary/* <SCNPhysicsTestOption, id>*/, options);
    JS_SET_RETURN(js_value_NSArray<SCNPhysicsContact*>([self contactTestWithBody: body options: options]));
  }
}

#include "NSCNPhysicsShape.h"

NAN_METHOD(NSCNPhysicsWorld::convexSweepTestWithShapeFromTransformToTransformOptions) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNPhysicsShape, shape);
    declare_value(SCNMatrix4, from);
    declare_value(SCNMatrix4, to);
    declare_nullable_pointer(NSDictionary/* <SCNPhysicsTestOption, id>*/, options);
    JS_SET_RETURN(js_value_NSArray<SCNPhysicsContact*>([self convexSweepTestWithShape: shape fromTransform: from toTransform: to options: options]));
  }
}

NAN_METHOD(NSCNPhysicsWorld::updateCollisionPairs) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    [self updateCollisionPairs];
  }
}

NAN_GETTER(NSCNPhysicsWorld::gravityGetter) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self gravity]));
  }
}

NAN_SETTER(NSCNPhysicsWorld::gravitySetter) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setGravity: input];
  }
}

NAN_GETTER(NSCNPhysicsWorld::speedGetter) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self speed]));
  }
}

NAN_SETTER(NSCNPhysicsWorld::speedSetter) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSpeed: input];
  }
}

NAN_GETTER(NSCNPhysicsWorld::timeStepGetter) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self timeStep]));
  }
}

NAN_SETTER(NSCNPhysicsWorld::timeStepSetter) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTimeInterval, input);
    [self setTimeStep: input];
  }
}

NAN_GETTER(NSCNPhysicsWorld::contactDelegateGetter) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <SCNPhysicsContactDelegate>*/([self contactDelegate]));
  }
}

NAN_SETTER(NSCNPhysicsWorld::contactDelegateSetter) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <SCNPhysicsContactDelegate>*/, input);
    [self setContactDelegate: input];
  }
}

NAN_GETTER(NSCNPhysicsWorld::allBehaviorsGetter) {
  JS_UNWRAP(SCNPhysicsWorld, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SCNPhysicsBehavior*>([self allBehaviors]));
  }
}
