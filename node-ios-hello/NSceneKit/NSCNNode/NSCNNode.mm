//
//  NSCNNode.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SceneKit/SceneKit.h>
#import <SceneKit/ModelIO.h>
#include "defines.h"
#include "NSCNNode.h"
#include "NNSObject.h"
#include "NSCNLight.h"
#include "NSCNGeometry.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NSCNNode::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNNode::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNNode"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "addChildNode", AddChildNode);
  Nan::SetMethod(proto, "clone", Clone);
//  JS_SET_PROP(proto, "simdTransform", SimdTransform);
//  JS_SET_PROP(proto, "simdWorldTransform", SimdWorldTransform);
//  JS_SET_PROP(proto, "light", Light);
//  JS_SET_PROP(proto, "position", Position);
//  JS_SET_PROP(proto, "eulerAngles", EulerAngles);
//  JS_ASSIGN_PROP(proto, scale);
//  JS_ASSIGN_PROP(proto, geometry);
  
  JS_ASSIGN_PROP(proto, name);
  JS_ASSIGN_PROP(proto, light);
  JS_ASSIGN_PROP(proto, camera);
  JS_ASSIGN_PROP(proto, geometry);
  JS_ASSIGN_PROP(proto, skinner);
  JS_ASSIGN_PROP(proto, morpher);
  JS_ASSIGN_PROP(proto, transform);
  JS_ASSIGN_PROP_READONLY(proto, worldTransform);
  JS_ASSIGN_PROP(proto, position);
  JS_ASSIGN_PROP(proto, worldPosition);
  JS_ASSIGN_PROP(proto, rotation);
  JS_ASSIGN_PROP(proto, orientation);
  JS_ASSIGN_PROP(proto, worldOrientation);
  JS_ASSIGN_PROP(proto, eulerAngles);
  JS_ASSIGN_PROP(proto, scale);
  JS_ASSIGN_PROP(proto, pivot);
  JS_ASSIGN_PROP(proto, hidden);
  JS_ASSIGN_PROP(proto, opacity);
  JS_ASSIGN_PROP(proto, renderingOrder);
  JS_ASSIGN_PROP(proto, castsShadow);
  JS_ASSIGN_PROP(proto, movabilityHint);
  JS_ASSIGN_PROP_READONLY(proto, parentNode);
  JS_ASSIGN_PROP_READONLY(proto, childNodes);
  JS_ASSIGN_PROP(proto, physicsBody);
  JS_ASSIGN_PROP(proto, physicsField);
  JS_ASSIGN_PROP(proto, constraints);
  JS_ASSIGN_PROP(proto, filters);
  JS_ASSIGN_PROP_READONLY(proto, presentationNode);
  JS_ASSIGN_PROP(proto, paused);
  JS_ASSIGN_PROP(proto, rendererDelegate);
  JS_ASSIGN_PROP(proto, categoryBitMask);
  JS_ASSIGN_PROP(proto, focusBehavior);
  JS_ASSIGN_PROP_READONLY(proto, worldUp);
  JS_ASSIGN_PROP_READONLY(proto, worldRight);
  JS_ASSIGN_PROP_READONLY(proto, worldFront);
  JS_ASSIGN_PROP(proto, simdTransform);
  JS_ASSIGN_PROP(proto, simdPosition);
  JS_ASSIGN_PROP(proto, simdRotation);
  JS_ASSIGN_PROP(proto, simdOrientation);
  JS_ASSIGN_PROP(proto, simdEulerAngles);
  JS_ASSIGN_PROP(proto, simdScale);
  JS_ASSIGN_PROP(proto, simdPivot);
  JS_ASSIGN_PROP(proto, simdWorldPosition);
  JS_ASSIGN_PROP(proto, simdWorldOrientation);
  JS_ASSIGN_PROP(proto, simdWorldTransform);
  JS_ASSIGN_PROP_READONLY(proto, simdWorldUp);
  JS_ASSIGN_PROP_READONLY(proto, simdWorldRight);
  JS_ASSIGN_PROP_READONLY(proto, simdWorldFront);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctorFn), localUp);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctorFn), localRight);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctorFn), localFront);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctorFn), simdLocalUp);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctorFn), simdLocalRight);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctorFn), simdLocalFront);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNNode::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSCNNode *node = new NSCNNode();

  if (info[0]->IsExternal()) {
    node->SetNSObject((__bridge SCNNode *)(info[0].As<External>()->Value()));
  } else if (info[0]->IsString()) {
    @autoreleasepool {
      NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
      NSString *fileName = NJSStringToNSString(info[0]);
      if (strcmp([fileName UTF8String], "box") == 0) {
        SCNBox* box = [SCNBox boxWithWidth:0.1 height:0.1 length:0.1 chamferRadius:0];
        SCNNode* scnNode = [SCNNode nodeWithGeometry:box];
        SCNMaterial *mat = [[SCNMaterial alloc] init];
        [[mat diffuse] setContents: [SCNColor whiteColor]];
        mat.diffuse.intensity = 60;
        [box setMaterials:@[mat]];
        node->SetNSObject(scnNode);
      } else {
        NSString *filePath = [documents stringByAppendingPathComponent:fileName];
        NSURL *url = [[NSURL alloc] initFileURLWithPath:filePath];
        MDLAsset *asset = [[MDLAsset alloc] initWithURL:url];
        MDLObject *object = [asset objectAtIndex:0];
        SCNNode *scnNode = [SCNNode nodeWithMDLObject:object];
        SCNMaterial *mat = [[SCNMaterial alloc] init];
        [[mat diffuse] setContents: [SCNColor whiteColor]];
        mat.diffuse.intensity = 60;
        [[scnNode geometry] setMaterials:@[mat]];
        node->SetNSObject(scnNode);
      }
    }
  } else if (info[0]->IsObject() && JS_INSTANCEOF(info[0], NSCNGeometry)) {
    @autoreleasepool {
      NSCNGeometry *child = ObjectWrap::Unwrap<NSCNGeometry>(Local<Object>::Cast(info[0]));
      node->SetNSObject([SCNNode nodeWithGeometry:child->As<SCNGeometry>()]);
    }
  } else {
    @autoreleasepool {
      node->SetNSObject([[SCNNode alloc] init]);
    }
  }
  node->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NSCNNode::NSCNNode () {}
NSCNNode::~NSCNNode () {}

NAN_METHOD(NSCNNode::AddChildNode) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNNode, node);

  NSCNNode *child = ObjectWrap::Unwrap<NSCNNode>(Local<Object>::Cast(info[0]));
  
  [node addChildNode:child->As<SCNNode>()];
}

NAN_METHOD(NSCNNode::Clone) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNNode, node);
  JS_SET_RETURN(sweetiekit::GetWrapperFor([node clone], NSCNNode::type));
}
//
//NAN_GETTER(NSCNNode::SimdTransformGetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SCNNode, node);
//
//  auto xform = node.simdTransform;
//  const float* matrix = (const float*)&xform;
//  JS_SET_RETURN(createTypedArray<Float32Array>(16, matrix));
//}
//
//NAN_SETTER(NSCNNode::SimdTransformSetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SCNNode, node);
//
//  auto xform = node.simdWorldTransform;
//  if (!sweetiekit::SetTransform(xform, value)) {
//    Nan::ThrowError("SCNNode:setSimdTransform: invalid transform type");
//  } else {
//    [node setSimdTransform:xform];
//  }
//}
//
//NAN_GETTER(NSCNNode::SimdWorldTransformGetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SCNNode, node);
//
//  auto xform = node.simdWorldTransform;
//  const float* matrix = (const float*)&xform;
//  JS_SET_RETURN(createTypedArray<Float32Array>(16, matrix));
//}
//
//NAN_SETTER(NSCNNode::SimdWorldTransformSetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SCNNode, node);
//
//  auto xform = node.simdWorldTransform;
//  if (!sweetiekit::SetTransform(xform, value)) {
//    Nan::ThrowError("SCNNode:setSimdWorldTransform: invalid transform type");
//  } else {
//    [node setSimdWorldTransform:xform];
//  }
//}
//
//
//NAN_GETTER(NSCNNode::LightGetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SCNNode, node);
//
//  JS_SET_RETURN(sweetiekit::GetWrapperFor([node light], NSCNLight::type));
//}
//
//NAN_SETTER(NSCNNode::LightSetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SCNNode, node);
//
//  NSCNLight *light = ObjectWrap::Unwrap<NSCNLight>(Local<Object>::Cast(value));
//
//  @autoreleasepool {
//    [node setLight:light->As<SCNLight>()];
//  }
//}
//
//NAN_GETTER(NSCNNode::PositionGetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SCNNode, node);
//
//  __block float x = 0;
//  __block float y = 0;
//  __block float z = 0;
//  @autoreleasepool {
//    SCNVector3 v = [node position];
//    x = v.x;
//    y = v.y;
//    z = v.z;
//  }
//  
//  Local<Object> result = Object::New(Isolate::GetCurrent());
//  result->Set(JS_STR("x"), JS_FLOAT(x));
//  result->Set(JS_STR("y"), JS_FLOAT(y));
//  result->Set(JS_STR("z"), JS_FLOAT(z));
//
//  JS_SET_RETURN(result);
//}
//
//NAN_SETTER(NSCNNode::PositionSetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SCNNode, node);
//
//  float x = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("x")));
//  float y = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("y")));
//  float z = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("z")));
//
//  @autoreleasepool {
//    [node setPosition:SCNVector3Make(x, y, z)];
//  }
//}
//
//NAN_GETTER(NSCNNode::EulerAnglesGetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SCNNode, node);
//
//  __block float x = 0;
//  __block float y = 0;
//  __block float z = 0;
//  @autoreleasepool {
//    SCNVector3 v = [node eulerAngles];
//    x = v.x;
//    y = v.y;
//    z = v.z;
//  }
//  
//  Local<Object> result = Object::New(Isolate::GetCurrent());
//  result->Set(JS_STR("x"), JS_FLOAT(x));
//  result->Set(JS_STR("y"), JS_FLOAT(y));
//  result->Set(JS_STR("z"), JS_FLOAT(z));
//
//  JS_SET_RETURN(result);
//}
//
//NAN_SETTER(NSCNNode::EulerAnglesSetter) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(SCNNode, node);
//
//  float x = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("x")));
//  float y = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("y")));
//  float z = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("z")));
//
//  @autoreleasepool {
//    [node setEulerAngles:SCNVector3Make(x, y, z)];
//  }
//}

// --------- begin source --------------

NAN_GETTER(NSCNNode::nameGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSString([self name]));
    return;
  }
}

NAN_SETTER(NSCNNode::nameSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setName: to_value_NSString(value)];
  }
}

NAN_GETTER(NSCNNode::lightGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNLight([self light]));
    return;
  }
}

NAN_SETTER(NSCNNode::lightSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setLight: to_value_SCNLight(value)];
  }
}

NAN_GETTER(NSCNNode::cameraGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNCamera([self camera]));
    return;
  }
}

NAN_SETTER(NSCNNode::cameraSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setCamera: to_value_SCNCamera(value)];
  }
}

NAN_GETTER(NSCNNode::geometryGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNGeometry([self geometry]));
    return;
  }
}

NAN_SETTER(NSCNNode::geometrySetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setGeometry: to_value_SCNGeometry(value)];
  }
}

NAN_GETTER(NSCNNode::skinnerGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNSkinner([self skinner]));
    return;
  }
}

NAN_SETTER(NSCNNode::skinnerSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setSkinner: to_value_SCNSkinner(value)];
  }
}

NAN_GETTER(NSCNNode::morpherGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMorpher([self morpher]));
    return;
  }
}

NAN_SETTER(NSCNNode::morpherSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setMorpher: to_value_SCNMorpher(value)];
  }
}

NAN_GETTER(NSCNNode::transformGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMatrix4([self transform]));
    return;
  }
}

NAN_SETTER(NSCNNode::transformSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setTransform: to_value_SCNMatrix4(value)];
  }
}

NAN_GETTER(NSCNNode::worldTransformGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMatrix4([self worldTransform]));
    return;
  }
}

NAN_GETTER(NSCNNode::positionGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self position]));
    return;
  }
}

NAN_SETTER(NSCNNode::positionSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setPosition: to_value_SCNVector3(value)];
  }
}

NAN_GETTER(NSCNNode::worldPositionGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self worldPosition]));
    return;
  }
}

NAN_SETTER(NSCNNode::worldPositionSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setWorldPosition: to_value_SCNVector3(value)];
  }
}

NAN_GETTER(NSCNNode::rotationGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector4([self rotation]));
    return;
  }
}

NAN_SETTER(NSCNNode::rotationSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setRotation: to_value_SCNVector4(value)];
  }
}

NAN_GETTER(NSCNNode::orientationGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNQuaternion([self orientation]));
    return;
  }
}

NAN_SETTER(NSCNNode::orientationSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setOrientation: to_value_SCNQuaternion(value)];
  }
}

NAN_GETTER(NSCNNode::worldOrientationGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNQuaternion([self worldOrientation]));
    return;
  }
}

NAN_SETTER(NSCNNode::worldOrientationSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setWorldOrientation: to_value_SCNQuaternion(value)];
  }
}

NAN_GETTER(NSCNNode::eulerAnglesGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self eulerAngles]));
    return;
  }
}

NAN_SETTER(NSCNNode::eulerAnglesSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setEulerAngles: to_value_SCNVector3(value)];
  }
}

NAN_GETTER(NSCNNode::scaleGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self scale]));
    return;
  }
}

NAN_SETTER(NSCNNode::scaleSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setScale: to_value_SCNVector3(value)];
  }
}

NAN_GETTER(NSCNNode::pivotGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMatrix4([self pivot]));
    return;
  }
}

NAN_SETTER(NSCNNode::pivotSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setPivot: to_value_SCNMatrix4(value)];
  }
}

NAN_GETTER(NSCNNode::hiddenGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isHidden]));
    return;
  }
}

NAN_SETTER(NSCNNode::hiddenSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setHidden: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNNode::opacityGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self opacity]));
    return;
  }
}

NAN_SETTER(NSCNNode::opacitySetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setOpacity: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNNode::renderingOrderGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self renderingOrder]));
    return;
  }
}

NAN_SETTER(NSCNNode::renderingOrderSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setRenderingOrder: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNNode::castsShadowGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self castsShadow]));
    return;
  }
}

NAN_SETTER(NSCNNode::castsShadowSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setCastsShadow: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNNode::movabilityHintGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMovabilityHint([self movabilityHint]));
    return;
  }
}

NAN_SETTER(NSCNNode::movabilityHintSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setMovabilityHint: to_value_SCNMovabilityHint(value)];
  }
}

NAN_GETTER(NSCNNode::parentNodeGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNNode([self parentNode]));
    return;
  }
}

NAN_GETTER(NSCNNode::childNodesGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray<SCNNode* >([self childNodes]));
    return;
  }
}

NAN_GETTER(NSCNNode::physicsBodyGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNPhysicsBody([self physicsBody]));
    return;
  }
}

NAN_SETTER(NSCNNode::physicsBodySetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setPhysicsBody: to_value_SCNPhysicsBody(value)];
  }
}

NAN_GETTER(NSCNNode::physicsFieldGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNPhysicsField([self physicsField]));
    return;
  }
}

NAN_SETTER(NSCNNode::physicsFieldSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setPhysicsField: to_value_SCNPhysicsField(value)];
  }
}

NAN_GETTER(NSCNNode::constraintsGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray<SCNConstraint* >([self constraints]));
    return;
  }
}

NAN_SETTER(NSCNNode::constraintsSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setConstraints: to_value_NSArray<SCNConstraint* >(value)];
  }
}

NAN_GETTER(NSCNNode::filtersGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray<CIFilter* >([self filters]));
    return;
  }
}

NAN_SETTER(NSCNNode::filtersSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setFilters: to_value_NSArray<CIFilter* >(value)];
  }
}

NAN_GETTER(NSCNNode::presentationNodeGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNNode([self presentationNode]));
    return;
  }
}

NAN_GETTER(NSCNNode::pausedGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isPaused]));
    return;
  }
}

NAN_SETTER(NSCNNode::pausedSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setPaused: TO_BOOL(value)];
  }
}

typedef NSObject SCNNodeRendererDelegate;

NAN_GETTER(NSCNNode::rendererDelegateGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_id <SCNNodeRendererDelegate>([self rendererDelegate]));
    return;
  }
}

NAN_SETTER(NSCNNode::rendererDelegateSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setRendererDelegate: to_value_id <SCNNodeRendererDelegate>(value)];
  }
}

NAN_GETTER(NSCNNode::categoryBitMaskGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSUInteger([self categoryBitMask]));
    return;
  }
}

NAN_SETTER(NSCNNode::categoryBitMaskSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setCategoryBitMask: to_value_NSUInteger(value)];
  }
}

NAN_GETTER(NSCNNode::focusBehaviorGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNNodeFocusBehavior([self focusBehavior]));
    return;
  }
}

NAN_SETTER(NSCNNode::focusBehaviorSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setFocusBehavior: to_value_SCNNodeFocusBehavior(value)];
  }
}

#import <SceneKit/SCNNode.h>

NAN_GETTER(NSCNNode::localUpGetter) {
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([SCNNode localUp]));
    return;
  }
}

NAN_GETTER(NSCNNode::localRightGetter) {
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([SCNNode localRight]));
    return;
  }
}

NAN_GETTER(NSCNNode::localFrontGetter) {
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([SCNNode localFront]));
    return;
  }
}

NAN_GETTER(NSCNNode::worldUpGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self worldUp]));
    return;
  }
}

NAN_GETTER(NSCNNode::worldRightGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self worldRight]));
    return;
  }
}

NAN_GETTER(NSCNNode::worldFrontGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self worldFront]));
    return;
  }
}

NAN_GETTER(NSCNNode::simdTransformGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float4x4([self simdTransform]));
    return;
  }
}

NAN_SETTER(NSCNNode::simdTransformSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setSimdTransform: to_value_simd_float4x4(value)];
  }
}

NAN_GETTER(NSCNNode::simdPositionGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float3([self simdPosition]));
    return;
  }
}

NAN_SETTER(NSCNNode::simdPositionSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setSimdPosition: to_value_simd_float3(value)];
  }
}

NAN_GETTER(NSCNNode::simdRotationGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float4([self simdRotation]));
    return;
  }
}

NAN_SETTER(NSCNNode::simdRotationSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setSimdRotation: to_value_simd_float4(value)];
  }
}

NAN_GETTER(NSCNNode::simdOrientationGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_quatf([self simdOrientation]));
    return;
  }
}

NAN_SETTER(NSCNNode::simdOrientationSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setSimdOrientation: to_value_simd_quatf(value)];
  }
}

NAN_GETTER(NSCNNode::simdEulerAnglesGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float3([self simdEulerAngles]));
    return;
  }
}

NAN_SETTER(NSCNNode::simdEulerAnglesSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setSimdEulerAngles: to_value_simd_float3(value)];
  }
}

NAN_GETTER(NSCNNode::simdScaleGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float3([self simdScale]));
    return;
  }
}

NAN_SETTER(NSCNNode::simdScaleSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setSimdScale: to_value_simd_float3(value)];
  }
}

NAN_GETTER(NSCNNode::simdPivotGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float4x4([self simdPivot]));
    return;
  }
}

NAN_SETTER(NSCNNode::simdPivotSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setSimdPivot: to_value_simd_float4x4(value)];
  }
}

NAN_GETTER(NSCNNode::simdWorldPositionGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float3([self simdWorldPosition]));
    return;
  }
}

NAN_SETTER(NSCNNode::simdWorldPositionSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setSimdWorldPosition: to_value_simd_float3(value)];
  }
}

NAN_GETTER(NSCNNode::simdWorldOrientationGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_quatf([self simdWorldOrientation]));
    return;
  }
}

NAN_SETTER(NSCNNode::simdWorldOrientationSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setSimdWorldOrientation: to_value_simd_quatf(value)];
  }
}

NAN_GETTER(NSCNNode::simdWorldTransformGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float4x4([self simdWorldTransform]));
    return;
  }
}

NAN_SETTER(NSCNNode::simdWorldTransformSetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self setSimdWorldTransform: to_value_simd_float4x4(value)];
  }
}

NAN_GETTER(NSCNNode::simdLocalUpGetter) {
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float3([SCNNode simdLocalUp]));
    return;
  }
}

NAN_GETTER(NSCNNode::simdLocalRightGetter) {
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float3([SCNNode simdLocalRight]));
    return;
  }
}

NAN_GETTER(NSCNNode::simdLocalFrontGetter) {
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float3([SCNNode simdLocalFront]));
    return;
  }
}

NAN_GETTER(NSCNNode::simdWorldUpGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float3([self simdWorldUp]));
    return;
  }
}

NAN_GETTER(NSCNNode::simdWorldRightGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float3([self simdWorldRight]));
    return;
  }
}

NAN_GETTER(NSCNNode::simdWorldFrontGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float3([self simdWorldFront]));
    return;
  }
}

// --------- end source ----------------
