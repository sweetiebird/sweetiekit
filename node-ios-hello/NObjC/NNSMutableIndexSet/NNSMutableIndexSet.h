//
//  NNSMutableIndexSet.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSMutableIndexSet_h
#define NNSMutableIndexSet_h    

#include "NNSIndexSet.h"

#define js_value_NSMutableIndexSet(x) js_value_wrapper(x, NSMutableIndexSet)
#define to_value_NSMutableIndexSet(x) to_value_wrapper(x, NSMutableIndexSet)
#define is_value_NSMutableIndexSet(x) is_value_wrapper(x, NSMutableIndexSet)

JS_WRAP_CLASS(NSMutableIndexSet, NSIndexSet);
  JS_METHOD(addIndexes);
  JS_METHOD(removeIndexes);
  JS_METHOD(removeAllIndexes);
  JS_METHOD(addIndex);
  JS_METHOD(removeIndex);
  JS_METHOD(addIndexesInRange);
  JS_METHOD(removeIndexesInRange);
  JS_METHOD(shiftIndexesStartingAtIndexBy);
JS_WRAP_CLASS_END(NSMutableIndexSet);

#endif /* NNSMutableIndexSet_h */
