//
//  NSCNPhysicsField.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNPhysicsField.h"

#define instancetype SCNPhysicsField
#define js_value_instancetype js_value_SCNPhysicsField

NSCNPhysicsField::NSCNPhysicsField() {}
NSCNPhysicsField::~NSCNPhysicsField() {}

JS_INIT_CLASS(SCNPhysicsField, NSObject);
  JS_ASSIGN_STATIC_METHOD(dragField);
  JS_ASSIGN_STATIC_METHOD(vortexField);
  JS_ASSIGN_STATIC_METHOD(radialGravityField);
  JS_ASSIGN_STATIC_METHOD(linearGravityField);
  JS_ASSIGN_STATIC_METHOD(noiseFieldWithSmoothnessAnimationSpeed);
  JS_ASSIGN_STATIC_METHOD(turbulenceFieldWithSmoothnessAnimationSpeed);
  JS_ASSIGN_STATIC_METHOD(springField);
  JS_ASSIGN_STATIC_METHOD(electricField);
  JS_ASSIGN_STATIC_METHOD(magneticField);
  JS_ASSIGN_STATIC_METHOD(customFieldWithEvaluationBlock);
  JS_ASSIGN_PROTO_PROP(strength);
  JS_ASSIGN_PROTO_PROP(falloffExponent);
  JS_ASSIGN_PROTO_PROP(minimumDistance);
  JS_ASSIGN_PROTO_PROP(isActive);
  JS_ASSIGN_PROTO_PROP(isExclusive);
  JS_ASSIGN_PROTO_PROP(halfExtent);
  JS_ASSIGN_PROTO_PROP(usesEllipsoidalExtent);
  JS_ASSIGN_PROTO_PROP(scope);
  JS_ASSIGN_PROTO_PROP(offset);
  JS_ASSIGN_PROTO_PROP(direction);
  JS_ASSIGN_PROTO_PROP(categoryBitMask);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNPhysicsField, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, SCNPhysicsFieldScope) {
    JS_ASSIGN_ENUM(SCNPhysicsFieldScopeInsideExtent, NSInteger);
    JS_ASSIGN_ENUM(SCNPhysicsFieldScopeOutsideExtent, NSInteger);
  //} API_AVAILABLE(macos(10.10));

JS_INIT_CLASS_END(SCNPhysicsField, NSObject);

NAN_METHOD(NSCNPhysicsField::New) {
  JS_RECONSTRUCT(SCNPhysicsField);
  @autoreleasepool {
    SCNPhysicsField* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNPhysicsField *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNPhysicsField alloc] init];
    }
    if (self) {
      NSCNPhysicsField *wrapper = new NSCNPhysicsField();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNPhysicsField::New: invalid arguments");
    }
  }
}

NAN_METHOD(NSCNPhysicsField::dragField) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsField([SCNPhysicsField dragField]));
  }
}

NAN_METHOD(NSCNPhysicsField::vortexField) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsField([SCNPhysicsField vortexField]));
  }
}

NAN_METHOD(NSCNPhysicsField::radialGravityField) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsField([SCNPhysicsField radialGravityField]));
  }
}

NAN_METHOD(NSCNPhysicsField::linearGravityField) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsField([SCNPhysicsField linearGravityField]));
  }
}

NAN_METHOD(NSCNPhysicsField::noiseFieldWithSmoothnessAnimationSpeed) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, smoothness);
    declare_value(CGFloat, speed);
    JS_SET_RETURN(js_value_SCNPhysicsField([SCNPhysicsField noiseFieldWithSmoothness: smoothness animationSpeed: speed]));
  }
}

NAN_METHOD(NSCNPhysicsField::turbulenceFieldWithSmoothnessAnimationSpeed) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, smoothness);
    declare_value(CGFloat, speed);
    JS_SET_RETURN(js_value_SCNPhysicsField([SCNPhysicsField turbulenceFieldWithSmoothness: smoothness animationSpeed: speed]));
  }
}

NAN_METHOD(NSCNPhysicsField::springField) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsField([SCNPhysicsField springField]));
  }
}

NAN_METHOD(NSCNPhysicsField::electricField) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsField([SCNPhysicsField electricField]));
  }
}

NAN_METHOD(NSCNPhysicsField::magneticField) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsField([SCNPhysicsField magneticField]));
  }
}

NAN_METHOD(NSCNPhysicsField::customFieldWithEvaluationBlock) {
  declare_autoreleasepool {
    declare_args();
    declare_callback(block);
    JS_SET_RETURN(js_value_SCNPhysicsField([SCNPhysicsField customFieldWithEvaluationBlock:^SCNVector3(SCNVector3 position, SCNVector3 velocity, float mass, float charge, NSTimeInterval time) {
      __block SCNVector3 result = SCNVector3Zero;
      dispatch_main(^{
        if (block) {
          Local<Value> JS_RESULT = [block jsFunction]->Call("NSCNPhysicsField::customFieldWithEvaluationBlock",
            js_value_SCNVector3(position),
            js_value_SCNVector3(velocity),
            js_value_float(mass),
            js_value_float(charge),
            js_value_NSTimeInterval(time));
          if (is_value_SCNVector3(JS_RESULT)) {
            result = to_value_SCNVector3(JS_RESULT);
          }
        }
      });
      return result;
    }]));
  }
}

NAN_GETTER(NSCNPhysicsField::strengthGetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self strength]));
  }
}

NAN_SETTER(NSCNPhysicsField::strengthSetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setStrength: input];
  }
}

NAN_GETTER(NSCNPhysicsField::falloffExponentGetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self falloffExponent]));
  }
}

NAN_SETTER(NSCNPhysicsField::falloffExponentSetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setFalloffExponent: input];
  }
}

NAN_GETTER(NSCNPhysicsField::minimumDistanceGetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self minimumDistance]));
  }
}

NAN_SETTER(NSCNPhysicsField::minimumDistanceSetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMinimumDistance: input];
  }
}

NAN_GETTER(NSCNPhysicsField::isActiveGetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isActive]));
  }
}

NAN_SETTER(NSCNPhysicsField::isActiveSetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setActive: input];
  }
}

NAN_GETTER(NSCNPhysicsField::isExclusiveGetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isExclusive]));
  }
}

NAN_SETTER(NSCNPhysicsField::isExclusiveSetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setExclusive: input];
  }
}

NAN_GETTER(NSCNPhysicsField::halfExtentGetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self halfExtent]));
  }
}

NAN_SETTER(NSCNPhysicsField::halfExtentSetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setHalfExtent: input];
  }
}

NAN_GETTER(NSCNPhysicsField::usesEllipsoidalExtentGetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self usesEllipsoidalExtent]));
  }
}

NAN_SETTER(NSCNPhysicsField::usesEllipsoidalExtentSetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setUsesEllipsoidalExtent: input];
  }
}

NAN_GETTER(NSCNPhysicsField::scopeGetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsFieldScope([self scope]));
  }
}

NAN_SETTER(NSCNPhysicsField::scopeSetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNPhysicsFieldScope, input);
    [self setScope: input];
  }
}

NAN_GETTER(NSCNPhysicsField::offsetGetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self offset]));
  }
}

NAN_SETTER(NSCNPhysicsField::offsetSetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setOffset: input];
  }
}

NAN_GETTER(NSCNPhysicsField::directionGetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self direction]));
  }
}

NAN_SETTER(NSCNPhysicsField::directionSetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setDirection: input];
  }
}

NAN_GETTER(NSCNPhysicsField::categoryBitMaskGetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self categoryBitMask]));
  }
}

NAN_SETTER(NSCNPhysicsField::categoryBitMaskSetter) {
  JS_UNWRAP(SCNPhysicsField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setCategoryBitMask: input];
  }
}
