//
//  NNSIndexSet.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSIndexSet_h
#define NNSIndexSet_h    

#include "NNSObject.h"

#define js_value_NSIndexSet(x) js_value_wrapper(x, NSIndexSet)
#define to_value_NSIndexSet(x) to_value_wrapper(x, NSIndexSet)
#define is_value_NSIndexSet(x) is_value_wrapper(x, NSIndexSet)

JS_WRAP_CLASS(NSIndexSet, NSObject);
  JS_STATIC_METHOD(indexSet);
  JS_STATIC_METHOD(indexSetWithIndex);
  JS_STATIC_METHOD(indexSetWithIndexesInRange);
  JS_METHOD(initWithIndexesInRange);
  JS_METHOD(initWithIndexSet);
  JS_METHOD(initWithIndex);
  JS_METHOD(isEqualToIndexSet);
  JS_METHOD(indexGreaterThanIndex);
  JS_METHOD(indexLessThanIndex);
  JS_METHOD(indexGreaterThanOrEqualToIndex);
  JS_METHOD(indexLessThanOrEqualToIndex);
  JS_METHOD(getIndexesMaxCountInIndexRange);
  JS_METHOD(countOfIndexesInRange);
  JS_METHOD(containsIndex);
  JS_METHOD(containsIndexesInRange);
  JS_METHOD(containsIndexes);
  JS_METHOD(intersectsIndexesInRange);
  JS_METHOD(enumerateIndexesUsingBlock);
  JS_METHOD(enumerateIndexesWithOptionsUsingBlock);
  JS_METHOD(enumerateIndexesInRangeOptionsUsingBlock);
  JS_METHOD(indexPassingTest);
  JS_METHOD(indexWithOptionsPassingTest);
  JS_METHOD(indexInRangeOptionsPassingTest);
  JS_METHOD(indexesPassingTest);
  JS_METHOD(indexesWithOptionsPassingTest);
  JS_METHOD(indexesInRangeOptionsPassingTest);
  JS_METHOD(enumerateRangesUsingBlock);
  JS_METHOD(enumerateRangesWithOptionsUsingBlock);
  JS_METHOD(enumerateRangesInRangeOptionsUsingBlock);
  JS_PROP_READONLY(count);
  JS_PROP_READONLY(firstIndex);
  JS_PROP_READONLY(lastIndex);
JS_WRAP_CLASS_END(NSIndexSet);

#endif /* NNSIndexSet_h */
