//
//  NSCNPhysicsBehavior.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNPhysicsBehavior_h
#define NSCNPhysicsBehavior_h    

#include "NNSObject.h"

#define js_value_SCNPhysicsBehavior(x) js_value_wrapper(x, SCNPhysicsBehavior)
#define to_value_SCNPhysicsBehavior(x) to_value_wrapper(x, SCNPhysicsBehavior)
#define is_value_SCNPhysicsBehavior(x) is_value_wrapper(x, SCNPhysicsBehavior)

JS_WRAP_CLASS(SCNPhysicsBehavior, NSObject);
  // TODO: declare SCNPhysicsBehavior methods and properties
JS_WRAP_CLASS_END(SCNPhysicsBehavior);

#endif /* NSCNPhysicsBehavior_h */