//
//  NSKNode.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKNode_h
#define NSKNode_h

#include "NUIResponder.h"

#define js_value_SKNode(x) js_value_wrapper(x, SKNode)
#define to_value_SKNode(x) to_value_wrapper(x, SKNode)
#define is_value_SKNode(x) is_value_wrapper(x, SKNode)

#define js_value_SKNodeFocusBehavior(x) JS_ENUM(SKNodeFocusBehavior, NSInteger, x)
#define to_value_SKNodeFocusBehavior(x) TO_ENUM(SKNodeFocusBehavior, NSInteger, x)
#define is_value_SKNodeFocusBehavior(x) IS_ENUM(SKNodeFocusBehavior, NSInteger, x)

JS_WRAP_CLASS(SKNode, UIResponder);
  JS_METHOD(addChild);
  JS_METHOD(removeFromParent);
  JS_METHOD(runAction);
  JS_METHOD(childNodeWithName);
  JS_METHOD(containsPoint);
  JS_METHOD(convertPointFromNode);
  JS_METHOD(convertPointToNode);
  JS_METHOD(nodeAtPoint);
  JS_METHOD(nodesAtPoint);
  JS_PROP(frame);
  JS_PROP(width);
  JS_PROP(height);
  JS_PROP(position);
  JS_PROP(x);
  JS_PROP(y);
  JS_PROP(z);
  JS_PROP(zPosition);
  JS_PROP(zRotation);
  JS_PROP(xScale);
  JS_PROP(yScale);
  JS_PROP(speed);
  JS_PROP(alpha);
  JS_PROP(paused);
  JS_PROP(hidden);
  JS_PROP(userInteractionEnabled);
  JS_PROP(focusBehavior);
  JS_PROP(parent);
  JS_PROP(children);
  JS_PROP(name);
  JS_PROP(scene);
  JS_PROP(physicsBody);
  JS_PROP(userData);
  JS_PROP(reachConstraints);
  JS_PROP(constraints);
  JS_PROP(attributeValues);
JS_WRAP_CLASS_END(SKNode);

#endif /* NSKNode_h */
