//
//  NNSIndexSet.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSIndexSet.h"

#define instancetype NSIndexSet
#define js_value_instancetype js_value_NSIndexSet

NNSIndexSet::NNSIndexSet() {}
NNSIndexSet::~NNSIndexSet() {}

JS_INIT_CLASS(NSIndexSet, NSObject);
  JS_ASSIGN_STATIC_METHOD(indexSet);
  JS_ASSIGN_STATIC_METHOD(indexSetWithIndex);
  JS_ASSIGN_STATIC_METHOD(indexSetWithIndexesInRange);
  JS_ASSIGN_PROTO_METHOD(initWithIndexesInRange);
  JS_ASSIGN_PROTO_METHOD(initWithIndexSet);
  JS_ASSIGN_PROTO_METHOD(initWithIndex);
  JS_ASSIGN_PROTO_METHOD(isEqualToIndexSet);
  JS_ASSIGN_PROTO_METHOD(indexGreaterThanIndex);
  JS_ASSIGN_PROTO_METHOD(indexLessThanIndex);
  JS_ASSIGN_PROTO_METHOD(indexGreaterThanOrEqualToIndex);
  JS_ASSIGN_PROTO_METHOD(indexLessThanOrEqualToIndex);
  JS_ASSIGN_PROTO_METHOD(getIndexesMaxCountInIndexRange);
  JS_ASSIGN_PROTO_METHOD(countOfIndexesInRange);
  JS_ASSIGN_PROTO_METHOD(containsIndex);
  JS_ASSIGN_PROTO_METHOD(containsIndexesInRange);
  JS_ASSIGN_PROTO_METHOD(containsIndexes);
  JS_ASSIGN_PROTO_METHOD(intersectsIndexesInRange);
  JS_ASSIGN_PROTO_METHOD(enumerateIndexesUsingBlock);
  JS_ASSIGN_PROTO_METHOD(enumerateIndexesWithOptionsUsingBlock);
  JS_ASSIGN_PROTO_METHOD(enumerateIndexesInRangeOptionsUsingBlock);
  JS_ASSIGN_PROTO_METHOD(indexPassingTest);
  JS_ASSIGN_PROTO_METHOD(indexWithOptionsPassingTest);
  JS_ASSIGN_PROTO_METHOD(indexInRangeOptionsPassingTest);
  JS_ASSIGN_PROTO_METHOD(indexesPassingTest);
  JS_ASSIGN_PROTO_METHOD(indexesWithOptionsPassingTest);
  JS_ASSIGN_PROTO_METHOD(indexesInRangeOptionsPassingTest);
  JS_ASSIGN_PROTO_METHOD(enumerateRangesUsingBlock);
  JS_ASSIGN_PROTO_METHOD(enumerateRangesWithOptionsUsingBlock);
  JS_ASSIGN_PROTO_METHOD(enumerateRangesInRangeOptionsUsingBlock);
  JS_ASSIGN_PROTO_PROP_READONLY(count);
  JS_ASSIGN_PROTO_PROP_READONLY(firstIndex);
  JS_ASSIGN_PROTO_PROP_READONLY(lastIndex);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSIndexSet, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(NSIndexSet, NSObject);

NAN_METHOD(NNSIndexSet::New) {
  JS_RECONSTRUCT(NSIndexSet);
  @autoreleasepool {
    NSIndexSet* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSIndexSet *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSIndexSet alloc] init];
    }
    if (self) {
      NNSIndexSet *wrapper = new NNSIndexSet();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSIndexSet::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSIndexSet::indexSet) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([NSIndexSet indexSet]));
  }
}

NAN_METHOD(NNSIndexSet::indexSetWithIndex) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, value);
    JS_SET_RETURN(js_value_instancetype([NSIndexSet indexSetWithIndex: value]));
  }
}

NAN_METHOD(NNSIndexSet::indexSetWithIndexesInRange) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, range);
    JS_SET_RETURN(js_value_instancetype([NSIndexSet indexSetWithIndexesInRange: range]));
  }
}

NAN_METHOD(NNSIndexSet::initWithIndexesInRange) {
  JS_UNWRAP_OR_ALLOC(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, range);
    JS_SET_RETURN(js_value_instancetype([self initWithIndexesInRange: range]));
  }
}

NAN_METHOD(NNSIndexSet::initWithIndexSet) {
  JS_UNWRAP_OR_ALLOC(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexSet, indexSet);
    JS_SET_RETURN(js_value_instancetype([self initWithIndexSet: indexSet]));
  }
}

NAN_METHOD(NNSIndexSet::initWithIndex) {
  JS_UNWRAP_OR_ALLOC(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, value);
    JS_SET_RETURN(js_value_instancetype([self initWithIndex: value]));
  }
}

NAN_METHOD(NNSIndexSet::isEqualToIndexSet) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexSet, indexSet);
    JS_SET_RETURN(js_value_BOOL([self isEqualToIndexSet: indexSet]));
  }
}

NAN_METHOD(NNSIndexSet::indexGreaterThanIndex) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, value);
    JS_SET_RETURN(js_value_NSUInteger([self indexGreaterThanIndex: value]));
  }
}

NAN_METHOD(NNSIndexSet::indexLessThanIndex) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, value);
    JS_SET_RETURN(js_value_NSUInteger([self indexLessThanIndex: value]));
  }
}

NAN_METHOD(NNSIndexSet::indexGreaterThanOrEqualToIndex) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, value);
    JS_SET_RETURN(js_value_NSUInteger([self indexGreaterThanOrEqualToIndex: value]));
  }
}

NAN_METHOD(NNSIndexSet::indexLessThanOrEqualToIndex) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, value);
    JS_SET_RETURN(js_value_NSUInteger([self indexLessThanOrEqualToIndex: value]));
  }
}

NAN_METHOD(NNSIndexSet::getIndexesMaxCountInIndexRange) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(NSUInteger, indexBuffer);
    declare_value(NSUInteger, bufferSize);
    declare_nullable_value(NSRangePointer, range);
    JS_SET_RETURN(js_value_NSUInteger([self getIndexes: indexBuffer maxCount: bufferSize inIndexRange: range]));
    #endif
  }
}

NAN_METHOD(NNSIndexSet::countOfIndexesInRange) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, range);
    JS_SET_RETURN(js_value_NSUInteger([self countOfIndexesInRange: range]));
  }
}

NAN_METHOD(NNSIndexSet::containsIndex) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, value);
    JS_SET_RETURN(js_value_BOOL([self containsIndex: value]));
  }
}

NAN_METHOD(NNSIndexSet::containsIndexesInRange) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, range);
    JS_SET_RETURN(js_value_BOOL([self containsIndexesInRange: range]));
  }
}

NAN_METHOD(NNSIndexSet::containsIndexes) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexSet, indexSet);
    JS_SET_RETURN(js_value_BOOL([self containsIndexes: indexSet]));
  }
}

NAN_METHOD(NNSIndexSet::intersectsIndexesInRange) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, range);
    JS_SET_RETURN(js_value_BOOL([self intersectsIndexesInRange: range]));
  }
}

NAN_METHOD(NNSIndexSet::enumerateIndexesUsingBlock) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(block);
    [self enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
      dispatch_main(^{
        if (block) {
          Local<Value> stopCallback(sweetiekit::FromBlock("NNSIndexSet::enumerateIndexesUsingBlock::stop", ^(JSInfo info) {
            *stop = YES;
          }));
          [block jsFunction]->Call("NNSIndexSet::enumerateIndexesUsingBlock",
            js_value_NSUInteger(idx),
            stopCallback);
        }
      });
    }];
  }
}

#include "NNSObjCRuntime.h"

NAN_METHOD(NNSIndexSet::enumerateIndexesWithOptionsUsingBlock) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSEnumerationOptions, opts);
    declare_callback(block);
    [self enumerateIndexesWithOptions: opts usingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
      dispatch_main(^{
        if (block) {
          Local<Value> stopCallback(sweetiekit::FromBlock("NNSIndexSet::enumerateIndexesWithOptionsUsingBlock::stop", ^(JSInfo info) {
            *stop = YES;
          }));
          [block jsFunction]->Call("NNSIndexSet::enumerateIndexesWithOptionsUsingBlock",
            js_value_NSUInteger(idx),
            stopCallback);
        }
      });
    }];
  }
}

NAN_METHOD(NNSIndexSet::enumerateIndexesInRangeOptionsUsingBlock) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, range);
    declare_value(NSEnumerationOptions, opts);
    declare_callback(block);
    [self enumerateIndexesInRange: range options: opts usingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
      dispatch_main(^{
        if (block) {
          Local<Value> stopCallback(sweetiekit::FromBlock("NNSIndexSet::enumerateIndexesInRangeOptionsUsingBlock::stop", ^(JSInfo info) {
            *stop = YES;
          }));
          [block jsFunction]->Call("NNSIndexSet::enumerateIndexesInRangeOptionsUsingBlock",
            js_value_NSUInteger(idx),
            stopCallback);
        }
      });
    }];
  }
}

NAN_METHOD(NNSIndexSet::indexPassingTest) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(predicate);
    JS_SET_RETURN(js_value_NSUInteger([self indexPassingTest:^BOOL(NSUInteger idx, BOOL * _Nonnull stop) {
      __block BOOL result = YES;
      dispatch_main(^{
        if (predicate) {
          Local<Value> stopCallback(sweetiekit::FromBlock("NNSIndexSet::indexPassingTest::stop", ^(JSInfo info) {
            *stop = YES;
          }));
          auto JS_RESULT([predicate jsFunction]->Call("NNSIndexSet::indexPassingTest",
            js_value_NSUInteger(idx),
            stopCallback));
          if (!is_value_BOOL(JS_RESULT)) {
            js_panic_noreturn("Expected BOOL result");
            *stop = YES;
            result = NO;
          } else {
            result = to_value_BOOL(JS_RESULT);
          }
        }
      });
      return result;
    }]));
  }
}

NAN_METHOD(NNSIndexSet::indexWithOptionsPassingTest) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSEnumerationOptions, opts);
    declare_callback(predicate);
    JS_SET_RETURN(js_value_NSUInteger([self indexWithOptions: opts passingTest:^BOOL(NSUInteger idx, BOOL * _Nonnull stop) {
      __block BOOL result = YES;
      dispatch_main(^{
        if (predicate) {
          Local<Value> stopCallback(sweetiekit::FromBlock("NNSIndexSet::indexWithOptionsPassingTest::stop", ^(JSInfo info) {
            *stop = YES;
          }));
          auto JS_RESULT([predicate jsFunction]->Call("NNSIndexSet::indexWithOptionsPassingTest",
            js_value_NSUInteger(idx),
            stopCallback));
          if (!is_value_BOOL(JS_RESULT)) {
            js_panic_noreturn("Expected BOOL result");
            *stop = YES;
            result = NO;
          } else {
            result = to_value_BOOL(JS_RESULT);
          }
        }
      });
      return result;
    }]));
  }
}

NAN_METHOD(NNSIndexSet::indexInRangeOptionsPassingTest) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, range);
    declare_value(NSEnumerationOptions, opts);
    declare_callback(predicate);
    JS_SET_RETURN(js_value_NSUInteger([self indexInRange: range options: opts passingTest:^BOOL(NSUInteger idx, BOOL * _Nonnull stop) {
      __block BOOL result = YES;
      dispatch_main(^{
        if (predicate) {
          Local<Value> stopCallback(sweetiekit::FromBlock("NNSIndexSet::indexInRangeOptionsPassingTest::stop", ^(JSInfo info) {
            *stop = YES;
          }));
          auto JS_RESULT([predicate jsFunction]->Call("NNSIndexSet::indexInRangeOptionsPassingTest",
            js_value_NSUInteger(idx),
            stopCallback));
          if (!is_value_BOOL(JS_RESULT)) {
            js_panic_noreturn("Expected BOOL result");
            *stop = YES;
            result = NO;
          } else {
            result = to_value_BOOL(JS_RESULT);
          }
        }
      });
      return result;
    }]));
  }
}

NAN_METHOD(NNSIndexSet::indexesPassingTest) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(predicate);
    JS_SET_RETURN(js_value_NSIndexSet([self indexesPassingTest:^BOOL(NSUInteger idx, BOOL * _Nonnull stop) {
      __block BOOL result = YES;
      dispatch_main(^{
        if (predicate) {
          Local<Value> stopCallback(sweetiekit::FromBlock("NNSIndexSet::indexesPassingTest::stop", ^(JSInfo info) {
            *stop = YES;
          }));
          auto JS_RESULT([predicate jsFunction]->Call("NNSIndexSet::indexesPassingTest",
            js_value_NSUInteger(idx),
            stopCallback));
          if (!is_value_BOOL(JS_RESULT)) {
            js_panic_noreturn("Expected BOOL result");
            *stop = YES;
            result = NO;
          } else {
            result = to_value_BOOL(JS_RESULT);
          }
        }
      });
      return result;
    }]));
  }
}

NAN_METHOD(NNSIndexSet::indexesWithOptionsPassingTest) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSEnumerationOptions, opts);
    declare_callback(predicate);
    JS_SET_RETURN(js_value_NSIndexSet([self indexesWithOptions: opts passingTest:^BOOL(NSUInteger idx, BOOL * _Nonnull stop) {
      __block BOOL result = YES;
      dispatch_main(^{
        if (predicate) {
          Local<Value> stopCallback(sweetiekit::FromBlock("NNSIndexSet::indexesWithOptionsPassingTest::stop", ^(JSInfo info) {
            *stop = YES;
          }));
          auto JS_RESULT([predicate jsFunction]->Call("NNSIndexSet::indexesWithOptionsPassingTest",
            js_value_NSUInteger(idx),
            stopCallback));
          if (!is_value_BOOL(JS_RESULT)) {
            js_panic_noreturn("Expected BOOL result");
            *stop = YES;
            result = NO;
          } else {
            result = to_value_BOOL(JS_RESULT);
          }
        }
      });
      return result;
    }]));
  }
}

NAN_METHOD(NNSIndexSet::indexesInRangeOptionsPassingTest) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, range);
    declare_value(NSEnumerationOptions, opts);
    declare_callback(predicate);
    JS_SET_RETURN(js_value_NSIndexSet([self indexesInRange: range options: opts passingTest:^BOOL(NSUInteger idx, BOOL * _Nonnull stop) {
      __block BOOL result = YES;
      dispatch_main(^{
        if (predicate) {
          Local<Value> stopCallback(sweetiekit::FromBlock("NNSIndexSet::indexesInRangeOptionsPassingTest::stop", ^(JSInfo info) {
            *stop = YES;
          }));
          auto JS_RESULT([predicate jsFunction]->Call("NNSIndexSet::indexesInRangeOptionsPassingTest",
            js_value_NSUInteger(idx),
            stopCallback));
          if (!is_value_BOOL(JS_RESULT)) {
            js_panic_noreturn("Expected BOOL result");
            *stop = YES;
            result = NO;
          } else {
            result = to_value_BOOL(JS_RESULT);
          }
        }
      });
      return result;
    }]));
  }
}

NAN_METHOD(NNSIndexSet::enumerateRangesUsingBlock) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(block);
    [self enumerateRangesUsingBlock:^(NSRange range, BOOL * _Nonnull stop) {
      dispatch_main(^{
        if (block) {
          Local<Value> stopCallback(sweetiekit::FromBlock("NNSIndexSet::enumerateRangesUsingBlock::stop", ^(JSInfo info) {
            *stop = YES;
          }));
          [block jsFunction]->Call("NNSIndexSet::enumerateRangesUsingBlock",
            js_value_NSRange(range),
            stopCallback);
        }
      });
    }];
  }
}

NAN_METHOD(NNSIndexSet::enumerateRangesWithOptionsUsingBlock) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSEnumerationOptions, opts);
    declare_callback(block);
    [self enumerateRangesWithOptions: opts usingBlock:^(NSRange range, BOOL * _Nonnull stop) {
      dispatch_main(^{
        if (block) {
          Local<Value> stopCallback(sweetiekit::FromBlock("NNSIndexSet::enumerateRangesWithOptionsUsingBlock::stop", ^(JSInfo info) {
            *stop = YES;
          }));
          [block jsFunction]->Call("NNSIndexSet::enumerateRangesWithOptionsUsingBlock",
            js_value_NSRange(range),
            stopCallback);
        }
      });
    }];
  }
}

NAN_METHOD(NNSIndexSet::enumerateRangesInRangeOptionsUsingBlock) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, range);
    declare_value(NSEnumerationOptions, opts);
    declare_callback(block);
    [self enumerateRangesInRange: range options: opts usingBlock:^(NSRange range, BOOL * _Nonnull stop) {
      dispatch_main(^{
        if (block) {
          Local<Value> stopCallback(sweetiekit::FromBlock("NNSIndexSet::enumerateRangesInRangeOptionsUsingBlock::stop", ^(JSInfo info) {
            *stop = YES;
          }));
          [block jsFunction]->Call("NNSIndexSet::enumerateRangesInRangeOptionsUsingBlock",
            js_value_NSRange(range),
            stopCallback);
        }
      });
    }];
  }
}

NAN_GETTER(NNSIndexSet::countGetter) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self count]));
  }
}

NAN_GETTER(NNSIndexSet::firstIndexGetter) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self firstIndex]));
  }
}

NAN_GETTER(NNSIndexSet::lastIndexGetter) {
  JS_UNWRAP(NSIndexSet, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self lastIndex]));
  }
}
