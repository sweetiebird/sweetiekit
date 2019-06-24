//
//  NSCNPhysicsShape.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNPhysicsShape_h
#define NSCNPhysicsShape_h    

#include "NNSObject.h"

#define js_value_SCNPhysicsShape(x) js_value_wrapper(x, SCNPhysicsShape)
#define to_value_SCNPhysicsShape(x) to_value_wrapper(x, SCNPhysicsShape)
#define is_value_SCNPhysicsShape(x) is_value_wrapper(x, SCNPhysicsShape)

JS_WRAP_CLASS(SCNPhysicsShape, NSObject);
  // TODO: declare SCNPhysicsShape methods and properties
JS_WRAP_CLASS_END(SCNPhysicsShape);

#endif /* NSCNPhysicsShape_h */