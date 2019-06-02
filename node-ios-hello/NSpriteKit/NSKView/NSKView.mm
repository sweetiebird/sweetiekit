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
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, presentScene);
  JS_ASSIGN_PROP(proto, paused);
  JS_ASSIGN_PROP(proto, showsFPS);
  JS_ASSIGN_PROP(proto, showsDrawCount);
  JS_ASSIGN_PROP(proto, showsNodeCount);
  JS_ASSIGN_PROP(proto, showsQuadCount);
  JS_ASSIGN_PROP(proto, showsPhysics);
  JS_ASSIGN_PROP(proto, showsFields);
  JS_ASSIGN_PROP(proto, asynchronous);
  JS_ASSIGN_PROP(proto, allowsTransparency);
  JS_ASSIGN_PROP(proto, ignoresSiblingOrder);
  JS_ASSIGN_PROP(proto, shouldCullNonVisibleNodes);
  JS_ASSIGN_PROP(proto, preferredFramesPerSecond);
  JS_ASSIGN_PROP(proto, delegate);
  JS_ASSIGN_PROP(proto, frameInterval);
  JS_ASSIGN_PROP(proto, preferredFrameRate);
  JS_ASSIGN_PROP_READONLY(proto, scene);
  // static members (ctor)
  JS_INIT_CTOR(SKView, UIView);
JS_INIT_CLASS_END(SKView, UIView);

NAN_METHOD(NSKView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKView *view = new NSKView();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge SKView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      CGRect frame = CGRectMake(x, y, width, height);
      view->SetNSObject([[SKView alloc] initWithFrame:frame]);
    }
  } else {
    @autoreleasepool {
      view->SetNSObject([[SKView alloc] init]);
    }
  }
  view->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

#include "NSKScene.h"

NAN_METHOD(NSKView::presentScene) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(SKView, ui);
  
  NSKScene *scene = ObjectWrap::Unwrap<NSKScene>(Local<Object>::Cast(info[0]));
  
  [ui presentScene:scene->As<SKScene>()];
}

NAN_GETTER(NSKView::pausedGetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isPaused]));
    return;
  }
}

NAN_SETTER(NSKView::pausedSetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    [self setPaused: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKView::showsFPSGetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self showsFPS]));
    return;
  }
}

NAN_SETTER(NSKView::showsFPSSetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    [self setShowsFPS: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKView::showsDrawCountGetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self showsDrawCount]));
    return;
  }
}

NAN_SETTER(NSKView::showsDrawCountSetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    [self setShowsDrawCount: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKView::showsNodeCountGetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self showsNodeCount]));
    return;
  }
}

NAN_SETTER(NSKView::showsNodeCountSetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    [self setShowsNodeCount: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKView::showsQuadCountGetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self showsQuadCount]));
    return;
  }
}

NAN_SETTER(NSKView::showsQuadCountSetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    [self setShowsQuadCount: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKView::showsPhysicsGetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self showsPhysics]));
    return;
  }
}

NAN_SETTER(NSKView::showsPhysicsSetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    [self setShowsPhysics: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKView::showsFieldsGetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self showsFields]));
    return;
  }
}

NAN_SETTER(NSKView::showsFieldsSetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    [self setShowsFields: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKView::asynchronousGetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isAsynchronous]));
    return;
  }
}

NAN_SETTER(NSKView::asynchronousSetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    [self setAsynchronous: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKView::allowsTransparencyGetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self allowsTransparency]));
    return;
  }
}

NAN_SETTER(NSKView::allowsTransparencySetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    [self setAllowsTransparency: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKView::ignoresSiblingOrderGetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self ignoresSiblingOrder]));
    return;
  }
}

NAN_SETTER(NSKView::ignoresSiblingOrderSetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    [self setIgnoresSiblingOrder: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKView::shouldCullNonVisibleNodesGetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self shouldCullNonVisibleNodes]));
    return;
  }
}

NAN_SETTER(NSKView::shouldCullNonVisibleNodesSetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    [self setShouldCullNonVisibleNodes: TO_BOOL(value)];
  }
}

NAN_GETTER(NSKView::preferredFramesPerSecondGetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self preferredFramesPerSecond]));
    return;
  }
}

NAN_SETTER(NSKView::preferredFramesPerSecondSetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    [self setPreferredFramesPerSecond: to_value_NSInteger(value)];
  }
}

typedef NSObject SKViewDelegate;

NAN_GETTER(NSKView::delegateGetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_id<SKViewDelegate>([self delegate]));
    return;
  }
}

NAN_SETTER(NSKView::delegateSetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    [self setDelegate: to_value_id<SKViewDelegate>(value)];
  }
}

NAN_GETTER(NSKView::frameIntervalGetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self frameInterval]));
    return;
  }
}

NAN_SETTER(NSKView::frameIntervalSetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    [self setFrameInterval: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSKView::preferredFrameRateGetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_float([self preferredFrameRate]));
    return;
  }
}

NAN_SETTER(NSKView::preferredFrameRateSetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    [self setPreferredFrameRate: to_value_float(value)];
  }
}

#include "NSKScene.h"

NAN_GETTER(NSKView::sceneGetter) {
  JS_UNWRAP(SKView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKScene([self scene]));
    return;
  }
}

