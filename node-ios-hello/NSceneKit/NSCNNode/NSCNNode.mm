//
//  NSCNNode.mm
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNNode.h"

#define instancetype SCNNode
#define js_value_instancetype js_value_SCNNode

#import <SceneKit/SceneKit.h>
#import <SceneKit/ModelIO.h>

NSCNNode::NSCNNode () {}
NSCNNode::~NSCNNode () {}

JS_INIT_CLASS(SCNNode, NSObject);

  JS_ASSIGN_STATIC_METHOD(node);
  JS_ASSIGN_STATIC_METHOD(nodeWithGeometry);
  JS_ASSIGN_PROTO_METHOD(clone);
  JS_ASSIGN_PROTO_METHOD(flattenedClone);
  JS_ASSIGN_PROTO_METHOD(setWorldTransform);
  JS_ASSIGN_PROTO_METHOD(addChildNode);
  JS_ASSIGN_PROTO_METHOD(insertChildNodeAtIndex);
  JS_ASSIGN_PROTO_METHOD(removeFromParentNode);
  JS_ASSIGN_PROTO_METHOD(replaceChildNodeWith);
  JS_ASSIGN_PROTO_METHOD(childNodeWithNameRecursively);
  JS_ASSIGN_PROTO_METHOD(childNodesPassingTest);
  JS_ASSIGN_PROTO_METHOD(enumerateChildNodesUsingBlock);
  JS_ASSIGN_PROTO_METHOD(enumerateHierarchyUsingBlock);
  JS_ASSIGN_PROTO_METHOD(convertPositionToNode);
  JS_ASSIGN_PROTO_METHOD(convertPositionFromNode);
  JS_ASSIGN_PROTO_METHOD(convertVectorToNode);
  JS_ASSIGN_PROTO_METHOD(convertVectorFromNode);
  JS_ASSIGN_PROTO_METHOD(convertTransformToNode);
  JS_ASSIGN_PROTO_METHOD(convertTransformFromNode);
  JS_ASSIGN_PROTO_METHOD(hitTestWithSegmentFromPointToPointOptions);
  JS_ASSIGN_PROTO_METHOD(lookAt);
  JS_ASSIGN_PROTO_METHOD(lookAtUpLocalFront);
  JS_ASSIGN_PROTO_METHOD(localTranslateBy);
  JS_ASSIGN_PROTO_METHOD(localRotateBy);
  JS_ASSIGN_PROTO_METHOD(rotateByAroundTarget);
  JS_ASSIGN_PROTO_METHOD(simdConvertPositionToNode);
  JS_ASSIGN_PROTO_METHOD(simdConvertPositionFromNode);
  JS_ASSIGN_PROTO_METHOD(simdConvertVectorToNode);
  JS_ASSIGN_PROTO_METHOD(simdConvertVectorFromNode);
  JS_ASSIGN_PROTO_METHOD(simdConvertTransformToNode);
  JS_ASSIGN_PROTO_METHOD(simdConvertTransformFromNode);
  JS_ASSIGN_PROTO_METHOD(simdLookAt);
  JS_ASSIGN_PROTO_METHOD(simdLookAtUpLocalFront);
  JS_ASSIGN_PROTO_METHOD(simdLocalTranslateBy);
  JS_ASSIGN_PROTO_METHOD(simdLocalRotateBy);
  JS_ASSIGN_PROTO_METHOD(simdRotateByAroundTarget);
  JS_ASSIGN_PROTO_PROP(name);
  JS_ASSIGN_PROTO_PROP(light);
  JS_ASSIGN_PROTO_PROP(camera);
  JS_ASSIGN_PROTO_PROP(geometry);
  JS_ASSIGN_PROTO_PROP(skinner);
  JS_ASSIGN_PROTO_PROP(morpher);
  JS_ASSIGN_PROTO_PROP(transform);
  JS_ASSIGN_PROTO_PROP_READONLY(worldTransform);
  JS_ASSIGN_PROTO_PROP(position);
  JS_ASSIGN_PROTO_PROP(worldPosition);
  JS_ASSIGN_PROTO_PROP(rotation);
  JS_ASSIGN_PROTO_PROP(orientation);
  JS_ASSIGN_PROTO_PROP(worldOrientation);
  JS_ASSIGN_PROTO_PROP(eulerAngles);
  JS_ASSIGN_PROTO_PROP(scale);
  JS_ASSIGN_PROTO_PROP(pivot);
  JS_ASSIGN_PROTO_PROP(isHidden);
  JS_ASSIGN_PROTO_PROP(opacity);
  JS_ASSIGN_PROTO_PROP(renderingOrder);
  JS_ASSIGN_PROTO_PROP(castsShadow);
  JS_ASSIGN_PROTO_PROP(movabilityHint);
  JS_ASSIGN_PROTO_PROP_READONLY(parentNode);
  JS_ASSIGN_PROTO_PROP_READONLY(childNodes);
  JS_ASSIGN_PROTO_PROP(physicsBody);
  JS_ASSIGN_PROTO_PROP(physicsField);
  JS_ASSIGN_PROTO_PROP(constraints);
  JS_ASSIGN_PROTO_PROP(filters);
  JS_ASSIGN_PROTO_PROP_READONLY(presentationNode);
  JS_ASSIGN_PROTO_PROP(isPaused);
  JS_ASSIGN_PROTO_PROP(rendererDelegate);
  JS_ASSIGN_PROTO_PROP(categoryBitMask);
  JS_ASSIGN_PROTO_PROP(focusBehavior);
  JS_ASSIGN_STATIC_PROP_READONLY(localUp);
  JS_ASSIGN_STATIC_PROP_READONLY(localRight);
  JS_ASSIGN_STATIC_PROP_READONLY(localFront);
  JS_ASSIGN_PROTO_PROP_READONLY(worldUp);
  JS_ASSIGN_PROTO_PROP_READONLY(worldRight);
  JS_ASSIGN_PROTO_PROP_READONLY(worldFront);
  JS_ASSIGN_PROTO_PROP(simdTransform);
  JS_ASSIGN_PROTO_PROP(simdPosition);
  JS_ASSIGN_PROTO_PROP(simdRotation);
  JS_ASSIGN_PROTO_PROP(simdOrientation);
  JS_ASSIGN_PROTO_PROP(simdEulerAngles);
  JS_ASSIGN_PROTO_PROP(simdScale);
  JS_ASSIGN_PROTO_PROP(simdPivot);
  JS_ASSIGN_PROTO_PROP(simdWorldPosition);
  JS_ASSIGN_PROTO_PROP(simdWorldOrientation);
  JS_ASSIGN_PROTO_PROP(simdWorldTransform);
  JS_ASSIGN_STATIC_PROP_READONLY(simdLocalUp);
  JS_ASSIGN_STATIC_PROP_READONLY(simdLocalRight);
  JS_ASSIGN_STATIC_PROP_READONLY(simdLocalFront);
  JS_ASSIGN_PROTO_PROP_READONLY(simdWorldUp);
  JS_ASSIGN_PROTO_PROP_READONLY(simdWorldRight);
  JS_ASSIGN_PROTO_PROP_READONLY(simdWorldFront);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNNode, NSObject);
  JS_ASSIGN_STATIC_METHOD(nodeWithMDLObject);
  // constants (exports)

  JS_ASSIGN_ENUM(SCNModelTransform, NSString);
  JS_ASSIGN_ENUM(SCNViewTransform, NSString);
  JS_ASSIGN_ENUM(SCNProjectionTransform, NSString);
  JS_ASSIGN_ENUM(SCNNormalTransform, NSString);
  JS_ASSIGN_ENUM(SCNModelViewTransform, NSString);
  JS_ASSIGN_ENUM(SCNModelViewProjectionTransform, NSString);

  //typedef NS_ENUM(NSInteger, SCNMovabilityHint) {
    JS_ASSIGN_ENUM(SCNMovabilityHintFixed, NSInteger);
    JS_ASSIGN_ENUM(SCNMovabilityHintMovable, NSInteger);
  //} API_AVAILABLE(macos(10.12), ios(10.0), tvos(10.0));

  //typedef NS_ENUM(NSInteger, SCNNodeFocusBehavior) {
    JS_ASSIGN_ENUM(SCNNodeFocusBehaviorNone, NSInteger); // = 0,    
    JS_ASSIGN_ENUM(SCNNodeFocusBehaviorOccluding, NSInteger);
    JS_ASSIGN_ENUM(SCNNodeFocusBehaviorFocusable, NSInteger);
  //} API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(4.0));

JS_INIT_CLASS_END(SCNNode, NSObject);

#include "NSCNGeometry.h"
#include "NMDLObject.h"

NAN_METHOD(NSCNNode::New) {
  JS_RECONSTRUCT(SCNNode);
  @autoreleasepool {
    SCNNode* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNNode *)(info[0].As<External>()->Value());
    } else if (is_value_SCNGeometry(info[0])) {
      self = [SCNNode nodeWithGeometry:to_value_SCNGeometry(info[0])];
    } else if (is_value_MDLObject(info[0])) {
      self = [SCNNode nodeWithMDLObject:to_value_MDLObject(info[0])];
    } else if (info.Length() <= 0) {
      self = [[SCNNode alloc] init];
    }
    if (self) {
      NSCNNode *wrapper = new NSCNNode();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNNode::New: invalid arguments");
    }
  }
}

NAN_METHOD(NSCNNode::node) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([SCNNode node]));
  }
}

NAN_METHOD(NSCNNode::nodeWithGeometry) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(SCNGeometry, geometry);
    JS_SET_RETURN(js_value_SCNNode([SCNNode nodeWithGeometry: geometry]));
  }
}

NAN_METHOD(NSCNNode::clone) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([self clone]));
  }
}

NAN_METHOD(NSCNNode::flattenedClone) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([self flattenedClone]));
  }
}

NAN_METHOD(NSCNNode::setWorldTransform) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNMatrix4, worldTransform);
    [self setWorldTransform: worldTransform];
  }
}

NAN_METHOD(NSCNNode::addChildNode) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNNode, child);
    [self addChildNode: child];
  }
}

NAN_METHOD(NSCNNode::insertChildNodeAtIndex) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNNode, child);
    declare_value(NSUInteger, index);
    [self insertChildNode: child atIndex: index];
  }
}

NAN_METHOD(NSCNNode::removeFromParentNode) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    [self removeFromParentNode];
  }
}

NAN_METHOD(NSCNNode::replaceChildNodeWith) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNNode, oldChild);
    declare_pointer(SCNNode, newChild);
    [self replaceChildNode: oldChild with: newChild];
  }
}

NAN_METHOD(NSCNNode::childNodeWithNameRecursively) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(BOOL, recursively);
    JS_SET_RETURN(js_value_SCNNode([self childNodeWithName: name recursively: recursively]));
  }
}

NAN_METHOD(NSCNNode::childNodesPassingTest) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(predicate);
    JS_SET_RETURN(js_value_NSArray<SCNNode*>([self childNodesPassingTest:^BOOL(SCNNode * _Nonnull child, BOOL * _Nonnull stop) {
      __block BOOL result = YES;
      dispatch_main(^{
        if (predicate) {
          Local<Object> JS_STOP(Nan::New<Object>());
          JS_STOP->Set(JS_STR("stop"), js_value_BOOL(*stop));
          Local<Value> JS_RESULT([predicate jsFunction]->Call("NSCNNode::childNodesPassingTest",
            js_value_SCNNode(child),
            JS_STOP));
          if (is_value_BOOL(JS_STOP->Get(JS_STR("stop")))) {
            *stop = to_value_BOOL(JS_STOP->Get(JS_STR("stop")));
          }
          if (JS_RESULT->IsNullOrUndefined()) {
            result = NO;
          } else if (is_value_BOOL(JS_RESULT)) {
            result = to_value_BOOL(JS_RESULT);
          } else {
            js_panic_noreturn("Expected a BOOL return value");
            *stop = YES;
          }
        }
      });
      return result;
    }]));
    clear_callback(predicate);
  }
}

NAN_METHOD(NSCNNode::enumerateChildNodesUsingBlock) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(block);
    [self enumerateChildNodesUsingBlock:^(SCNNode * _Nonnull child, BOOL * _Nonnull stop) {
      dispatch_main(^{
      });
    }];
    clear_callback(block);
  }
}

NAN_METHOD(NSCNNode::enumerateHierarchyUsingBlock) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(block);
    [self enumerateHierarchyUsingBlock:^(SCNNode * _Nonnull node, BOOL * _Nonnull stop) {
      dispatch_main(^{
      });
    }];
    clear_callback(block);
  }
}

NAN_METHOD(NSCNNode::convertPositionToNode) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNVector3, position);
    declare_nullable_pointer(SCNNode, node);
    JS_SET_RETURN(js_value_SCNVector3([self convertPosition: position toNode: node]));
  }
}

NAN_METHOD(NSCNNode::convertPositionFromNode) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNVector3, position);
    declare_nullable_pointer(SCNNode, node);
    JS_SET_RETURN(js_value_SCNVector3([self convertPosition: position fromNode: node]));
  }
}

NAN_METHOD(NSCNNode::convertVectorToNode) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNVector3, vector);
    declare_nullable_pointer(SCNNode, node);
    JS_SET_RETURN(js_value_SCNVector3([self convertVector: vector toNode: node]));
  }
}

NAN_METHOD(NSCNNode::convertVectorFromNode) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNVector3, vector);
    declare_nullable_pointer(SCNNode, node);
    JS_SET_RETURN(js_value_SCNVector3([self convertVector: vector fromNode: node]));
  }
}

NAN_METHOD(NSCNNode::convertTransformToNode) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNMatrix4, transform);
    declare_nullable_pointer(SCNNode, node);
    JS_SET_RETURN(js_value_SCNMatrix4([self convertTransform: transform toNode: node]));
  }
}

NAN_METHOD(NSCNNode::convertTransformFromNode) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNMatrix4, transform);
    declare_nullable_pointer(SCNNode, node);
    JS_SET_RETURN(js_value_SCNMatrix4([self convertTransform: transform fromNode: node]));
  }
}

#include "NSCNHitTestResult.h"

NAN_METHOD(NSCNNode::hitTestWithSegmentFromPointToPointOptions) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNVector3, pointA);
    declare_value(SCNVector3, pointB);
    declare_nullable_pointer(NSDictionary/* <NSString*, id>*/, options);
    JS_SET_RETURN(js_value_NSArray<SCNHitTestResult*>([self hitTestWithSegmentFromPoint: pointA toPoint: pointB options: options]));
  }
}

NAN_METHOD(NSCNNode::lookAt) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNVector3, worldTarget);
    [self lookAt: worldTarget];
  }
}

NAN_METHOD(NSCNNode::lookAtUpLocalFront) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNVector3, worldTarget);
    declare_value(SCNVector3, worldUp);
    declare_value(SCNVector3, localFront);
    [self lookAt: worldTarget up: worldUp localFront: localFront];
  }
}

NAN_METHOD(NSCNNode::localTranslateBy) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNVector3, translation);
    [self localTranslateBy: translation];
  }
}

NAN_METHOD(NSCNNode::localRotateBy) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNQuaternion, rotation);
    [self localRotateBy: rotation];
  }
}

NAN_METHOD(NSCNNode::rotateByAroundTarget) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNQuaternion, worldRotation);
    declare_value(SCNVector3, worldTarget);
    [self rotateBy: worldRotation aroundTarget: worldTarget];
  }
}

NAN_METHOD(NSCNNode::simdConvertPositionToNode) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_float3, position);
    declare_nullable_pointer(SCNNode, node);
    JS_SET_RETURN(js_value_simd_float3([self simdConvertPosition: position toNode: node]));
  }
}

NAN_METHOD(NSCNNode::simdConvertPositionFromNode) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_float3, position);
    declare_nullable_pointer(SCNNode, node);
    JS_SET_RETURN(js_value_simd_float3([self simdConvertPosition: position fromNode: node]));
  }
}

NAN_METHOD(NSCNNode::simdConvertVectorToNode) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_float3, vector);
    declare_nullable_pointer(SCNNode, node);
    JS_SET_RETURN(js_value_simd_float3([self simdConvertVector: vector toNode: node]));
  }
}

NAN_METHOD(NSCNNode::simdConvertVectorFromNode) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_float3, vector);
    declare_nullable_pointer(SCNNode, node);
    JS_SET_RETURN(js_value_simd_float3([self simdConvertVector: vector fromNode: node]));
  }
}

NAN_METHOD(NSCNNode::simdConvertTransformToNode) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_float4x4, transform);
    declare_nullable_pointer(SCNNode, node);
    JS_SET_RETURN(js_value_simd_float4x4([self simdConvertTransform: transform toNode: node]));
  }
}

NAN_METHOD(NSCNNode::simdConvertTransformFromNode) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_float4x4, transform);
    declare_nullable_pointer(SCNNode, node);
    JS_SET_RETURN(js_value_simd_float4x4([self simdConvertTransform: transform fromNode: node]));
  }
}

NAN_METHOD(NSCNNode::simdLookAt) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_float3, worldTarget);
    [self simdLookAt: worldTarget];
  }
}

NAN_METHOD(NSCNNode::simdLookAtUpLocalFront) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_float3, worldTarget);
    declare_value(simd_float3, worldUp);
    declare_value(simd_float3, localFront);
    [self simdLookAt: worldTarget up: worldUp localFront: localFront];
  }
}

NAN_METHOD(NSCNNode::simdLocalTranslateBy) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_float3, translation);
    [self simdLocalTranslateBy: translation];
  }
}

NAN_METHOD(NSCNNode::simdLocalRotateBy) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_quatf, rotation);
    [self simdLocalRotateBy: rotation];
  }
}

NAN_METHOD(NSCNNode::simdRotateByAroundTarget) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_quatf, worldRotation);
    declare_value(simd_float3, worldTarget);
    [self simdRotateBy: worldRotation aroundTarget: worldTarget];
  }
}

NAN_GETTER(NSCNNode::nameGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NSCNNode::nameSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}

#include "NSCNLight.h"

NAN_GETTER(NSCNNode::lightGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNLight([self light]));
  }
}

NAN_SETTER(NSCNNode::lightSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNLight, input);
    [self setLight: input];
  }
}

#include "NSCNCamera.h"

NAN_GETTER(NSCNNode::cameraGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNCamera([self camera]));
  }
}

NAN_SETTER(NSCNNode::cameraSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNCamera, input);
    [self setCamera: input];
  }
}

NAN_GETTER(NSCNNode::geometryGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNGeometry([self geometry]));
  }
}

#include "NSCNGeometry.h"

NAN_SETTER(NSCNNode::geometrySetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNGeometry, input);
    [self setGeometry: input];
  }
}

#include "NSCNSkinner.h"

NAN_GETTER(NSCNNode::skinnerGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNSkinner([self skinner]));
  }
}

NAN_SETTER(NSCNNode::skinnerSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNSkinner, input);
    [self setSkinner: input];
  }
}

#include "NSCNMorpher.h"

NAN_GETTER(NSCNNode::morpherGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNMorpher([self morpher]));
  }
}

NAN_SETTER(NSCNNode::morpherSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNMorpher, input);
    [self setMorpher: input];
  }
}

NAN_GETTER(NSCNNode::transformGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNMatrix4([self transform]));
  }
}

NAN_SETTER(NSCNNode::transformSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNMatrix4, input);
    [self setTransform: input];
  }
}

NAN_GETTER(NSCNNode::worldTransformGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNMatrix4([self worldTransform]));
  }
}

NAN_GETTER(NSCNNode::positionGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self position]));
  }
}

NAN_SETTER(NSCNNode::positionSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setPosition: input];
  }
}

NAN_GETTER(NSCNNode::worldPositionGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self worldPosition]));
  }
}

NAN_SETTER(NSCNNode::worldPositionSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setWorldPosition: input];
  }
}

NAN_GETTER(NSCNNode::rotationGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector4([self rotation]));
  }
}

NAN_SETTER(NSCNNode::rotationSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector4, input);
    [self setRotation: input];
  }
}

NAN_GETTER(NSCNNode::orientationGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNQuaternion([self orientation]));
  }
}

NAN_SETTER(NSCNNode::orientationSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNQuaternion, input);
    [self setOrientation: input];
  }
}

NAN_GETTER(NSCNNode::worldOrientationGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNQuaternion([self worldOrientation]));
  }
}

NAN_SETTER(NSCNNode::worldOrientationSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNQuaternion, input);
    [self setWorldOrientation: input];
  }
}

NAN_GETTER(NSCNNode::eulerAnglesGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self eulerAngles]));
  }
}

NAN_SETTER(NSCNNode::eulerAnglesSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setEulerAngles: input];
  }
}

NAN_GETTER(NSCNNode::scaleGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self scale]));
  }
}

NAN_SETTER(NSCNNode::scaleSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setScale: input];
  }
}

NAN_GETTER(NSCNNode::pivotGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNMatrix4([self pivot]));
  }
}

NAN_SETTER(NSCNNode::pivotSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNMatrix4, input);
    [self setPivot: input];
  }
}

NAN_GETTER(NSCNNode::isHiddenGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isHidden]));
  }
}

NAN_SETTER(NSCNNode::isHiddenSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidden: input];
  }
}

NAN_GETTER(NSCNNode::opacityGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self opacity]));
  }
}

NAN_SETTER(NSCNNode::opacitySetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setOpacity: input];
  }
}

NAN_GETTER(NSCNNode::renderingOrderGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self renderingOrder]));
  }
}

NAN_SETTER(NSCNNode::renderingOrderSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setRenderingOrder: input];
  }
}

NAN_GETTER(NSCNNode::castsShadowGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self castsShadow]));
  }
}

NAN_SETTER(NSCNNode::castsShadowSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setCastsShadow: input];
  }
}

NAN_GETTER(NSCNNode::movabilityHintGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNMovabilityHint([self movabilityHint]));
  }
}

NAN_SETTER(NSCNNode::movabilityHintSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNMovabilityHint, input);
    [self setMovabilityHint: input];
  }
}

NAN_GETTER(NSCNNode::parentNodeGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNNode([self parentNode]));
  }
}

NAN_GETTER(NSCNNode::childNodesGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SCNNode*>([self childNodes]));
  }
}

#include "NSCNPhysicsBody.h"

NAN_GETTER(NSCNNode::physicsBodyGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsBody([self physicsBody]));
  }
}

NAN_SETTER(NSCNNode::physicsBodySetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNPhysicsBody, input);
    [self setPhysicsBody: input];
  }
}

#include "NSCNPhysicsField.h"

NAN_GETTER(NSCNNode::physicsFieldGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsField([self physicsField]));
  }
}

NAN_SETTER(NSCNNode::physicsFieldSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNPhysicsField, input);
    [self setPhysicsField: input];
  }
}

NAN_GETTER(NSCNNode::constraintsGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SCNConstraint*>([self constraints]));
  }
}

NAN_SETTER(NSCNNode::constraintsSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<SCNConstraint*>, input);
    [self setConstraints: input];
  }
}

NAN_GETTER(NSCNNode::filtersGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<CIFilter*>([self filters]));
  }
}

NAN_SETTER(NSCNNode::filtersSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<CIFilter*>, input);
    [self setFilters: input];
  }
}

NAN_GETTER(NSCNNode::presentationNodeGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNNode([self presentationNode]));
  }
}

NAN_GETTER(NSCNNode::isPausedGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPaused]));
  }
}

NAN_SETTER(NSCNNode::isPausedSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPaused: input];
  }
}

#include "NSCNNodeRendererDelegate.h"

NAN_GETTER(NSCNNode::rendererDelegateGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNNodeRendererDelegate([self rendererDelegate]));
  }
}

NAN_SETTER(NSCNNode::rendererDelegateSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(SCNNodeRendererDelegate, input);
    [self setRendererDelegate: input];
    [self associateValue:input withKey:@"NSCNNode::rendererDelegate"];
  }
}

NAN_GETTER(NSCNNode::categoryBitMaskGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self categoryBitMask]));
  }
}

NAN_SETTER(NSCNNode::categoryBitMaskSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setCategoryBitMask: input];
  }
}

NAN_GETTER(NSCNNode::focusBehaviorGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNNodeFocusBehavior([self focusBehavior]));
  }
}

NAN_SETTER(NSCNNode::focusBehaviorSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNNodeFocusBehavior, input);
    [self setFocusBehavior: input];
  }
}

NAN_GETTER(NSCNNode::localUpGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([SCNNode localUp]));
  }
}

NAN_GETTER(NSCNNode::localRightGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([SCNNode localRight]));
  }
}

NAN_GETTER(NSCNNode::localFrontGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([SCNNode localFront]));
  }
}

NAN_GETTER(NSCNNode::worldUpGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self worldUp]));
  }
}

NAN_GETTER(NSCNNode::worldRightGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self worldRight]));
  }
}

NAN_GETTER(NSCNNode::worldFrontGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self worldFront]));
  }
}

NAN_GETTER(NSCNNode::simdTransformGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float4x4([self simdTransform]));
  }
}

NAN_SETTER(NSCNNode::simdTransformSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(simd_float4x4, input);
    [self setSimdTransform: input];
  }
}

NAN_GETTER(NSCNNode::simdPositionGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([self simdPosition]));
  }
}

NAN_SETTER(NSCNNode::simdPositionSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(simd_float3, input);
    [self setSimdPosition: input];
  }
}

NAN_GETTER(NSCNNode::simdRotationGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float4([self simdRotation]));
  }
}

NAN_SETTER(NSCNNode::simdRotationSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(simd_float4, input);
    [self setSimdRotation: input];
  }
}

NAN_GETTER(NSCNNode::simdOrientationGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_quatf([self simdOrientation]));
  }
}

NAN_SETTER(NSCNNode::simdOrientationSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(simd_quatf, input);
    [self setSimdOrientation: input];
  }
}

NAN_GETTER(NSCNNode::simdEulerAnglesGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([self simdEulerAngles]));
  }
}

NAN_SETTER(NSCNNode::simdEulerAnglesSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(simd_float3, input);
    [self setSimdEulerAngles: input];
  }
}

NAN_GETTER(NSCNNode::simdScaleGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([self simdScale]));
  }
}

NAN_SETTER(NSCNNode::simdScaleSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(simd_float3, input);
    [self setSimdScale: input];
  }
}

NAN_GETTER(NSCNNode::simdPivotGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float4x4([self simdPivot]));
  }
}

NAN_SETTER(NSCNNode::simdPivotSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(simd_float4x4, input);
    [self setSimdPivot: input];
  }
}

NAN_GETTER(NSCNNode::simdWorldPositionGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([self simdWorldPosition]));
  }
}

NAN_SETTER(NSCNNode::simdWorldPositionSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(simd_float3, input);
    [self setSimdWorldPosition: input];
  }
}

NAN_GETTER(NSCNNode::simdWorldOrientationGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_quatf([self simdWorldOrientation]));
  }
}

NAN_SETTER(NSCNNode::simdWorldOrientationSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(simd_quatf, input);
    [self setSimdWorldOrientation: input];
  }
}

NAN_GETTER(NSCNNode::simdWorldTransformGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float4x4([self simdWorldTransform]));
  }
}

NAN_SETTER(NSCNNode::simdWorldTransformSetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(simd_float4x4, input);
    [self setSimdWorldTransform: input];
  }
}

NAN_GETTER(NSCNNode::simdLocalUpGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([SCNNode simdLocalUp]));
  }
}

NAN_GETTER(NSCNNode::simdLocalRightGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([SCNNode simdLocalRight]));
  }
}

NAN_GETTER(NSCNNode::simdLocalFrontGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([SCNNode simdLocalFront]));
  }
}

NAN_GETTER(NSCNNode::simdWorldUpGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([self simdWorldUp]));
  }
}

NAN_GETTER(NSCNNode::simdWorldRightGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([self simdWorldRight]));
  }
}

NAN_GETTER(NSCNNode::simdWorldFrontGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([self simdWorldFront]));
  }
}

#include <SceneKit/ModelIO.h>
#include "NMDLObject.h"

NAN_METHOD(NSCNNode::nodeWithMDLObject) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLObject, mdlObject);
    JS_SET_RETURN(js_value_instancetype([SCNNode nodeWithMDLObject: mdlObject]));
  }
}
