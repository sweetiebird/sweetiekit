//
//  NSCNNode.h
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

// SceneKit enums
#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

#define js_value_SCNNodeFocusBehavior(x) JS_ENUM(SCNNodeFocusBehavior, NSInteger, x)
#define to_value_SCNNodeFocusBehavior(x) TO_ENUM(SCNNodeFocusBehavior, NSInteger, x)
#define is_value_SCNNodeFocusBehavior(x) IS_ENUM(SCNNodeFocusBehavior, NSInteger, x)

JS_WRAP_CLASS(SCNNode, NSObject);
  JS_STATIC_METHOD(node);
  JS_STATIC_METHOD(nodeWithGeometry);
  JS_METHOD(clone);
  JS_METHOD(flattenedClone);
  JS_METHOD(setWorldTransform);
  JS_METHOD(addChildNode);
  JS_METHOD(insertChildNodeAtIndex);
  JS_METHOD(removeFromParentNode);
  JS_METHOD(replaceChildNodeWith);
  JS_METHOD(childNodeWithNameRecursively);
  JS_METHOD(childNodesPassingTest);
  JS_METHOD(enumerateChildNodesUsingBlock);
  JS_METHOD(enumerateHierarchyUsingBlock);
  JS_METHOD(convertPositionToNode);
  JS_METHOD(convertPositionFromNode);
  JS_METHOD(convertVectorToNode);
  JS_METHOD(convertVectorFromNode);
  JS_METHOD(convertTransformToNode);
  JS_METHOD(convertTransformFromNode);
  JS_METHOD(hitTestWithSegmentFromPointToPointOptions);
  JS_METHOD(lookAt);
  JS_METHOD(lookAtUpLocalFront);
  JS_METHOD(localTranslateBy);
  JS_METHOD(localRotateBy);
  JS_METHOD(rotateByAroundTarget);
  JS_METHOD(simdConvertPositionToNode);
  JS_METHOD(simdConvertPositionFromNode);
  JS_METHOD(simdConvertVectorToNode);
  JS_METHOD(simdConvertVectorFromNode);
  JS_METHOD(simdConvertTransformToNode);
  JS_METHOD(simdConvertTransformFromNode);
  JS_METHOD(simdLookAt);
  JS_METHOD(simdLookAtUpLocalFront);
  JS_METHOD(simdLocalTranslateBy);
  JS_METHOD(simdLocalRotateBy);
  JS_METHOD(simdRotateByAroundTarget);
  JS_PROP(name);
  JS_PROP(light);
  JS_PROP(camera);
  JS_PROP(geometry);
  JS_PROP(skinner);
  JS_PROP(morpher);
  JS_PROP(transform);
  JS_PROP_READONLY(worldTransform);
  JS_PROP(position);
  JS_PROP(worldPosition);
  JS_PROP(rotation);
  JS_PROP(orientation);
  JS_PROP(worldOrientation);
  JS_PROP(eulerAngles);
  JS_PROP(scale);
  JS_PROP(pivot);
  JS_PROP(isHidden);
  JS_PROP(opacity);
  JS_PROP(renderingOrder);
  JS_PROP(castsShadow);
  JS_PROP(movabilityHint);
  JS_PROP_READONLY(parentNode);
  JS_PROP_READONLY(childNodes);
  JS_PROP(physicsBody);
  JS_PROP(physicsField);
  JS_PROP(constraints);
  JS_PROP(filters);
  JS_PROP_READONLY(presentationNode);
  JS_PROP(isPaused);
  JS_PROP(rendererDelegate);
  JS_PROP(categoryBitMask);
  JS_PROP(focusBehavior);
  JS_STATIC_PROP_READONLY(localUp);
  JS_STATIC_PROP_READONLY(localRight);
  JS_STATIC_PROP_READONLY(localFront);
  JS_PROP_READONLY(worldUp);
  JS_PROP_READONLY(worldRight);
  JS_PROP_READONLY(worldFront);
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
  JS_STATIC_PROP_READONLY(simdLocalUp);
  JS_STATIC_PROP_READONLY(simdLocalRight);
  JS_STATIC_PROP_READONLY(simdLocalFront);
  JS_PROP_READONLY(simdWorldUp);
  JS_PROP_READONLY(simdWorldRight);
  JS_PROP_READONLY(simdWorldFront);

  JS_STATIC_METHOD(nodeWithMDLObject);
JS_WRAP_CLASS_END(SCNNode);

#endif /* NSCNNode_h */
