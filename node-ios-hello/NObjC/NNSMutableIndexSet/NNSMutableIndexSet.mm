//
//  NNSMutableIndexSet.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSMutableIndexSet.h"

#define instancetype NSMutableIndexSet
#define js_value_instancetype js_value_NSMutableIndexSet

NNSMutableIndexSet::NNSMutableIndexSet() {}
NNSMutableIndexSet::~NNSMutableIndexSet() {}

JS_INIT_CLASS(NSMutableIndexSet, NSIndexSet);
  JS_ASSIGN_PROTO_METHOD(addIndexes);
  JS_ASSIGN_PROTO_METHOD(removeIndexes);
  JS_ASSIGN_PROTO_METHOD(removeAllIndexes);
  JS_ASSIGN_PROTO_METHOD(addIndex);
  JS_ASSIGN_PROTO_METHOD(removeIndex);
  JS_ASSIGN_PROTO_METHOD(addIndexesInRange);
  JS_ASSIGN_PROTO_METHOD(removeIndexesInRange);
  JS_ASSIGN_PROTO_METHOD(shiftIndexesStartingAtIndexBy);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSMutableIndexSet, NSIndexSet);
  // constant values (exports)
JS_INIT_CLASS_END(NSMutableIndexSet, NSIndexSet);

NAN_METHOD(NNSMutableIndexSet::New) {
  JS_RECONSTRUCT(NSMutableIndexSet);
  @autoreleasepool {
    NSMutableIndexSet* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSMutableIndexSet *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSMutableIndexSet alloc] init];
    }
    if (self) {
      NNSMutableIndexSet *wrapper = new NNSMutableIndexSet();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSMutableIndexSet::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSMutableIndexSet::addIndexes) {
  JS_UNWRAP(NSMutableIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexSet, indexSet);
    [self addIndexes: indexSet];
  }
}

NAN_METHOD(NNSMutableIndexSet::removeIndexes) {
  JS_UNWRAP(NSMutableIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexSet, indexSet);
    [self removeIndexes: indexSet];
  }
}

NAN_METHOD(NNSMutableIndexSet::removeAllIndexes) {
  JS_UNWRAP(NSMutableIndexSet, self);
  declare_autoreleasepool {
    [self removeAllIndexes];
  }
}

NAN_METHOD(NNSMutableIndexSet::addIndex) {
  JS_UNWRAP(NSMutableIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, value);
    [self addIndex: value];
  }
}

NAN_METHOD(NNSMutableIndexSet::removeIndex) {
  JS_UNWRAP(NSMutableIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, value);
    [self removeIndex: value];
  }
}

NAN_METHOD(NNSMutableIndexSet::addIndexesInRange) {
  JS_UNWRAP(NSMutableIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, range);
    [self addIndexesInRange: range];
  }
}

NAN_METHOD(NNSMutableIndexSet::removeIndexesInRange) {
  JS_UNWRAP(NSMutableIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, range);
    [self removeIndexesInRange: range];
  }
}

NAN_METHOD(NNSMutableIndexSet::shiftIndexesStartingAtIndexBy) {
  JS_UNWRAP(NSMutableIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, index);
    declare_value(NSInteger, delta);
    [self shiftIndexesStartingAtIndex: index by: delta];
  }
}
