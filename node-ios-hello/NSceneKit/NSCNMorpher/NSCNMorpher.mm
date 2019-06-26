//
//  NSCNMorpher.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNMorpher.h"

#define instancetype SCNMorpher
#define js_value_instancetype js_value_SCNMorpher

NSCNMorpher::NSCNMorpher() {}
NSCNMorpher::~NSCNMorpher() {}

JS_INIT_CLASS(SCNMorpher, NSObject);
  JS_ASSIGN_PROTO_METHOD(setWeightForTargetAtIndex);
  JS_ASSIGN_PROTO_METHOD(weightForTargetAtIndex);
  JS_ASSIGN_PROTO_METHOD(setWeightForTargetNamed);
  JS_ASSIGN_PROTO_METHOD(weightForTargetNamed);
  JS_ASSIGN_PROTO_PROP(targets);
  JS_ASSIGN_PROTO_PROP(weights);
  JS_ASSIGN_PROTO_PROP(calculationMode);
  JS_ASSIGN_PROTO_PROP(unifiesNormals);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNMorpher, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, SCNMorpherCalculationMode) {
    JS_ASSIGN_ENUM(SCNMorpherCalculationModeNormalized, NSInteger); // = 0, 
    JS_ASSIGN_ENUM(SCNMorpherCalculationModeAdditive, NSInteger); //   = 1  
  //};

JS_INIT_CLASS_END(SCNMorpher, NSObject);

NAN_METHOD(NSCNMorpher::New) {
  JS_RECONSTRUCT(SCNMorpher);
  @autoreleasepool {
    SCNMorpher* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNMorpher *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNMorpher alloc] init];
    }
    if (self) {
      NSCNMorpher *wrapper = new NSCNMorpher();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNMorpher::New: invalid arguments");
    }
  }
}

NAN_METHOD(NSCNMorpher::setWeightForTargetAtIndex) {
  JS_UNWRAP(SCNMorpher, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, weight);
    declare_value(NSUInteger, targetIndex);
    [self setWeight: weight forTargetAtIndex: targetIndex];
  }
}

NAN_METHOD(NSCNMorpher::weightForTargetAtIndex) {
  JS_UNWRAP(SCNMorpher, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, targetIndex);
    JS_SET_RETURN(js_value_CGFloat([self weightForTargetAtIndex: targetIndex]));
  }
}

NAN_METHOD(NSCNMorpher::setWeightForTargetNamed) {
  JS_UNWRAP(SCNMorpher, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, weight);
    declare_pointer(NSString, targetName);
    [self setWeight: weight forTargetNamed: targetName];
  }
}

NAN_METHOD(NSCNMorpher::weightForTargetNamed) {
  JS_UNWRAP(SCNMorpher, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, targetName);
    JS_SET_RETURN(js_value_CGFloat([self weightForTargetNamed: targetName]));
  }
}

NAN_GETTER(NSCNMorpher::targetsGetter) {
  JS_UNWRAP(SCNMorpher, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SCNGeometry*>([self targets]));
  }
}

NAN_SETTER(NSCNMorpher::targetsSetter) {
  JS_UNWRAP(SCNMorpher, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<SCNGeometry*>, input);
    [self setTargets: input];
  }
}

NAN_GETTER(NSCNMorpher::weightsGetter) {
  JS_UNWRAP(SCNMorpher, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self weights]));
  }
}

NAN_SETTER(NSCNMorpher::weightsSetter) {
  JS_UNWRAP(SCNMorpher, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<NSNumber*>, input);
    [self setWeights: input];
  }
}

NAN_GETTER(NSCNMorpher::calculationModeGetter) {
  JS_UNWRAP(SCNMorpher, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNMorpherCalculationMode([self calculationMode]));
  }
}

NAN_SETTER(NSCNMorpher::calculationModeSetter) {
  JS_UNWRAP(SCNMorpher, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNMorpherCalculationMode, input);
    [self setCalculationMode: input];
  }
}

NAN_GETTER(NSCNMorpher::unifiesNormalsGetter) {
  JS_UNWRAP(SCNMorpher, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self unifiesNormals]));
  }
}

NAN_SETTER(NSCNMorpher::unifiesNormalsSetter) {
  JS_UNWRAP(SCNMorpher, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setUnifiesNormals: input];
  }
}

