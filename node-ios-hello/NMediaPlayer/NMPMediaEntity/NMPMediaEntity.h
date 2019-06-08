//
//  NMPMediaEntity.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMPMediaEntity_h
#define NMPMediaEntity_h    

#import <MediaPlayer/MediaPlayer.h>
#include "NNSObject.h"

#define js_value_MPMediaEntity(x) js_value_wrapper(x, MPMediaEntity)
#define to_value_MPMediaEntity(x) to_value_wrapper(x, MPMediaEntity)
#define is_value_MPMediaEntity(x) is_value_wrapper(x, MPMediaEntity)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MPMediaEntity, NSObject);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(MPMediaEntity);

#endif /* NMPMediaEntity_h */
