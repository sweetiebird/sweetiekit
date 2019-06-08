//
//  NNSCache.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSCache_h
#define NNSCache_h    

#include "NNSObject.h"

#define js_value_NSCache(x) js_value_wrapper(x, NSCache)
#define to_value_NSCache(x) to_value_wrapper(x, NSCache)
#define is_value_NSCache(x) is_value_wrapper(x, NSCache)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(NSCache, NSObject);
// NSCache
  JS_METHOD(objectForKey);
  JS_METHOD(setObjectForKey);
  JS_METHOD(setObjectForKeyCost);
  JS_METHOD(removeObjectForKey);
  JS_METHOD(removeAllObjects);
#if TODO
// NSCacheDelegate
  JS_METHOD(cacheWillEvictObject);
#endif
// NSCache
  JS_PROP(name);
  JS_PROP(delegate);
  JS_PROP(totalCostLimit);
  JS_PROP(countLimit);
  JS_PROP(evictsObjectsWithDiscardedContent);
JS_WRAP_CLASS_END(NSCache);

#endif /* NNSCache_h */
