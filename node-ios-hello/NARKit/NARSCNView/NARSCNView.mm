//
//  NARSCNView.mm
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARSCNView.h"

#if TARGET_OS_IPHONE

#define instancetype ARSCNView
#define js_value_instancetype js_value_ARSCNView

NARSCNView::NARSCNView () {}
NARSCNView::~NARSCNView () {}

JS_INIT_CLASS(ARSCNView, SCNView);
  JS_ASSIGN_PROTO_METHOD(anchorForNode);
  JS_ASSIGN_PROTO_METHOD(nodeForAnchor);
  JS_ASSIGN_PROTO_METHOD(hitTestTypes);
  JS_ASSIGN_PROTO_METHOD(unprojectPointOntoPlaneWithTransform);
  JS_ASSIGN_PROTO_METHOD(raycastQueryFromPointAllowingTargetAlignment);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(session);
  JS_ASSIGN_PROTO_PROP(scene);
  JS_ASSIGN_PROTO_PROP(automaticallyUpdatesLighting);
  JS_ASSIGN_PROTO_PROP(rendersCameraGrain);
  JS_ASSIGN_PROTO_PROP(rendersMotionBlur);

  JS_ASSIGN_PROTO_METHOD(hitTest);
  JS_ASSIGN_PROTO_METHOD(presentScene);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARSCNView, SCNView);

  // constants (exports)

JS_INIT_CLASS_END(ARSCNView, SCNView);

NAN_METHOD(NARSCNView::New) {
  JS_RECONSTRUCT(ARSCNView);
  @autoreleasepool {
    ARSCNView* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARSCNView *)(info[0].As<External>()->Value());
    } else if (info.Length() > 0 && is_value_CGRect(info[0])) {
      CGRect frame(to_value_CGRect(info[0]));
      self = [[ARSCNView alloc] initWithFrame:frame];
    } else if (info.Length() <= 0) {
      self = [[ARSCNView alloc] init];
    }
    if (self) {
      NARSCNView *wrapper = new NARSCNView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARSCNView::New: invalid arguments");
    }
  }
}

#include "NSCNNode.h"
#include "NARAnchor.h"

NAN_METHOD(NARSCNView::anchorForNode) {
  JS_UNWRAP(ARSCNView, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_ARAnchor([self anchorForNode:to_value_SCNNode(info[0])]));
  }
}

NAN_METHOD(NARSCNView::nodeForAnchor) {
  JS_UNWRAP(ARSCNView, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_SCNNode([self nodeForAnchor:to_value_ARAnchor(info[0])]));
  }
}

#include "NARHitTestResult.h"

NAN_METHOD(NARSCNView::hitTestTypes) {
  JS_UNWRAP(ARSCNView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_value(ARHitTestResultType, types);
    JS_SET_RETURN(js_value_NSArray<ARHitTestResult*>([self hitTest: point types: types]));
  }
}

NAN_METHOD(NARSCNView::unprojectPointOntoPlaneWithTransform) {
  JS_UNWRAP(ARSCNView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_value(simd_float4x4, planeTransform);
    JS_SET_RETURN(js_value_simd_float3([self unprojectPoint: point ontoPlaneWithTransform: planeTransform]));
  }
}

#include "NARRaycastQuery.h"

NAN_METHOD(NARSCNView::raycastQueryFromPointAllowingTargetAlignment) {
  JS_UNWRAP(ARSCNView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_value(ARRaycastTarget, target);
    declare_value(ARRaycastTargetAlignment, alignment);
    JS_SET_RETURN(js_value_ARRaycastQuery([self raycastQueryFromPoint: point allowingTarget: target alignment: alignment]));
  }
}

#include "NARHitTestResult.h"

NAN_METHOD(NARSCNView::hitTest) {
  JS_UNWRAP(ARSCNView, self);
  @autoreleasepool {
    if (is_value_CGPoint(info[0]) && is_value_ARHitTestResultType(info[1])) {
      CGPoint point(to_value_CGPoint(info[0]));
      ARHitTestResultType types(to_value_ARHitTestResultType(info[1]));
      NSArray<ARHitTestResult*>* results = [self hitTest:point types:types];
      JS_SET_RETURN(js_value_NSArray<ARHitTestResult*>(results));
    } else {
      return NSCNView::hitTest(info);
    }
  }
}

#include "NSCNScene.h"

NAN_METHOD(NARSCNView::presentScene) {
  JS_UNWRAP(ARSCNView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNScene, scene);
    
    SKTransition *transition = [SKTransition fadeWithDuration:0.2];
    [self presentScene:scene withTransition:transition incomingPointOfView:nullptr completionHandler: ^ {
      printf("transitioned to scene");
    }];
  }
}

#include "NARSCNViewDelegate.h"

NAN_GETTER(NARSCNView::delegateGetter) {
  JS_UNWRAP(ARSCNView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARSCNViewDelegate([self delegate]));
  }
}

NAN_SETTER(NARSCNView::delegateSetter) {
  JS_UNWRAP(ARSCNView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(ARSCNViewDelegate, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"NARSCNView::delegate"];
  }
}

#include "NARSession.h"

NAN_GETTER(NARSCNView::sessionGetter) {
  JS_UNWRAP(ARSCNView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARSession([self session]));
  }
}

NAN_SETTER(NARSCNView::sessionSetter) {
  JS_UNWRAP(ARSCNView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(ARSession, input);
    [self setSession: input];
    [self associateValue:input withKey:@"NARSCNView::session"];
  }
}

NAN_GETTER(NARSCNView::sceneGetter) {
  JS_UNWRAP(ARSCNView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNScene([self scene]));
  }
}

NAN_SETTER(NARSCNView::sceneSetter) {
  JS_UNWRAP(ARSCNView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNScene, input);
    [self setScene: input];
    [self associateValue:input withKey:@"NARSCNView::scene"];
  }
}

NAN_GETTER(NARSCNView::automaticallyUpdatesLightingGetter) {
  JS_UNWRAP(ARSCNView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self automaticallyUpdatesLighting]));
  }
}

NAN_SETTER(NARSCNView::automaticallyUpdatesLightingSetter) {
  JS_UNWRAP(ARSCNView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutomaticallyUpdatesLighting: input];
  }
}

NAN_GETTER(NARSCNView::rendersCameraGrainGetter) {
  JS_UNWRAP(ARSCNView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self rendersCameraGrain]));
  }
}

NAN_SETTER(NARSCNView::rendersCameraGrainSetter) {
  JS_UNWRAP(ARSCNView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setRendersCameraGrain: input];
  }
}

NAN_GETTER(NARSCNView::rendersMotionBlurGetter) {
  JS_UNWRAP(ARSCNView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self rendersMotionBlur]));
  }
}

NAN_SETTER(NARSCNView::rendersMotionBlurSetter) {
  JS_UNWRAP(ARSCNView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setRendersMotionBlur: input];
  }
}

#endif
