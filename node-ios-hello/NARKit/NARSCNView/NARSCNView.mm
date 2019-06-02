//
//  NARSCNView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SceneKit/SceneKit.h>
#import <ARKit/ARKit.h>
#include "defines.h"
#include "NARSCNView.h"
#include "NSCNView.h"
#include "NARSession.h"
#include "NARSCNViewDelegate.h"
#include "NSCNScene.h"
#import "node_ios_hello-Swift.h"

NARSCNView::NARSCNView () {}
NARSCNView::~NARSCNView () {}

JS_INIT_CLASS(ARSCNView, SCNView);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, session);
  JS_ASSIGN_PROP(proto, delegate);
  JS_ASSIGN_PROP(proto, scene);
  JS_ASSIGN_METHOD(proto, presentScene);
  JS_ASSIGN_PROP(proto, automaticallyUpdatesLighting);

  // static members (ctor)
  JS_INIT_CTOR(ARSCNView, SCNView);

JS_INIT_CLASS_END(ARSCNView, SCNView);

NAN_METHOD(NARSCNView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NARSCNView *view = new NARSCNView();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge ARSCNView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      CGRect frame = CGRectMake(x, y, width, height);
      dispatch_sync(dispatch_get_main_queue(), ^ {
          view->SetNSObject([[ARSCNView alloc] initWithFrame:frame]);
      });
    }
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        view->SetNSObject([[ARSCNView alloc] init]);
      });
    }
  }
  view->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_GETTER(NARSCNView::sessionGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARSCNView, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui session], NARSession::type));
}

NAN_GETTER(NARSCNView::delegateGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARSCNView, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui delegate], NARSCNViewDelegate::type));
}

NAN_SETTER(NARSCNView::delegateSetter) {
  Nan::HandleScope scope;
  
  NARSCNView *view = ObjectWrap::Unwrap<NARSCNView>(info.This());
  NARSCNViewDelegate *del = ObjectWrap::Unwrap<NARSCNViewDelegate>(Local<Object>::Cast(value));
  auto delegate = del->As<SARSCNViewDelegate>();
  view->_delegate.Reset(value);

  @autoreleasepool {
    JS_UNWRAP(ARSCNView, ui);
    [ui associateValue:delegate withKey:@"sweetiekit.delegate"];
    [ui setDelegate:delegate];
  }
}

NAN_METHOD(NARSCNView::presentScene) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARSCNView, ui);

  NSCNScene *scene = ObjectWrap::Unwrap<NSCNScene>(Local<Object>::Cast(info[0]));
  
  SKTransition *transition = [SKTransition fadeWithDuration:0.2];
  [ui presentScene:scene->As<SCNScene>() withTransition:transition incomingPointOfView:nullptr completionHandler: ^ {
    printf("transitioned to scene");
  }];
}

NAN_GETTER(NARSCNView::sceneGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARSCNView, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui scene], NSCNScene::type));
}

NAN_SETTER(NARSCNView::sceneSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARSCNView, ui);
  NSCNScene *scene = ObjectWrap::Unwrap<NSCNScene>(Local<Object>::Cast(value));

  [ui setScene:scene->As<SCNScene>()];
}

NAN_GETTER(NARSCNView::automaticallyUpdatesLightingGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARSCNView, ui);

  JS_SET_RETURN(JS_BOOL([ui automaticallyUpdatesLighting]));
}

NAN_SETTER(NARSCNView::automaticallyUpdatesLightingSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARSCNView, ui);
  
  [ui setAutomaticallyUpdatesLighting:TO_BOOL(value)];
}
