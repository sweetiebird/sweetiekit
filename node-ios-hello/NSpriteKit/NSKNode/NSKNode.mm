//
//  NSKNode.mm
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKNode.h"

#define instancetype SKNode
#define js_value_instancetype js_value_SKNode

NSKNode::NSKNode() {}
NSKNode::~NSKNode() {}

JS_INIT_CLASS(SKNode, UIResponder);
  JS_ASSIGN_STATIC_METHOD(node);
  JS_ASSIGN_STATIC_METHOD(nodeWithFileNamed);
  JS_ASSIGN_STATIC_METHOD(nodeWithFileNamedSecurelyWithClassesAndError);
  JS_ASSIGN_PROTO_METHOD(init);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(calculateAccumulatedFrame);
  JS_ASSIGN_PROTO_METHOD(valueForAttributeNamed);
  JS_ASSIGN_PROTO_METHOD(setValueForAttributeNamed);
  JS_ASSIGN_PROTO_METHOD(setScale);
  JS_ASSIGN_PROTO_METHOD(addChild);
  JS_ASSIGN_PROTO_METHOD(insertChildAtIndex);
  JS_ASSIGN_PROTO_METHOD(removeChildrenInArray);
  JS_ASSIGN_PROTO_METHOD(removeAllChildren);
  JS_ASSIGN_PROTO_METHOD(removeFromParent);
  JS_ASSIGN_PROTO_METHOD(moveToParent);
  JS_ASSIGN_PROTO_METHOD(childNodeWithName);
  JS_ASSIGN_PROTO_METHOD(enumerateChildNodesWithNameUsingBlock);
  JS_ASSIGN_PROTO_METHOD(objectForKeyedSubscript);
  JS_ASSIGN_PROTO_METHOD(inParentHierarchy);
  JS_ASSIGN_PROTO_METHOD(runAction);
  JS_ASSIGN_PROTO_METHOD(runActionCompletion);
  JS_ASSIGN_PROTO_METHOD(runActionWithKey);
  JS_ASSIGN_PROTO_METHOD(hasActions);
  JS_ASSIGN_PROTO_METHOD(actionForKey);
  JS_ASSIGN_PROTO_METHOD(removeActionForKey);
  JS_ASSIGN_PROTO_METHOD(removeAllActions);
  JS_ASSIGN_PROTO_METHOD(containsPoint);
  JS_ASSIGN_PROTO_METHOD(nodeAtPoint);
  JS_ASSIGN_PROTO_METHOD(nodesAtPoint);
  JS_ASSIGN_PROTO_METHOD(convertPointFromNode);
  JS_ASSIGN_PROTO_METHOD(convertPointToNode);
  JS_ASSIGN_PROTO_METHOD(intersectsNode);
  JS_ASSIGN_PROTO_METHOD(isEqualToNode);
#if TODO
// UITouch
  JS_ASSIGN_PROTO_METHOD(locationInNode);
  JS_ASSIGN_PROTO_METHOD(previousLocationInNode);
// NSEvent
  JS_ASSIGN_PROTO_METHOD(locationInNode);
#endif
// SKNode
  JS_ASSIGN_PROTO_PROP_READONLY(frame);
  JS_ASSIGN_PROTO_PROP(position);
  JS_ASSIGN_PROTO_PROP(zPosition);
  JS_ASSIGN_PROTO_PROP(zRotation);
  JS_ASSIGN_PROTO_PROP(xScale);
  JS_ASSIGN_PROTO_PROP(yScale);
  JS_ASSIGN_PROTO_PROP(speed);
  JS_ASSIGN_PROTO_PROP(alpha);
  JS_ASSIGN_PROTO_PROP(isPaused);
  JS_ASSIGN_PROTO_PROP(isHidden);
  JS_ASSIGN_PROTO_PROP(isUserInteractionEnabled);
  JS_ASSIGN_PROTO_PROP(focusBehavior);
  JS_ASSIGN_PROTO_PROP_READONLY(parent);
  JS_ASSIGN_PROTO_PROP_READONLY(children);
  JS_ASSIGN_PROTO_PROP(name);
  JS_ASSIGN_PROTO_PROP_READONLY(scene);
  JS_ASSIGN_PROTO_PROP(physicsBody);
  JS_ASSIGN_PROTO_PROP(userData);
  JS_ASSIGN_PROTO_PROP(reachConstraints);
  JS_ASSIGN_PROTO_PROP(constraints);
  JS_ASSIGN_PROTO_PROP(attributeValues);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKNode, UIResponder);
  // constants (exports)
  
  //typedef NS_ENUM(NSInteger, SKBlendMode) {
    JS_ASSIGN_ENUM(SKBlendModeAlpha, NSInteger); //          = 0,    
    JS_ASSIGN_ENUM(SKBlendModeAdd, NSInteger); //            = 1,    
    JS_ASSIGN_ENUM(SKBlendModeSubtract, NSInteger); //       = 2,    
    JS_ASSIGN_ENUM(SKBlendModeMultiply, NSInteger); //       = 3,    
    JS_ASSIGN_ENUM(SKBlendModeMultiplyX2, NSInteger); //     = 4,    
    JS_ASSIGN_ENUM(SKBlendModeScreen, NSInteger); //         = 5,    
    JS_ASSIGN_ENUM(SKBlendModeReplace, NSInteger); //        = 6,    
    JS_ASSIGN_ENUM(SKBlendModeMultiplyAlpha, NSInteger); //  = 7     
  //} NS_ENUM_AVAILABLE(10_9, 7_0);

  //typedef NS_ENUM(NSInteger, SKNodeFocusBehavior) {
    JS_ASSIGN_ENUM(SKNodeFocusBehaviorNone, NSInteger); //  = 0,    
    JS_ASSIGN_ENUM(SKNodeFocusBehaviorOccluding, NSInteger);
    JS_ASSIGN_ENUM(SKNodeFocusBehaviorFocusable, NSInteger);
  //} API_AVAILABLE(ios(11.0), tvos(11.0)) API_UNAVAILABLE(macos, watchos);

JS_INIT_CLASS_END(SKNode, UIResponder);

NAN_METHOD(NSKNode::New) {
  JS_RECONSTRUCT(SKNode);

  Local<Object> obj = info.This();

  NSKNode *node = new NSKNode();

  if (info[0]->IsExternal()) {
    node->SetNSObject((__bridge SKNode *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      node->SetNSObject([SKNode node]);
    }
  }
  node->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_METHOD(NSKNode::node) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([SKNode node]));
  }
}

NAN_METHOD(NSKNode::nodeWithFileNamed) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, filename);
    JS_SET_RETURN(js_value_instancetype([SKNode nodeWithFileNamed: filename]));
  }
}

NAN_METHOD(NSKNode::nodeWithFileNamedSecurelyWithClassesAndError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, filename);
    declare_pointer(NSSet/* <Class>*/, classes);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([SKNode nodeWithFileNamed: filename securelyWithClasses: classes andError: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NSKNode::init) {
  JS_UNWRAP_OR_ALLOC(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([self init]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NSKNode::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NSKNode::calculateAccumulatedFrame) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self calculateAccumulatedFrame]));
  }
}

#include "NSKAttributeValue.h"

NAN_METHOD(NSKNode::valueForAttributeNamed) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_SKAttributeValue([self valueForAttributeNamed: key]));
  }
}

NAN_METHOD(NSKNode::setValueForAttributeNamed) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKAttributeValue, value);
    declare_pointer(NSString, key);
    [self setValue: value forAttributeNamed: key];
  }
}

NAN_METHOD(NSKNode::setScale) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, scale);
    [self setScale: scale];
  }
}

NAN_METHOD(NSKNode::addChild) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKNode, node);
    [self addChild: node];
  }
}

NAN_METHOD(NSKNode::insertChildAtIndex) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKNode, node);
    declare_value(NSInteger, index);
    [self insertChild: node atIndex: index];
  }
}

NAN_METHOD(NSKNode::removeChildrenInArray) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<SKNode*>, nodes);
    [self removeChildrenInArray: nodes];
  }
}

NAN_METHOD(NSKNode::removeAllChildren) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    [self removeAllChildren];
  }
}

NAN_METHOD(NSKNode::removeFromParent) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    [self removeFromParent];
  }
}

NAN_METHOD(NSKNode::moveToParent) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKNode, parent);
    [self moveToParent: parent];
  }
}

NAN_METHOD(NSKNode::childNodeWithName) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    JS_SET_RETURN(js_value_SKNode([self childNodeWithName: name]));
  }
}

NAN_METHOD(NSKNode::enumerateChildNodesWithNameUsingBlock) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_callback(block);
    [self enumerateChildNodesWithName: name usingBlock:^(SKNode * _Nonnull node, BOOL * _Nonnull stop) {
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NSKNode::enumerateChildNodesWithNameUsingBlock",
            js_value_SKNode(node)//,
            /*js_box_BOOL(stop)*/); // TODO
        }
      });
    }];
  }
}

NAN_METHOD(NSKNode::objectForKeyedSubscript) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    JS_SET_RETURN(js_value_NSArray<SKNode*>([self objectForKeyedSubscript: name]));
  }
}

NAN_METHOD(NSKNode::inParentHierarchy) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKNode, parent);
    JS_SET_RETURN(js_value_BOOL([self inParentHierarchy: parent]));
  }
}

#include "NSKAction.h"

NAN_METHOD(NSKNode::runAction) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKAction, action);
    [self runAction: action];
  }
}

NAN_METHOD(NSKNode::runActionCompletion) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKAction, action);
    declare_callback(block);
    [self runAction: action completion:^{
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NSKNode::runActionCompletion");
        }
      });
    }];
  }
}

NAN_METHOD(NSKNode::runActionWithKey) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKAction, action);
    declare_pointer(NSString, key);
    [self runAction: action withKey: key];
  }
}

NAN_METHOD(NSKNode::hasActions) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasActions]));
  }
}

NAN_METHOD(NSKNode::actionForKey) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_SKAction([self actionForKey: key]));
  }
}

NAN_METHOD(NSKNode::removeActionForKey) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    [self removeActionForKey: key];
  }
}

NAN_METHOD(NSKNode::removeAllActions) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    [self removeAllActions];
  }
}

NAN_METHOD(NSKNode::containsPoint) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, p);
    JS_SET_RETURN(js_value_BOOL([self containsPoint: p]));
  }
}

NAN_METHOD(NSKNode::nodeAtPoint) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, p);
    JS_SET_RETURN(js_value_SKNode([self nodeAtPoint: p]));
  }
}

NAN_METHOD(NSKNode::nodesAtPoint) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, p);
    JS_SET_RETURN(js_value_NSArray<SKNode*>([self nodesAtPoint: p]));
  }
}

NAN_METHOD(NSKNode::convertPointFromNode) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_pointer(SKNode, node);
    JS_SET_RETURN(js_value_CGPoint([self convertPoint: point fromNode: node]));
  }
}

NAN_METHOD(NSKNode::convertPointToNode) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_pointer(SKNode, node);
    JS_SET_RETURN(js_value_CGPoint([self convertPoint: point toNode: node]));
  }
}

NAN_METHOD(NSKNode::intersectsNode) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKNode, node);
    JS_SET_RETURN(js_value_BOOL([self intersectsNode: node]));
  }
}

NAN_METHOD(NSKNode::isEqualToNode) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKNode, node);
    JS_SET_RETURN(js_value_BOOL([self isEqualToNode: node]));
  }
}

#if TODO

// UITouch

NAN_METHOD(NUITouch::locationInNode) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKNode, node);
    JS_SET_RETURN(js_value_CGPoint([self locationInNode: node]));
  }
}

NAN_METHOD(NUITouch::previousLocationInNode) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKNode, node);
    JS_SET_RETURN(js_value_CGPoint([self previousLocationInNode: node]));
  }
}
// NSEvent

NAN_METHOD(NNSEvent::locationInNode) {
  JS_UNWRAP(NSEvent, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKNode, node);
    JS_SET_RETURN(js_value_CGPoint([self locationInNode: node]));
  }
}

#endif

NAN_GETTER(NSKNode::frameGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self frame]));
  }
}

NAN_GETTER(NSKNode::positionGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self position]));
  }
}

NAN_SETTER(NSKNode::positionSetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPoint, input);
    [self setPosition: input];
  }
}

NAN_GETTER(NSKNode::zPositionGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self zPosition]));
  }
}

NAN_SETTER(NSKNode::zPositionSetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setZPosition: input];
  }
}

NAN_GETTER(NSKNode::zRotationGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self zRotation]));
  }
}

NAN_SETTER(NSKNode::zRotationSetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setZRotation: input];
  }
}

NAN_GETTER(NSKNode::xScaleGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self xScale]));
  }
}

NAN_SETTER(NSKNode::xScaleSetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setXScale: input];
  }
}

NAN_GETTER(NSKNode::yScaleGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self yScale]));
  }
}

NAN_SETTER(NSKNode::yScaleSetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setYScale: input];
  }
}

NAN_GETTER(NSKNode::speedGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self speed]));
  }
}

NAN_SETTER(NSKNode::speedSetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSpeed: input];
  }
}

NAN_GETTER(NSKNode::alphaGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self alpha]));
  }
}

NAN_SETTER(NSKNode::alphaSetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setAlpha: input];
  }
}

NAN_GETTER(NSKNode::isPausedGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPaused]));
  }
}

NAN_SETTER(NSKNode::isPausedSetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPaused: input];
  }
}

NAN_GETTER(NSKNode::isHiddenGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isHidden]));
  }
}

NAN_SETTER(NSKNode::isHiddenSetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidden: input];
  }
}

NAN_GETTER(NSKNode::isUserInteractionEnabledGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isUserInteractionEnabled]));
  }
}

NAN_SETTER(NSKNode::isUserInteractionEnabledSetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setUserInteractionEnabled: input];
  }
}

NAN_GETTER(NSKNode::focusBehaviorGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKNodeFocusBehavior([self focusBehavior]));
  }
}

NAN_SETTER(NSKNode::focusBehaviorSetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SKNodeFocusBehavior, input);
    [self setFocusBehavior: input];
  }
}

NAN_GETTER(NSKNode::parentGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKNode([self parent]));
  }
}

NAN_GETTER(NSKNode::childrenGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SKNode*>([self children]));
  }
}

NAN_GETTER(NSKNode::nameGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NSKNode::nameSetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}

#include "NSKScene.h"

NAN_GETTER(NSKNode::sceneGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKScene([self scene]));
  }
}

#include "NSKPhysicsBody.h"

NAN_GETTER(NSKNode::physicsBodyGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKPhysicsBody([self physicsBody]));
  }
}

NAN_SETTER(NSKNode::physicsBodySetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SKPhysicsBody, input);
    [self setPhysicsBody: input];
  }
}

NAN_GETTER(NSKNode::userDataGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableDictionary([self userData]));
  }
}

NAN_SETTER(NSKNode::userDataSetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSMutableDictionary, input);
    [self setUserData: input];
  }
}

NAN_GETTER(NSKNode::reachConstraintsGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKReachConstraints([self reachConstraints]));
  }
}

#include "NSKReachConstraints.h"

NAN_SETTER(NSKNode::reachConstraintsSetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SKReachConstraints, input);
    [self setReachConstraints: input];
  }
}

NAN_GETTER(NSKNode::constraintsGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SKConstraint*>([self constraints]));
  }
}

NAN_SETTER(NSKNode::constraintsSetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<SKConstraint*>, input);
    [self setConstraints: input];
  }
}

NAN_GETTER(NSKNode::attributeValuesGetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, SKAttributeValue*>*/([self attributeValues]));
  }
}

NAN_SETTER(NSKNode::attributeValuesSetter) {
  JS_UNWRAP(SKNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary/* <NSString*, SKAttributeValue*>*/, input);
    [self setAttributeValues: input];
  }
}
