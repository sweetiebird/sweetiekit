//
//  NSKNode.h
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

#define js_value_SKBlendMode(x) JS_ENUM(SKBlendMode, NSInteger, x)
#define to_value_SKBlendMode(x) TO_ENUM(SKBlendMode, NSInteger, x)
#define is_value_SKBlendMode(x) IS_ENUM(SKBlendMode, NSInteger, x)

#define js_value_SKNodeFocusBehavior(x) JS_ENUM(SKNodeFocusBehavior, NSInteger, x)
#define to_value_SKNodeFocusBehavior(x) TO_ENUM(SKNodeFocusBehavior, NSInteger, x)
#define is_value_SKNodeFocusBehavior(x) IS_ENUM(SKNodeFocusBehavior, NSInteger, x)

JS_WRAP_CLASS(SKNode, UIResponder);
// SKNode
  JS_STATIC_METHOD(node);
  JS_STATIC_METHOD(nodeWithFileNamed);
  JS_STATIC_METHOD(nodeWithFileNamedSecurelyWithClassesAndError);
  JS_METHOD(init);
  JS_METHOD(initWithCoder);
  JS_METHOD(calculateAccumulatedFrame);
  JS_METHOD(valueForAttributeNamed);
  JS_METHOD(setValueForAttributeNamed);
  JS_METHOD(setScale);
  JS_METHOD(addChild);
  JS_METHOD(insertChildAtIndex);
  JS_METHOD(removeChildrenInArray);
  JS_METHOD(removeAllChildren);
  JS_METHOD(removeFromParent);
  JS_METHOD(moveToParent);
  JS_METHOD(childNodeWithName);
  JS_METHOD(enumerateChildNodesWithNameUsingBlock);
  JS_METHOD(objectForKeyedSubscript);
  JS_METHOD(inParentHierarchy);
  JS_METHOD(runAction);
  JS_METHOD(runActionCompletion);
  JS_METHOD(runActionWithKey);
  JS_METHOD(hasActions);
  JS_METHOD(actionForKey);
  JS_METHOD(removeActionForKey);
  JS_METHOD(removeAllActions);
  JS_METHOD(containsPoint);
  JS_METHOD(nodeAtPoint);
  JS_METHOD(nodesAtPoint);
  JS_METHOD(convertPointFromNode);
  JS_METHOD(convertPointToNode);
  JS_METHOD(intersectsNode);
  JS_METHOD(isEqualToNode);
#if TODO
// UITouch
  JS_METHOD(locationInNode);
  JS_METHOD(previousLocationInNode);
// NSEvent
  JS_METHOD(locationInNode);
#endif
// SKNode
  JS_PROP_READONLY(frame);
  JS_PROP(position);
  JS_PROP(zPosition);
  JS_PROP(zRotation);
  JS_PROP(xScale);
  JS_PROP(yScale);
  JS_PROP(speed);
  JS_PROP(alpha);
  JS_PROP(isPaused);
  JS_PROP(isHidden);
  JS_PROP(isUserInteractionEnabled);
  JS_PROP(focusBehavior);
  JS_PROP_READONLY(parent);
  JS_PROP_READONLY(children);
  JS_PROP(name);
  JS_PROP_READONLY(scene);
  JS_PROP(physicsBody);
  JS_PROP(userData);
  JS_PROP(reachConstraints);
  JS_PROP(constraints);
  JS_PROP(attributeValues);
JS_WRAP_CLASS_END(SKNode);

#endif /* NSKNode_h */
