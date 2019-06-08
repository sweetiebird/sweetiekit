//
//  NMPMusicPlayerApplicationController.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMPMusicPlayerApplicationController_h
#define NMPMusicPlayerApplicationController_h    

#include "NMPMusicPlayerController.h"

#define js_value_MPMusicPlayerApplicationController(x) js_value_wrapper(x, MPMusicPlayerApplicationController)
#define to_value_MPMusicPlayerApplicationController(x) to_value_wrapper(x, MPMusicPlayerApplicationController)
#define is_value_MPMusicPlayerApplicationController(x) is_value_wrapper(x, MPMusicPlayerApplicationController)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MPMusicPlayerApplicationController, MPMusicPlayerController);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(MPMusicPlayerApplicationController);

#endif /* NMPMusicPlayerApplicationController_h */