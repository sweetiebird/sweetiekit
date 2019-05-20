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

Nan::Persistent<FunctionTemplate> NARSCNView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NARSCNView::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSCNView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("ARSCNView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP_READONLY(proto, "session", Session);
  JS_SET_PROP(proto, "delegate", Delegate);
  JS_SET_PROP(proto, "scene", Scene);
  Nan::SetMethod(proto, "presentScene", PresentScene);
  JS_SET_PROP(proto, "automaticallyUpdatesLighting", AutomaticallyUpdatesLighting);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

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

NAN_GETTER(NARSCNView::SessionGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARSCNView, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui session], NARSession::type));
}

NAN_GETTER(NARSCNView::DelegateGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARSCNView, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui delegate], NARSCNViewDelegate::type));
}

NAN_SETTER(NARSCNView::DelegateSetter) {
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

NAN_METHOD(NARSCNView::PresentScene) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARSCNView, ui);

  NSCNScene *scene = ObjectWrap::Unwrap<NSCNScene>(Local<Object>::Cast(info[0]));
  
  SKTransition *transition = [SKTransition fadeWithDuration:0.2];
  [ui presentScene:scene->As<SCNScene>() withTransition:transition incomingPointOfView:nullptr completionHandler: ^ {
    printf("transitioned to scene");
  }];
}

NAN_GETTER(NARSCNView::SceneGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARSCNView, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui scene], NSCNScene::type));
}

NAN_SETTER(NARSCNView::SceneSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARSCNView, ui);
  NSCNScene *scene = ObjectWrap::Unwrap<NSCNScene>(Local<Object>::Cast(value));

  [ui setScene:scene->As<SCNScene>()];
}

NAN_GETTER(NARSCNView::AutomaticallyUpdatesLightingGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARSCNView, ui);

  JS_SET_RETURN(JS_BOOL([ui automaticallyUpdatesLighting]));
}

NAN_SETTER(NARSCNView::AutomaticallyUpdatesLightingSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARSCNView, ui);
  
  [ui setAutomaticallyUpdatesLighting:TO_BOOL(value)];
}

NARSCNView::NARSCNView () {}
NARSCNView::~NARSCNView () {}
