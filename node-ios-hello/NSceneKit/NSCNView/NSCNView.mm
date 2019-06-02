//
//  NSCNView.mk
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNView.h"

NSCNView::NSCNView () {}
NSCNView::~NSCNView () {}

JS_INIT_CLASS(SCNView, UIView);
  // instance members (proto)
  JS_PROTO_METHOD(hitTest);
  JS_ASSIGN_PROP(proto, autoenablesDefaultLighting);
  JS_ASSIGN_PROP(proto, playing);
  JS_ASSIGN_PROP(proto, scene);
  JS_ASSIGN_PROP(proto, rendersContinuously);
  JS_ASSIGN_PROP(proto, allowsCameraControl);
  JS_ASSIGN_PROP_READONLY(proto, cameraControlConfiguration);
  JS_ASSIGN_PROP_READONLY(proto, defaultCameraController);
  JS_ASSIGN_PROP(proto, preferredFramesPerSecond);
  JS_ASSIGN_PROP(proto, eaglContext);
  JS_ASSIGN_PROP(proto, antialiasingMode);
  JS_PROTO_PROP(pointOfView);
  // static members (ctor)
  JS_INIT_CTOR(SCNView, UIView);
JS_INIT_CLASS_END(SCNView, UIView);

NAN_METHOD(NSCNView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSCNView *view = new NSCNView();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge SCNView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      CGRect frame = CGRectMake(x, y, width, height);
      view->SetNSObject([[SCNView alloc] initWithFrame:frame]);
    }
  } else {
    @autoreleasepool {
      view->SetNSObject([[SCNView alloc] init]);
    }
  }
  view->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_METHOD(NSCNView::hitTest) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool {
    CGPoint point(to_value_CGPoint(info[0]));
    NSArray<SCNHitTestResult*>* results = [self hitTest:point options:nil];
    JS_SET_RETURN(js_value_NSArray<SCNHitTestResult*>(results)); // TODO: options
  }
}

NAN_GETTER(NSCNView::autoenablesDefaultLightingGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self autoenablesDefaultLighting]));
    return;
  }
}

NAN_SETTER(NSCNView::autoenablesDefaultLightingSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setAutoenablesDefaultLighting: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNView::playingGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isPlaying]));
    return;
  }
}

NAN_SETTER(NSCNView::playingSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setPlaying: TO_BOOL(value)];
  }
}

#include "NSCNScene.h"

NAN_GETTER(NSCNView::sceneGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNScene([self scene]));
    return;
  }
}

NAN_SETTER(NSCNView::sceneSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setScene: to_value_SCNScene(value)];
  }
}

NAN_GETTER(NSCNView::rendersContinuouslyGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self rendersContinuously]));
    return;
  }
}

NAN_SETTER(NSCNView::rendersContinuouslySetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setRendersContinuously: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNView::allowsCameraControlGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self allowsCameraControl]));
    return;
  }
}

NAN_SETTER(NSCNView::allowsCameraControlSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setAllowsCameraControl: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNView::cameraControlConfigurationGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_id/*<SCNCameraControlConfiguration>*/([self cameraControlConfiguration]));
    return;
  }
}

#include "NSCNCameraController.h"

NAN_GETTER(NSCNView::defaultCameraControllerGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNCameraController([self defaultCameraController]));
    return;
  }
}

NAN_GETTER(NSCNView::preferredFramesPerSecondGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self preferredFramesPerSecond]));
    return;
  }
}

NAN_SETTER(NSCNView::preferredFramesPerSecondSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setPreferredFramesPerSecond: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNView::eaglContextGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_EAGLContext([self eaglContext]));
    return;
  }
}

NAN_SETTER(NSCNView::eaglContextSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setEaglContext: to_value_EAGLContext(value)];
  }
}

NAN_GETTER(NSCNView::antialiasingModeGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNAntialiasingMode([self antialiasingMode]));
    return;
  }
}

NAN_SETTER(NSCNView::antialiasingModeSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setAntialiasingMode: to_value_SCNAntialiasingMode(value)];
  }
}

#include "NSCNNode.h"

NAN_GETTER(NSCNView::pointOfViewGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNNode([self pointOfView]));
    return;
  }
}

NAN_SETTER(NSCNView::pointOfViewSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setPointOfView: to_value_SCNNode(value)];
  }
}
