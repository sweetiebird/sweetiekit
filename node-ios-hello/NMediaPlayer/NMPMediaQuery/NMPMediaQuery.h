//
//  NMPMediaQuery.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMPMediaQuery_h
#define NMPMediaQuery_h    

#import <MediaPlayer/MediaPlayer.h>
#include "NNSObject.h"

#define js_value_MPMediaQuery(x) js_value_wrapper(x, MPMediaQuery)
#define to_value_MPMediaQuery(x) to_value_wrapper(x, MPMediaQuery)
#define is_value_MPMediaQuery(x) is_value_wrapper(x, MPMediaQuery)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MPMediaQuery, NSObject);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(MPMediaQuery);

#endif /* NMPMediaQuery_h */
