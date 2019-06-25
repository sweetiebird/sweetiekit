//
//  NSceneKitTypes.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSceneKitTypes_h
#define NSceneKitTypes_h    

#include "NNSObject.h"

#define js_value_SceneKitTypes(x) js_value_wrapper(x, SceneKitTypes)
#define to_value_SceneKitTypes(x) to_value_wrapper(x, SceneKitTypes)
#define is_value_SceneKitTypes(x) is_value_wrapper(x, SceneKitTypes)

#define js_value_SCNActionTimingMode(x) JS_ENUM(SCNActionTimingMode, NSInteger, x)
#define to_value_SCNActionTimingMode(x) TO_ENUM(SCNActionTimingMode, NSInteger, x)
#define is_value_SCNActionTimingMode(x) IS_ENUM(SCNActionTimingMode, NSInteger, x)

#define js_value_SCNColorMask(x) JS_OPTS(SCNColorMask, NSInteger, x)
#define to_value_SCNColorMask(x) TO_OPTS(SCNColorMask, NSInteger, x)
#define is_value_SCNColorMask(x) IS_OPTS(SCNColorMask, NSInteger, x)

JS_WRAP_CLASS(SceneKitTypes, NSObject);
  // TODO: declare SceneKitTypes methods and properties
JS_WRAP_CLASS_END(SceneKitTypes);

#if __OBJC__
@interface SceneKitTypes : NSObject
@end
#endif

#endif /* NSceneKitTypes_h */
