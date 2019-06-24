//
//  SKPhysicsWorld.mm
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKPhysicsWorld.h"

NSKPhysicsWorld::NSKPhysicsWorld() {}
NSKPhysicsWorld::~NSKPhysicsWorld() {}

JS_INIT_CLASS(SKPhysicsWorld, NSObject);
  JS_ASSIGN_PROTO_METHOD(addJoint);
  JS_ASSIGN_PROTO_METHOD(removeJoint);
  JS_ASSIGN_PROTO_METHOD(removeAllJoints);
  JS_ASSIGN_PROTO_METHOD(sampleFieldsAt);
  JS_ASSIGN_PROTO_METHOD(bodyAtPoint);
  JS_ASSIGN_PROTO_METHOD(bodyInRect);
  JS_ASSIGN_PROTO_METHOD(bodyAlongRayStartEnd);
  JS_ASSIGN_PROTO_METHOD(enumerateBodiesAtPointUsingBlock);
  JS_ASSIGN_PROTO_METHOD(enumerateBodiesInRectUsingBlock);
  JS_ASSIGN_PROTO_METHOD(enumerateBodiesAlongRayStartEndUsingBlock);
  JS_ASSIGN_PROTO_PROP(gravity);
  JS_ASSIGN_PROTO_PROP(speed);
  JS_ASSIGN_PROTO_PROP(contactDelegate);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKPhysicsWorld, NSObject);
JS_INIT_CLASS_END(SKPhysicsWorld, NSObject);

NAN_METHOD(NSKPhysicsWorld::New) {
  JS_RECONSTRUCT(SKPhysicsWorld);
  @autoreleasepool {
    SKPhysicsWorld* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SKPhysicsWorld *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SKPhysicsWorld alloc] init];
    }
    if (self) {
      NSKPhysicsWorld *wrapper = new NSKPhysicsWorld();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SKPhysicsWorld::New: invalid arguments");
    }
  }
}

#include "NSKPhysicsJoint.h"

NAN_METHOD(NSKPhysicsWorld::addJoint) {
  JS_UNWRAP(SKPhysicsWorld, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKPhysicsJoint, joint);
    [self addJoint: joint];
  }
}

NAN_METHOD(NSKPhysicsWorld::removeJoint) {
  JS_UNWRAP(SKPhysicsWorld, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKPhysicsJoint, joint);
    [self removeJoint: joint];
  }
}

NAN_METHOD(NSKPhysicsWorld::removeAllJoints) {
  JS_UNWRAP(SKPhysicsWorld, self);
  declare_autoreleasepool {
    [self removeAllJoints];
  }
}

NAN_METHOD(NSKPhysicsWorld::sampleFieldsAt) {
  JS_UNWRAP(SKPhysicsWorld, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, position);
    JS_SET_RETURN(js_value_vector_float3([self sampleFieldsAt: position]));
  }
}

#include "NSKPhysicsBody.h"

NAN_METHOD(NSKPhysicsWorld::bodyAtPoint) {
  JS_UNWRAP(SKPhysicsWorld, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    JS_SET_RETURN(js_value_SKPhysicsBody([self bodyAtPoint: point]));
  }
}

NAN_METHOD(NSKPhysicsWorld::bodyInRect) {
  JS_UNWRAP(SKPhysicsWorld, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    JS_SET_RETURN(js_value_SKPhysicsBody([self bodyInRect: rect]));
  }
}

NAN_METHOD(NSKPhysicsWorld::bodyAlongRayStartEnd) {
  JS_UNWRAP(SKPhysicsWorld, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, start);
    declare_value(CGPoint, end);
    JS_SET_RETURN(js_value_SKPhysicsBody([self bodyAlongRayStart: start end: end]));
  }
}

// TODO: Add `stop` parameters to each of these enumerate* methods.

NAN_METHOD(NSKPhysicsWorld::enumerateBodiesAtPointUsingBlock) {
  JS_UNWRAP(SKPhysicsWorld, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_callback(block);
    [self enumerateBodiesAtPoint: point usingBlock:^(SKPhysicsBody * _Nonnull body, BOOL * _Nonnull stop) {
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NSKPhysicsWorld::enumerateBodiesAtPointUsingBlock",
            js_value_SKPhysicsBody(body));
        }
      });
    }];
    clear_callback(block);
  }
}

NAN_METHOD(NSKPhysicsWorld::enumerateBodiesInRectUsingBlock) {
  JS_UNWRAP(SKPhysicsWorld, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    declare_callback(block);
    [self enumerateBodiesInRect: rect usingBlock:^(SKPhysicsBody * _Nonnull body, BOOL * _Nonnull stop) {
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NSKPhysicsWorld::enumerateBodiesInRectUsingBlock",
            js_value_SKPhysicsBody(body));
        }
      });
    }];
    clear_callback(block);
  }
}

NAN_METHOD(NSKPhysicsWorld::enumerateBodiesAlongRayStartEndUsingBlock) {
  JS_UNWRAP(SKPhysicsWorld, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, start);
    declare_value(CGPoint, end);
    declare_callback(block);
    [self enumerateBodiesAlongRayStart: start end: end usingBlock:^(SKPhysicsBody * _Nonnull body, CGPoint point, CGVector normal, BOOL * _Nonnull stop) {
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NSKPhysicsWorld::enumerateBodiesAlongRayStartEndUsingBlock",
            js_value_SKPhysicsBody(body));
        }
      });
    }];
    clear_callback(block);
  }
}

NAN_GETTER(NSKPhysicsWorld::gravityGetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGVector([self gravity]));
  }
}

NAN_SETTER(NSKPhysicsWorld::gravitySetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGVector, input);
    [self setGravity: input];
  }
}

NAN_GETTER(NSKPhysicsWorld::speedGetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self speed]));
  }
}

NAN_SETTER(NSKPhysicsWorld::speedSetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSpeed: input];
  }
}

NAN_GETTER(NSKPhysicsWorld::contactDelegateGetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <SKPhysicsContactDelegate>*/([self contactDelegate]));
  }
}

NAN_SETTER(NSKPhysicsWorld::contactDelegateSetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <SKPhysicsContactDelegate>*/, input);
    [self setContactDelegate: input];
    [self associateValue:input withKey:@"NSKPhysicsWorld::contactDelegate"];
  }
}
