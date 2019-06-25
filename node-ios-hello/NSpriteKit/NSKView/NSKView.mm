//
//  NSKView.mm
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKView.h"

NSKView::NSKView() {}
NSKView::~NSKView() {}

JS_INIT_CLASS(SKView, UIView);
  JS_ASSIGN_PROTO_METHOD(presentScene);
  JS_ASSIGN_PROTO_METHOD(presentSceneTransition);
  JS_ASSIGN_PROTO_METHOD(textureFromNode);
  JS_ASSIGN_PROTO_METHOD(textureFromNodeCrop);
  JS_ASSIGN_PROTO_METHOD(convertPointToScene);
  JS_ASSIGN_PROTO_METHOD(convertPointFromScene);
  JS_ASSIGN_PROTO_PROP(isPaused);
  JS_ASSIGN_PROTO_PROP(showsFPS);
  JS_ASSIGN_PROTO_PROP(showsDrawCount);
  JS_ASSIGN_PROTO_PROP(showsNodeCount);
  JS_ASSIGN_PROTO_PROP(showsQuadCount);
  JS_ASSIGN_PROTO_PROP(showsPhysics);
  JS_ASSIGN_PROTO_PROP(showsFields);
  JS_ASSIGN_PROTO_PROP(isAsynchronous);
  JS_ASSIGN_PROTO_PROP(allowsTransparency);
  JS_ASSIGN_PROTO_PROP(ignoresSiblingOrder);
  JS_ASSIGN_PROTO_PROP(shouldCullNonVisibleNodes);
  JS_ASSIGN_PROTO_PROP(preferredFramesPerSecond);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(frameInterval);
  JS_ASSIGN_PROTO_PROP(preferredFrameRate);
  JS_ASSIGN_PROTO_PROP_READONLY(scene);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKView, UIView);
JS_INIT_CLASS_END(SKView, UIView);

NAN_METHOD(NSKView::New) {
  JS_RECONSTRUCT(SKView);
  @autoreleasepool {
    SKView* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge SKView *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[SKView alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[SKView alloc] init];
    }
    if (self) {
      NSKView *wrapper = new NSKView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SKView::New: invalid arguments");
    }
  }
}

#include "NSKScene.h"

NAN_METHOD(NSKView::presentScene) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(SKScene, scene);
    [self presentScene: scene];
  }
}

#include "NSKTransition.h"

NAN_METHOD(NSKView::presentSceneTransition) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKScene, scene);
    declare_pointer(SKTransition, transition);
    [self presentScene: scene transition: transition];
  }
}

#include "NSKTexture.h"

NAN_METHOD(NSKView::textureFromNode) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKNode, node);
    JS_SET_RETURN(js_value_SKTexture([self textureFromNode: node]));
  }
}

NAN_METHOD(NSKView::textureFromNodeCrop) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKNode, node);
    declare_value(CGRect, crop);
    JS_SET_RETURN(js_value_SKTexture([self textureFromNode: node crop: crop]));
  }
}

NAN_METHOD(NSKView::convertPointToScene) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_pointer(SKScene, scene);
    JS_SET_RETURN(js_value_CGPoint([self convertPoint: point toScene: scene]));
  }
}

NAN_METHOD(NSKView::convertPointFromScene) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_pointer(SKScene, scene);
    JS_SET_RETURN(js_value_CGPoint([self convertPoint: point fromScene: scene]));
  }
}

NAN_GETTER(NSKView::isPausedGetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPaused]));
  }
}

NAN_SETTER(NSKView::isPausedSetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPaused: input];
  }
}

NAN_GETTER(NSKView::showsFPSGetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsFPS]));
  }
}

NAN_SETTER(NSKView::showsFPSSetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsFPS: input];
  }
}

NAN_GETTER(NSKView::showsDrawCountGetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsDrawCount]));
  }
}

NAN_SETTER(NSKView::showsDrawCountSetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsDrawCount: input];
  }
}

NAN_GETTER(NSKView::showsNodeCountGetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsNodeCount]));
  }
}

NAN_SETTER(NSKView::showsNodeCountSetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsNodeCount: input];
  }
}

NAN_GETTER(NSKView::showsQuadCountGetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsQuadCount]));
  }
}

NAN_SETTER(NSKView::showsQuadCountSetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsQuadCount: input];
  }
}

NAN_GETTER(NSKView::showsPhysicsGetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsPhysics]));
  }
}

NAN_SETTER(NSKView::showsPhysicsSetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsPhysics: input];
  }
}

NAN_GETTER(NSKView::showsFieldsGetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsFields]));
  }
}

NAN_SETTER(NSKView::showsFieldsSetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsFields: input];
  }
}

NAN_GETTER(NSKView::isAsynchronousGetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAsynchronous]));
  }
}

NAN_SETTER(NSKView::isAsynchronousSetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAsynchronous: input];
  }
}

NAN_GETTER(NSKView::allowsTransparencyGetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsTransparency]));
  }
}

NAN_SETTER(NSKView::allowsTransparencySetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsTransparency: input];
  }
}

NAN_GETTER(NSKView::ignoresSiblingOrderGetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self ignoresSiblingOrder]));
  }
}

NAN_SETTER(NSKView::ignoresSiblingOrderSetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setIgnoresSiblingOrder: input];
  }
}

NAN_GETTER(NSKView::shouldCullNonVisibleNodesGetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldCullNonVisibleNodes]));
  }
}

NAN_SETTER(NSKView::shouldCullNonVisibleNodesSetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShouldCullNonVisibleNodes: input];
  }
}

NAN_GETTER(NSKView::preferredFramesPerSecondGetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self preferredFramesPerSecond]));
  }
}

NAN_SETTER(NSKView::preferredFramesPerSecondSetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setPreferredFramesPerSecond: input];
  }
}

NAN_GETTER(NSKView::delegateGetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSObject/* <SKViewDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NSKView::delegateSetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSObject/* <SKViewDelegate>*/, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"NSKView::delegate"];
  }
}

NAN_GETTER(NSKView::frameIntervalGetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self frameInterval]));
  }
}

NAN_SETTER(NSKView::frameIntervalSetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setFrameInterval: input];
  }
}

NAN_GETTER(NSKView::preferredFrameRateGetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self preferredFrameRate]));
  }
}

NAN_SETTER(NSKView::preferredFrameRateSetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setPreferredFrameRate: input];
  }
}

NAN_GETTER(NSKView::sceneGetter) {
  JS_UNWRAP(SKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKScene([self scene]));
  }
}
