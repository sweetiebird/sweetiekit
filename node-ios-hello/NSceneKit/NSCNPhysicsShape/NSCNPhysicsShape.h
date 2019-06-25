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

#define js_value_SCNPhysicsShapeOption(x) JS_ENUM(SCNPhysicsShapeOption, NSString, x)
#define to_value_SCNPhysicsShapeOption(x) TO_ENUM(SCNPhysicsShapeOption, NSString, x)
#define is_value_SCNPhysicsShapeOption(x) IS_ENUM(SCNPhysicsShapeOption, NSString, x)

#define js_value_SCNPhysicsShapeType(x) JS_ENUM(SCNPhysicsShapeType, NSString, x)
#define to_value_SCNPhysicsShapeType(x) TO_ENUM(SCNPhysicsShapeType, NSString, x)
#define is_value_SCNPhysicsShapeType(x) IS_ENUM(SCNPhysicsShapeType, NSString, x)

JS_WRAP_CLASS(SCNPhysicsShape, NSObject);
  JS_STATIC_METHOD(shapeWithGeometryOptions);
  JS_STATIC_METHOD(shapeWithNodeOptions);
  JS_STATIC_METHOD(shapeWithShapesTransforms);
  JS_PROP_READONLY(options);
  JS_PROP_READONLY(sourceObject);
  JS_PROP_READONLY(transforms);
JS_WRAP_CLASS_END(SCNPhysicsShape);

#endif /* NSCNPhysicsShape_h */
