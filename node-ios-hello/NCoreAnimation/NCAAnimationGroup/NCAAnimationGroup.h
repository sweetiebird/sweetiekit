//
//  NCAAnimationGroup.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCAAnimationGroup_h
#define NCAAnimationGroup_h    

#include "NCAAnimation.h"

#define js_value_CAAnimationGroup(x) js_value_wrapper(x, CAAnimationGroup)
#define to_value_CAAnimationGroup(x) to_value_wrapper(x, CAAnimationGroup)
#define is_value_CAAnimationGroup(x) is_value_wrapper(x, CAAnimationGroup)

JS_WRAP_CLASS(CAAnimationGroup, CAAnimation);
  JS_PROP(animations);
JS_WRAP_CLASS_END(CAAnimationGroup);

#endif /* NCAAnimationGroup_h */
