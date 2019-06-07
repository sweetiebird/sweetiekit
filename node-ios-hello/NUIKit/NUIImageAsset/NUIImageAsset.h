//
//  NUIImageAsset.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIImageAsset_h
#define NUIImageAsset_h    

#include "NNSObject.h"

#define js_value_UIImageAsset(x) js_value_wrapper(x, UIImageAsset)
#define to_value_UIImageAsset(x) to_value_wrapper(x, UIImageAsset)
#define is_value_UIImageAsset(x) is_value_wrapper(x, UIImageAsset)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(UIImageAsset, NSObject);
  JS_STATIC_METHOD(init);
  JS_METHOD(initWithCoder);
  JS_METHOD(imageWithTraitCollection);
  JS_METHOD(registerImageWithTraitCollection);
  JS_METHOD(unregisterImageWithTraitCollection);
JS_WRAP_CLASS_END(UIImageAsset);

#endif /* NUIImageAsset_h */
