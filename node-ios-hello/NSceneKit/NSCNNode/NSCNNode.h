//
//  NSCNNode.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNNode_h
#define NSCNNode_h

#import "NNSObject.h"

#define js_value_SCNNode(x) js_value_wrapper(x, SCNNode)
#define to_value_SCNNode(x) to_value_wrapper(x, SCNNode)
#define is_value_SCNNode(x) is_value_wrapper(x, SCNNode)

// SpriteKit enums
#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

#define js_value_SCNNodeFocusBehavior(x) JS_ENUM(SCNNodeFocusBehavior, NSInteger, x)
#define to_value_SCNNodeFocusBehavior(x) TO_ENUM(SCNNodeFocusBehavior, NSInteger, x)
#define is_value_SCNNodeFocusBehavior(x) IS_ENUM(SCNNodeFocusBehavior, NSInteger, x)

JS_WRAP_CLASS(SCNNode, NSObject);
  JS_METHOD(addChildNode);
  JS_METHOD(clone);
  JS_PROP(SimdTransform);
  JS_PROP(SimdWorldTransform);
  JS_PROP(Light);
  JS_PROP(Position);
  JS_PROP(EulerAngles);
//  JS_PROP(scale);
//  JS_PROP(geometry);
  
  JS_PROP(name);
  JS_PROP(light);
  JS_PROP(camera);
  JS_PROP(geometry);
  JS_PROP(skinner);
  JS_PROP(morpher);
  JS_PROP(transform);
  JS_PROP(worldTransform);
  JS_PROP(position);
  JS_PROP(worldPosition);
  JS_PROP(rotation);
  JS_PROP(orientation);
  JS_PROP(worldOrientation);
  JS_PROP(eulerAngles);
  JS_PROP(scale);
  JS_PROP(pivot);
  JS_PROP(hidden);
  JS_PROP(opacity);
  JS_PROP(renderingOrder);
  JS_PROP(castsShadow);
  JS_PROP(movabilityHint);
  JS_PROP(parentNode);
  JS_PROP(childNodes);
  JS_PROP(physicsBody);
  JS_PROP(physicsField);
  JS_PROP(constraints);
  JS_PROP(filters);
  JS_PROP(presentationNode);
  JS_PROP(paused);
  JS_PROP(rendererDelegate);
  JS_PROP(categoryBitMask);
  JS_PROP(focusBehavior);
  JS_PROP(localUp);
  JS_PROP(localRight);
  JS_PROP(localFront);
  JS_PROP(worldUp);
  JS_PROP(worldRight);
  JS_PROP(worldFront);
  JS_PROP(simdTransform);
  JS_PROP(simdPosition);
  JS_PROP(simdRotation);
  JS_PROP(simdOrientation);
  JS_PROP(simdEulerAngles);
  JS_PROP(simdScale);
  JS_PROP(simdPivot);
  JS_PROP(simdWorldPosition);
  JS_PROP(simdWorldOrientation);
  JS_PROP(simdWorldTransform);
  JS_PROP(simdLocalUp);
  JS_PROP(simdLocalRight);
  JS_PROP(simdLocalFront);
  JS_PROP(simdWorldUp);
  JS_PROP(simdWorldRight);
  JS_PROP(simdWorldFront);
JS_WRAP_CLASS_END(SCNNode);

#endif /* NSCNNode_h */
