//
//  NSCNNode.mm
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNNode.h"

#import <SceneKit/SceneKit.h>
#import <SceneKit/ModelIO.h>

NSCNNode::NSCNNode () {}
NSCNNode::~NSCNNode () {}

JS_INIT_CLASS(SCNNode, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(clone);
  JS_ASSIGN_PROTO_METHOD(flattenedClone);
  JS_ASSIGN_PROTO_METHOD(addChildNode);
  JS_ASSIGN_PROTO_METHOD(insertChildNode);
  JS_ASSIGN_PROTO_METHOD(replaceChildNode);
  JS_ASSIGN_PROTO_METHOD(childNodeWithName);
  JS_ASSIGN_PROTO_METHOD(childNodesPassingTest);
  JS_ASSIGN_PROTO_METHOD(enumerateChildNodes);
  JS_ASSIGN_PROTO_METHOD(enumerateHierarchy);
  JS_ASSIGN_PROTO_METHOD(removeFromParentNode);
  JS_ASSIGN_PROTO_METHOD(setWorldTransform);
  JS_ASSIGN_PROTO_METHOD(convertPositionToNode);
  JS_ASSIGN_PROTO_METHOD(convertPositionFromNode);
  JS_ASSIGN_PROTO_METHOD(convertVectorToNode);
  JS_ASSIGN_PROTO_METHOD(convertVectorFromNode);
  JS_ASSIGN_PROTO_METHOD(convertTransformToNode);
  JS_ASSIGN_PROTO_METHOD(convertTransformFromNode);
  JS_ASSIGN_PROTO_METHOD(hitTestWithSegmentFromPoint);
  JS_ASSIGN_PROTO_METHOD(lookAt);
  JS_ASSIGN_PROTO_METHOD(localTranslateBy);
  JS_ASSIGN_PROTO_METHOD(localRotateBy);
  JS_ASSIGN_PROTO_METHOD(rotateBy);
  JS_ASSIGN_PROTO_METHOD(simdConvertPositionToNode);
  JS_ASSIGN_PROTO_METHOD(simdConvertPositionFromNode);
  JS_ASSIGN_PROTO_METHOD(simdConvertVectorToNode);
  JS_ASSIGN_PROTO_METHOD(simdConvertVectorFromNode);
  JS_ASSIGN_PROTO_METHOD(simdConvertTransformToNode);
  JS_ASSIGN_PROTO_METHOD(simdConvertTransformFromNode);
  JS_ASSIGN_PROTO_METHOD(simdLookAt);
  JS_ASSIGN_PROTO_METHOD(simdLocalTranslateBy);
  JS_ASSIGN_PROTO_METHOD(simdLocalRotateBy);
  JS_ASSIGN_PROTO_METHOD(simdRotateBy);
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
  JS_SET_PROP_READONLY(proto, "presentation", presentationNode);
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
  // static members (ctor)
  JS_INIT_CTOR(SCNNode, NSObject);
  JS_ASSIGN_METHOD(ctor, nodeWithGeometry);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctor), localUp);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctor), localRight);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctor), localFront);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctor), simdLocalUp);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctor), simdLocalRight);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctor), simdLocalFront);
JS_INIT_CLASS_END(SCNNode, NSObject);

#include "NSCNGeometry.h"

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
  } else if (is_value_SCNGeometry(info[0])) {
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

NAN_METHOD(NSCNNode::nodeWithGeometry) {
  @autoreleasepool {
    JS_SET_RETURN_EXTERNAL(SCNNode,
      [SCNNode nodeWithGeometry:to_value_SCNGeometry(info[0])]);
  }
}

NAN_METHOD(NSCNNode::clone) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_SCNNode([self clone]));
  }
}

NAN_METHOD(NSCNNode::flattenedClone) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_SCNNode([self flattenedClone]));
  }
}

NAN_METHOD(NSCNNode::addChildNode) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    [self addChildNode:to_value_SCNNode(info[0])];
  }
}

NAN_METHOD(NSCNNode::insertChildNode) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    NSUInteger index(info[1]->IsUint32() ? to_value_NSUInteger(info[1]) : 0);
    [self insertChildNode:to_value_SCNNode(info[0]) atIndex:index];
  }
}

NAN_METHOD(NSCNNode::replaceChildNode) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    [self replaceChildNode:to_value_SCNNode(info[0]) with:to_value_SCNNode(info[1])];
  }
}

NAN_METHOD(NSCNNode::childNodeWithName) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    if (!is_value_NSString(info[0])) {
      Nan::ThrowError("NSCNNode::childNodeWithName: expected first argument to be a string");
      return;
    }
    NSString* name(to_value_NSString(info[0]));
    bool recursively(info[1]->IsBoolean() ? TO_BOOL(info[1]) : false);
    [self childNodeWithName:name recursively:recursively];
  }
}

NAN_METHOD(NSCNNode::childNodesPassingTest) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    if (!info[0]->IsFunction()) {
      Nan::ThrowError("NSCNNode::childNodesPassingTest: expected first argument to be a function");
      return;
    }
  
    sweetiekit::JSFunction fn(info[0]);
    sweetiekit::JSEnumerateShouldStop shouldStop("NSCNNode::childNodesPassingTestCallbackStop");
    auto results([self childNodesPassingTest:^BOOL(SCNNode * _Nonnull child, BOOL * _Nonnull stop) {
      __block bool result = false;
      dispatch_main(^{
        result = TO_BOOL(fn("NSCNNode::childNodesPassingTestCallback", js_value_SCNNode(child), shouldStop));
        if (shouldStop) {
          *stop = true;
        }
      });
      return result;
    }]);
    JS_SET_RETURN(js_value_NSArray<SCNNode*>(results));
  }
}

NAN_METHOD(NSCNNode::enumerateChildNodes) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    if (!info[0]->IsFunction()) {
      Nan::ThrowError("NSCNNode::enumerateChildNodes: expected first argument to be a function");
      return;
    }
  
    sweetiekit::JSFunction fn(info[0]);
    sweetiekit::JSEnumerateShouldStop shouldStop("NSCNNode::enumerateChildNodesCallbackStop");
    [self enumerateChildNodesUsingBlock:^(SCNNode * _Nonnull child, BOOL * _Nonnull stop) {
      dispatch_main(^{
        fn("NSCNNode::enumerateChildNodesCallback", js_value_SCNNode(child), shouldStop);
        if (shouldStop) {
          *stop = true;
        }
      });  
    }];
  }
}

NAN_METHOD(NSCNNode::enumerateHierarchy) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    if (!info[0]->IsFunction()) {
      Nan::ThrowError("NSCNNode::enumerateHierarchy: expected first argument to be a function");
      return;
    }
  
    sweetiekit::JSFunction fn(info[0]);
    sweetiekit::JSEnumerateShouldStop shouldStop("NSCNNode::enumerateHierarchyCallbackStop");
    [self enumerateHierarchyUsingBlock:^(SCNNode * _Nonnull child, BOOL * _Nonnull stop) {
      dispatch_main(^{
        fn("NSCNNode::enumerateHierarchyCallback", js_value_SCNNode(child), shouldStop);
        if (shouldStop) {
          *stop = true;
        }
      });
    }];
  }
}

NAN_METHOD(NSCNNode::removeFromParentNode) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    [self removeFromParentNode];
  }
}

NAN_METHOD(NSCNNode::setWorldTransform) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    [self setWorldTransform:to_value_SCNMatrix4(info[0])];
  }
}

NAN_METHOD(NSCNNode::convertPositionToNode) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    SCNVector3 result([self convertPosition:to_value_SCNVector3(info[0]) toNode:to_value_SCNNode(info[1])]);
    JS_SET_RETURN(js_value_SCNVector3(result));
  }
}

NAN_METHOD(NSCNNode::convertPositionFromNode) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    SCNVector3 result([self convertPosition:to_value_SCNVector3(info[0]) fromNode:to_value_SCNNode(info[1])]);
    JS_SET_RETURN(js_value_SCNVector3(result));
  }
}

NAN_METHOD(NSCNNode::convertVectorToNode) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    SCNVector3 result([self convertVector:to_value_SCNVector3(info[0]) toNode:to_value_SCNNode(info[1])]);
    JS_SET_RETURN(js_value_SCNVector3(result));
  }
}

NAN_METHOD(NSCNNode::convertVectorFromNode) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    SCNVector3 result([self convertVector:to_value_SCNVector3(info[0]) fromNode:to_value_SCNNode(info[1])]);
    JS_SET_RETURN(js_value_SCNVector3(result));
  }
}

NAN_METHOD(NSCNNode::convertTransformToNode) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    SCNMatrix4 result([self convertTransform:to_value_SCNMatrix4(info[0]) toNode:to_value_SCNNode(info[1])]);
    JS_SET_RETURN(js_value_SCNMatrix4(result));
  }
}

NAN_METHOD(NSCNNode::convertTransformFromNode) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    SCNMatrix4 result([self convertTransform:to_value_SCNMatrix4(info[0]) fromNode:to_value_SCNNode(info[1])]);
    JS_SET_RETURN(js_value_SCNMatrix4(result));
  }
}

#include "NSCNHitTestResult.h"

NAN_METHOD(NSCNNode::hitTestWithSegmentFromPoint) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    SCNVector3 fromPoint(to_value_SCNVector3(info[0]));
    SCNVector3 toPoint(to_value_SCNVector3(info[1]));
    auto results([self hitTestWithSegmentFromPoint:fromPoint toPoint:toPoint options:nil]); // TODO: options
    JS_SET_RETURN(js_value_NSArray<SCNHitTestResult*>(results));
  }
}

NAN_METHOD(NSCNNode::lookAt) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    SCNVector3 up((info.Length() >= 2) ? to_value_SCNVector3(info[1]) : [self worldUp]);
    SCNVector3 localFront((info.Length() >= 3) ? to_value_SCNVector3(info[2]) : [SCNNode localFront]);
    [self lookAt:to_value_SCNVector3(info[0])
          up:up
          localFront:localFront];
  }
}

NAN_METHOD(NSCNNode::localTranslateBy) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    [self localTranslateBy:to_value_SCNVector3(info[0])];
  }
}

NAN_METHOD(NSCNNode::localRotateBy) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    [self localRotateBy:to_value_SCNQuaternion(info[0])];
  }
}

NAN_METHOD(NSCNNode::rotateBy) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    [self rotateBy:to_value_SCNQuaternion(info[0])
          aroundTarget:to_value_SCNVector3(info[1])];
  }
}

NAN_METHOD(NSCNNode::simdConvertPositionToNode) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    simd_float3 result([self simdConvertPosition:to_value_simd_float3(info[0]) toNode:to_value_SCNNode(info[1])]);
    JS_SET_RETURN(js_value_simd_float3(result));
  }
}

NAN_METHOD(NSCNNode::simdConvertPositionFromNode) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    simd_float3 result([self simdConvertPosition:to_value_simd_float3(info[0]) fromNode:to_value_SCNNode(info[1])]);
    JS_SET_RETURN(js_value_simd_float3(result));
  }
}

NAN_METHOD(NSCNNode::simdConvertVectorToNode) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    simd_float3 result([self simdConvertVector:to_value_simd_float3(info[0]) toNode:to_value_SCNNode(info[1])]);
    JS_SET_RETURN(js_value_simd_float3(result));
  }
}

NAN_METHOD(NSCNNode::simdConvertVectorFromNode) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    simd_float3 result([self simdConvertVector:to_value_simd_float3(info[0]) fromNode:to_value_SCNNode(info[1])]);
    JS_SET_RETURN(js_value_simd_float3(result));
  }
}

NAN_METHOD(NSCNNode::simdConvertTransformToNode) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    simd_float4x4 result([self simdConvertTransform:to_value_simd_float4x4(info[0]) toNode:to_value_SCNNode(info[1])]);
    JS_SET_RETURN(js_value_simd_float4x4(result));
  }
}

NAN_METHOD(NSCNNode::simdConvertTransformFromNode) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    simd_float4x4 result([self simdConvertTransform:to_value_simd_float4x4(info[0]) fromNode:to_value_SCNNode(info[1])]);
    JS_SET_RETURN(js_value_simd_float4x4(result));
  }
}

NAN_METHOD(NSCNNode::simdLookAt) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    simd_float3 up((info.Length() >= 2) ? to_value_simd_float3(info[1]) : [self simdWorldUp]);
    simd_float3 localFront((info.Length() >= 3) ? to_value_simd_float3(info[2]) : [SCNNode simdLocalFront]);
    [self simdLookAt:to_value_simd_float3(info[0])
          up:up
          localFront:localFront];
  }
}

NAN_METHOD(NSCNNode::simdLocalTranslateBy) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    [self simdLocalTranslateBy:to_value_simd_float3(info[0])];
  }
}

NAN_METHOD(NSCNNode::simdLocalRotateBy) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    [self simdLocalRotateBy:to_value_simd_quatf(info[0])];
  }
}

NAN_METHOD(NSCNNode::simdRotateBy) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool {
    [self simdRotateBy:to_value_simd_quatf(info[0])
          aroundTarget:to_value_simd_float3(info[1])];
  }
}

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

#include "NSCNLight.h"

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

#include "NSCNCamera.h"

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

#include "NSCNGeometry.h"

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

#include "NSCNPhysicsBody.h"

NAN_GETTER(NSCNNode::physicsBodyGetter) {
  JS_UNWRAP(SCNNode, self);
  @autoreleasepool
  {
    [self presentationNode];
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
