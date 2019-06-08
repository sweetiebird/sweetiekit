//
//  NMPMediaItem.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMPMediaItem_h
#define NMPMediaItem_h    

#import <MediaPlayer/MediaPlayer.h>
#include "NMPMediaEntity.h"

#define js_value_MPMediaItem(x) js_value_wrapper(x, MPMediaItem)
#define to_value_MPMediaItem(x) to_value_wrapper(x, MPMediaItem)
#define is_value_MPMediaItem(x) is_value_wrapper(x, MPMediaItem)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MPMediaItem, MPMediaEntity);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(MPMediaItem);

#endif /* NMPMediaItem_h */
