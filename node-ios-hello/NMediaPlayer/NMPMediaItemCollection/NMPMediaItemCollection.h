//
//  NMPMediaItemCollection.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMPMediaItemCollection_h
#define NMPMediaItemCollection_h    

#include "NMPMediaEntity.h"

#define js_value_MPMediaItemCollection(x) js_value_wrapper(x, MPMediaItemCollection)
#define to_value_MPMediaItemCollection(x) to_value_wrapper(x, MPMediaItemCollection)
#define is_value_MPMediaItemCollection(x) is_value_wrapper(x, MPMediaItemCollection)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MPMediaItemCollection, MPMediaEntity);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(MPMediaItemCollection);

#endif /* NMPMediaItemCollection_h */
