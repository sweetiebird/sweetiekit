//
//  NMPMusicPlayerQueueDescriptor.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMPMusicPlayerQueueDescriptor_h
#define NMPMusicPlayerQueueDescriptor_h    

#import <MediaPlayer/MediaPlayer.h>
#include "NNSObject.h"

#define js_value_MPMusicPlayerQueueDescriptor(x) js_value_wrapper(x, MPMusicPlayerQueueDescriptor)
#define to_value_MPMusicPlayerQueueDescriptor(x) to_value_wrapper(x, MPMusicPlayerQueueDescriptor)
#define is_value_MPMusicPlayerQueueDescriptor(x) is_value_wrapper(x, MPMusicPlayerQueueDescriptor)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MPMusicPlayerQueueDescriptor, NSObject);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(MPMusicPlayerQueueDescriptor);

#endif /* NMPMusicPlayerQueueDescriptor_h */
