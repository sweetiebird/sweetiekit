//
//  NSKNode.mm
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKNode.h"

NSKNode::NSKNode() {}
NSKNode::~NSKNode() {}

JS_INIT_CLASS(SKNode, UIResponder);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, addChild);
  JS_ASSIGN_METHOD(proto, removeFromParent);
  JS_ASSIGN_METHOD(proto, runAction);
  JS_ASSIGN_METHOD(proto, childNodeWithName);
  JS_ASSIGN_METHOD(proto, containsPoint);
  JS_ASSIGN_METHOD(proto, convertPointFromNode);
  JS_ASSIGN_METHOD(proto, convertPointToNode);
  JS_ASSIGN_PROTO_METHOD(nodeAtPoint);
  JS_ASSIGN_PROTO_METHOD(nodesAtPoint);
  JS_ASSIGN_PROP_READONLY(proto, frame);
  JS_ASSIGN_PROP_READONLY(proto, width);
  JS_ASSIGN_PROP_READONLY(proto, height);
  JS_ASSIGN_PROP(proto, position);
  JS_ASSIGN_PROP(proto, x);
  JS_ASSIGN_PROP(proto, y);
  JS_ASSIGN_PROP(proto, z);
  JS_ASSIGN_PROP(proto, zPosition);
  JS_ASSIGN_PROP(proto, zRotation);
  JS_ASSIGN_PROP(proto, xScale);
  JS_ASSIGN_PROP(proto, yScale);
  JS_ASSIGN_PROP(proto, speed);
  JS_ASSIGN_PROP(proto, alpha);
  JS_ASSIGN_PROP(proto, paused);
  JS_ASSIGN_PROP(proto, hidden);
  JS_ASSIGN_PROP(proto, userInteractionEnabled);
  JS_ASSIGN_PROP(proto, focusBehavior);
  JS_ASSIGN_PROP_READONLY(proto, parent);
  JS_ASSIGN_PROP_READONLY(proto, children);
  JS_ASSIGN_PROP(proto, name);
  JS_ASSIGN_PROP_READONLY(proto, scene);
  JS_ASSIGN_PROP(proto, physicsBody);
  JS_ASSIGN_PROP(proto, userData);
  JS_ASSIGN_PROP(proto, reachConstraints);
  JS_ASSIGN_PROP(proto, constraints);
  JS_ASSIGN_PROP(proto, attributeValues);
  // static members (ctor)
  JS_INIT_CTOR(SKNode, UIResponder);
JS_INIT_CLASS_END(SKNode, UIResponder);

NAN_METHOD(NSKNode::New) {
  JS_RECONSTRUCT(SKNode);

  Local<Object> obj = info.This();

  NSKNode *node = new NSKNode();

  if (info[0]->IsExternal()) {
    node->SetNSObject((__bridge SKNode *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        node->SetNSObject([SKNode node]);
      });
    }
  }
  node->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_METHOD(NSKNode::addChild) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKNode, node);

  NSKNode *child = ObjectWrap::Unwrap<NSKNode>(Local<Object>::Cast(info[0]));

  [node addChild:child->As<SKNode>()];
}

NAN_METHOD(NSKNode::removeFromParent) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKNode, node);

  [node removeFromParent];
}

#include "NSKAction.h"

NAN_METHOD(NSKNode::runAction) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKNode, node);

  NSKAction *action = ObjectWrap::Unwrap<NSKAction>(Local<Object>::Cast(info[0]));
  __block sweetiekit::JSFunction fn(info[1]);

  [node runAction:action->As<SKAction>() completion: ^ {
    dispatch_ui_sync(dispatch_get_main_queue(), ^{
      Nan::HandleScope scope;
      fn.Call("NSKNode::runAction completion handler");
      fn.Reset();
    });
  }];
  [node runAction:action->As<SKAction>()];
}

NAN_METHOD(NSKNode::childNodeWithName) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKNode, node);

  id child = [node childNodeWithName:NJSStringToNSString(info[0])];
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor(child, NSKNode::type));
}

NAN_METHOD(NSKNode::containsPoint) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKNode, node);

  float x = TO_FLOAT(JS_OBJ(info[0])->Get(JS_STR("x")));
  float y = TO_FLOAT(JS_OBJ(info[0])->Get(JS_STR("y")));
  bool contains = [node containsPoint:CGPointMake(x, y)];

  JS_SET_RETURN(JS_BOOL(contains));
}

NAN_METHOD(NSKNode::convertPointFromNode) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKNode, node);

  float x = TO_FLOAT(JS_OBJ(info[0])->Get(JS_STR("x")));
  float y = TO_FLOAT(JS_OBJ(info[0])->Get(JS_STR("y")));
  NSKNode *child = ObjectWrap::Unwrap<NSKNode>(Local<Object>::Cast(info[1]));
  CGPoint pt  = [node convertPoint:CGPointMake(x, y) fromNode:child->As<SKNode>()];

  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_FLOAT(pt.x));
  result->Set(JS_STR("y"), JS_FLOAT(pt.y));

  JS_SET_RETURN(result);
  return;
}

NAN_METHOD(NSKNode::convertPointToNode) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKNode, node);

  float x = TO_FLOAT(JS_OBJ(info[0])->Get(JS_STR("x")));
  float y = TO_FLOAT(JS_OBJ(info[0])->Get(JS_STR("y")));
  NSKNode *child = ObjectWrap::Unwrap<NSKNode>(Local<Object>::Cast(info[1]));
  CGPoint pt = [node convertPoint:CGPointMake(x, y) toNode:child->As<SKNode>()];

  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_FLOAT(pt.x));
  result->Set(JS_STR("y"), JS_FLOAT(pt.y));

  JS_SET_RETURN(result);
  return;
}

NAN_METHOD(NSKNode::nodeAtPoint) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_SKNode([self nodeAtPoint:to_value_CGPoint(info[0])]));
  }
}

NAN_METHOD(NSKNode::nodesAtPoint) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SKNode*>([self nodesAtPoint:to_value_CGPoint(info[0])]));
  }
}


//NAN_GETTER(NSKNode::PositionGetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SKNode, node);
//
//  Local<Object> result = Object::New(Isolate::GetCurrent());
//  result->Set(JS_STR("x"), JS_FLOAT([node position].x));
//  result->Set(JS_STR("y"), JS_FLOAT([node position].y));
//
//  JS_SET_RETURN(result);
//}
//
//NAN_SETTER(NSKNode::PositionSetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SKNode, node);
//
//  __block float x = 0;
//  __block float y = 0;
//  @autoreleasepool {
//    x = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("x")));
//    y = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("y")));
//  }
//
//  [node setPosition:CGPointMake(x, y)];
//}
//
//NAN_GETTER(NSKNode::ZPositionGetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SKNode, node);
//
//  JS_SET_RETURN(JS_FLOAT([node zPosition]));
//}
//
//NAN_SETTER(NSKNode::ZPositionSetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SKNode, node);
//
//  float z = TO_FLOAT(value);
//
//  [node setZPosition:z];
//}
//
//NAN_GETTER(NSKNode::ZRotationGetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SKNode, node);
//
//  JS_SET_RETURN(JS_FLOAT([node zRotation]));
//}
//
//NAN_SETTER(NSKNode::ZRotationSetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SKNode, node);
//
//  __block float rotation = 0;
//  @autoreleasepool {
//    rotation = TO_FLOAT(value);
//  }
//
//  [node setZRotation:rotation];
//}
//
//NAN_GETTER(NSKNode::PhysicsBodyGetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SKNode, node);
//
//  JS_SET_RETURN(sweetiekit::GetWrapperFor([node physicsBody], NSKPhysicsBody::type));
//}
//
//NAN_SETTER(NSKNode::PhysicsBodySetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SKNode, node);
//
//  NSKPhysicsBody *body = ObjectWrap::Unwrap<NSKPhysicsBody>(Local<Object>::Cast(value));
//
//  [node setPhysicsBody:body->As<SKPhysicsBody>()];
//}

//JS_GETTER(SKNode, node, xScale, {
//  JS_SET_RETURN(JS_NUM([node xScale]));
//});
//
//JS_SETTER(SKNode, node, xScale, {
//  [node setXScale:TO_DOUBLE(value)];
//});
//
//JS_GETTER(SKNode, node, yScale, {
//  JS_SET_RETURN(JS_NUM([node yScale]));
//});
//
//JS_SETTER(SKNode, node, yScale, {
//  [node setYScale:TO_DOUBLE(value)];
//});

NAN_GETTER(NSKNode::frameGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    auto __rect = [self frame];
    auto __obj = Nan::New<Object>();
    Nan::Set(__obj, JS_STR("x"), JS_NUM(__rect.origin.x));
    Nan::Set(__obj, JS_STR("y"), JS_NUM(__rect.origin.y));
    Nan::Set(__obj, JS_STR("width"), JS_NUM(__rect.size.width));
    Nan::Set(__obj, JS_STR("height"), JS_NUM(__rect.size.height));
    JS_SET_RETURN(__obj);
    return;
  }
}

NAN_GETTER(NSKNode::positionGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    auto __point = [self position];
    auto __obj1 = Nan::New<Object>();
    Nan::Set(__obj1, JS_STR("x"), JS_NUM(__point.x));
    Nan::Set(__obj1, JS_STR("y"), JS_NUM(__point.y));
    JS_SET_RETURN(__obj1);
    return;
  }
}

NAN_SETTER(NSKNode::positionSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setPosition: to_value_CGPoint(value)];
  }
}

NAN_GETTER(NSKNode::widthGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self frame].size.width));
    return;
  }
}

NAN_GETTER(NSKNode::heightGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self frame].size.height));
    return;
  }
}

NAN_GETTER(NSKNode::xGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self position].x));
    return;
  }
}

NAN_SETTER(NSKNode::xSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setPosition: CGPointMake(TO_FLOAT(value), [self position].y)];
  }
}

NAN_GETTER(NSKNode::yGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self position].y));
    return;
  }
}

NAN_SETTER(NSKNode::ySetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setPosition: CGPointMake([self position].x, TO_FLOAT(value))];
  }
}

NAN_GETTER(NSKNode::zGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self zPosition]));
    return;
  }
}

NAN_SETTER(NSKNode::zSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setZPosition: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKNode::zPositionGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self zPosition]));
    return;
  }
}

NAN_SETTER(NSKNode::zPositionSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setZPosition: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKNode::zRotationGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self zRotation]));
    return;
  }
}

NAN_SETTER(NSKNode::zRotationSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setZRotation: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKNode::xScaleGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self xScale]));
    return;
  }
}

NAN_SETTER(NSKNode::xScaleSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setXScale: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKNode::yScaleGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self yScale]));
    return;
  }
}

NAN_SETTER(NSKNode::yScaleSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setYScale: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKNode::speedGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self speed]));
    return;
  }
}

NAN_SETTER(NSKNode::speedSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setSpeed: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKNode::alphaGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self alpha]));
    return;
  }
}

NAN_SETTER(NSKNode::alphaSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setAlpha: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKNode::pausedGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isPaused]));
    return;
  }
}

NAN_SETTER(NSKNode::pausedSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setPaused: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKNode::hiddenGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isHidden]));
    return;
  }
}

NAN_SETTER(NSKNode::hiddenSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setHidden: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKNode::userInteractionEnabledGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isUserInteractionEnabled]));
    return;
  }
}

NAN_SETTER(NSKNode::userInteractionEnabledSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setUserInteractionEnabled: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKNode::focusBehaviorGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKNodeFocusBehavior([self focusBehavior]));
    return;
  }
}

NAN_SETTER(NSKNode::focusBehaviorSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setFocusBehavior: to_value_SKNodeFocusBehavior(value)];
  }
}

NAN_GETTER(NSKNode::parentGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKNode([self parent]));
    return;
  }
}

NAN_GETTER(NSKNode::childrenGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray<SKNode*>([self children]));
    return;
  }
}

NAN_GETTER(NSKNode::nameGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    auto __it = [self name];
    Local<Value> __e31;
    if (__it) {
      __e31 = JS_STR([__it UTF8String]);
    } else {
      __e31 = Nan::Undefined();
    }
    JS_SET_RETURN(__e31);
    return;
  }
}

NAN_SETTER(NSKNode::nameSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setName: to_value_NSString(value)];
  }
}

#include "NSKScene.h"
NAN_GETTER(NSKNode::sceneGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKScene([self scene]));
    return;
  }
}

#include "NSKPhysicsBody.h"

NAN_GETTER(NSKNode::physicsBodyGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKPhysicsBody([self physicsBody]));
    return;
  }
}

NAN_SETTER(NSKNode::physicsBodySetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setPhysicsBody: to_value_SKPhysicsBody(value)];
  }
}

NAN_GETTER(NSKNode::userDataGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSMutableDictionary([self userData]));
    return;
  }
}

NAN_SETTER(NSKNode::userDataSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setUserData: to_value_NSMutableDictionary(value)];
  }
}

NAN_GETTER(NSKNode::reachConstraintsGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKReachConstraints([self reachConstraints]));
    return;
  }
}

NAN_SETTER(NSKNode::reachConstraintsSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setReachConstraints: to_value_SKReachConstraints(value)];
  }
}

NAN_GETTER(NSKNode::constraintsGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray<SKConstraint*>([self constraints]));
    return;
  }
}

NAN_SETTER(NSKNode::constraintsSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
    [self setConstraints: to_value_NSArray<SKConstraint*>(value)];
  }
}

NAN_GETTER(NSKNode::attributeValuesGetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_NSDictionary<NSString4232SKAttributeValue4232>([self attributeValues]));
    return;
  }
}

NAN_SETTER(NSKNode::attributeValuesSetter) {
  JS_UNWRAP(SKNode, self);
  @autoreleasepool
  {
//    [self setAttributeValues: to_value_NSDictionary<NSString4232SKAttributeValue4232>(value)];
  }
}

