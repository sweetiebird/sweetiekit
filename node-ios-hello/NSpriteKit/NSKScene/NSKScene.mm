//
//  NSKScene.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#include "defines.h"
#include "NSKNode.h"
#include "NSKScene.h"
#include "NARSession.h"
#include "NSKPhysicsWorld.h"
#include "NSKCameraNode.h"
#include "NUITouch.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NSKScene::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSKScene::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSKNode::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SKScene"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, touchesBegan);
  JS_ASSIGN_PROP(proto, touchesMoved);
  JS_ASSIGN_PROP(proto, touchesEnded);
  JS_ASSIGN_PROP(proto, update);
  JS_ASSIGN_METHOD(proto, convertPointFromView);
  JS_ASSIGN_METHOD(proto, convertPointToView);
  JS_ASSIGN_PROP(proto, size);
  JS_ASSIGN_PROP(proto, scaleMode);
  JS_ASSIGN_PROP(proto, camera);
  JS_ASSIGN_PROP(proto, listener);
  JS_ASSIGN_PROP_READONLY(proto, audioEngine);
  JS_ASSIGN_PROP(proto, backgroundColor);
  JS_ASSIGN_PROP(proto, delegate);
  JS_ASSIGN_PROP(proto, anchorPoint);
  JS_ASSIGN_PROP_READONLY(proto, physicsWorld);
  JS_ASSIGN_PROP_READONLY(proto, view);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  JS_ASSIGN_METHOD(ctorFn, sceneWithSize);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSKScene::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKScene *scene = new NSKScene();

  if (info[0]->IsExternal()) {
    scene->SetNSObject((__bridge SKScene *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    std::string file;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      file = *utf8Value;
    } else {
      Nan::ThrowError("invalid argument");
    }
    @autoreleasepool {
      NSString *fileName = [NSString stringWithUTF8String:file.c_str()];
      scene->SetNSObject([SKScene nodeWithFileNamed:fileName]);
    }
  } else {
    @autoreleasepool {
      scene->SetNSObject([[SKScene alloc] init]);
    }
  }
  scene->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NSKScene::NSKScene () {}
NSKScene::~NSKScene () {}

NAN_METHOD(NSKScene::sceneWithSize) {
  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NSKScene)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NSKScene *scene = ObjectWrap::Unwrap<NSKScene>(obj);

  @autoreleasepool {
    CGSize size(to_value_CGSize(info[0]));
    scene->SetNSObject([SKScene sceneWithSize:size]);
  }

  JS_SET_RETURN(obj);
}

NAN_GETTER(NSKScene::scaleModeGetter) {
  Nan::HandleScope scope;
  
  Nan::ThrowError("NSKScene::scaleModeGetter not yet implemented");
}

NAN_SETTER(NSKScene::scaleModeSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(SKScene, scene);

  std::string mode;
  if (value->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(value));
    mode = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  
  NSString *str = [NSString stringWithUTF8String:mode.c_str()];
  SKSceneScaleMode scaleMode = SKSceneScaleModeFill;

  if ([str isEqualToString:@"aspectFill"]) {
    scaleMode = SKSceneScaleModeAspectFill;
  } else if ([str isEqualToString:@"aspectFit"]) {
    scaleMode = SKSceneScaleModeAspectFit;
  } else if ([str isEqualToString:@"resizeFill"]) {
    scaleMode = SKSceneScaleModeResizeFill;
  }
  
  [scene setScaleMode:scaleMode];
}

NAN_GETTER(NSKScene::touchesBeganGetter) {
  Nan::EscapableHandleScope scope;
  
  JS_UNWRAP(SKScene, sk);

  @autoreleasepool {
    id fn = [sk associatedValueForKey:@"sweetiekit_touchesBegan"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NSKScene::touchesBeganSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(SKScene, sk);

  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [sk associateValue:func withKey:@"sweetiekit_touchesBegan"];
  }
}

NAN_GETTER(NSKScene::touchesMovedGetter) {
  Nan::EscapableHandleScope scope;
  
  JS_UNWRAP(SKScene, sk);

  @autoreleasepool {
    id fn = [sk associatedValueForKey:@"sweetiekit_touchesMoved"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NSKScene::touchesMovedSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(SKScene, sk);

  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [sk associateValue:func withKey:@"sweetiekit_touchesMoved"];
  }
}

NAN_GETTER(NSKScene::touchesEndedGetter) {
  Nan::EscapableHandleScope scope;
  
  JS_UNWRAP(SKScene, sk);

  @autoreleasepool {
    id fn = [sk associatedValueForKey:@"sweetiekit_touchesEnded"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NSKScene::touchesEndedSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(SKScene, sk);

  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [sk associateValue:func withKey:@"sweetiekit_touchesEnded"];
  }
}

NAN_METHOD(NSKScene::convertPointFromView) {
  JS_UNWRAP(SKScene, node);
  @autoreleasepool {
    CGPoint converted([node convertPointFromView:to_value_CGPoint(info[0])]);
    JS_SET_RETURN(js_value_CGPoint(converted));
  }
}

NAN_METHOD(NSKScene::convertPointToView) {
  JS_UNWRAP(SKScene, node);
  @autoreleasepool {
    CGPoint converted([node convertPointToView:to_value_CGPoint(info[0])]);
    JS_SET_RETURN(js_value_CGPoint(converted));
  }
}

NAN_GETTER(NSKScene::sizeGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGSize([self size]));
    return;
  }
}

NAN_SETTER(NSKScene::sizeSetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    [self setSize: to_value_CGSize(value)];
  }
}

/*
NAN_GETTER(NSKScene::scaleModeGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKSceneScaleMode([self scaleMode]));
    return;
  }
}

NAN_SETTER(NSKScene::scaleModeSetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    [self setScaleMode: to_value_SKSceneScaleMode(value)];
  }
}*/

NAN_GETTER(NSKScene::cameraGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKCameraNode([self camera]));
    return;
  }
}

NAN_SETTER(NSKScene::cameraSetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    [self setCamera: to_value_SKCameraNode(value)];
  }
}

NAN_GETTER(NSKScene::listenerGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKNode([self listener]));
    return;
  }
}

NAN_SETTER(NSKScene::listenerSetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    [self setListener: to_value_SKNode(value)];
  }
}

#define js_value_AVAudioEngine(x) js_value_wrapper_unknown(x, AVAudioEngine)
#define to_value_AVAudioEngine(x) to_value_wrapper_unknown(x, AVAudioEngine)

NAN_GETTER(NSKScene::audioEngineGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_AVAudioEngine([self audioEngine]));
    return;
  }
}

NAN_GETTER(NSKScene::backgroundColorGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKColor([self backgroundColor]));
    return;
  }
}

NAN_SETTER(NSKScene::backgroundColorSetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    [self setBackgroundColor: to_value_SKColor(value)];
  }
}

#define js_value_SKSceneDelegate(x) js_value_wrapper_unknown(x, SKSceneDelegate)
#define to_value_SKSceneDelegate(x) to_value_wrapper_unknown(x, SKSceneDelegate)

NAN_GETTER(NSKScene::delegateGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_id/*<SKSceneDelegate>*/([self delegate]));
    return;
  }
}

NAN_SETTER(NSKScene::delegateSetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    [self setDelegate: to_value_id/*<SKSceneDelegate>*/(value)];
  }
}

NAN_GETTER(NSKScene::anchorPointGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGPoint([self anchorPoint]));
    return;
  }
}

NAN_SETTER(NSKScene::anchorPointSetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    [self setAnchorPoint: to_value_CGPoint(value)];
  }
}

NAN_GETTER(NSKScene::physicsWorldGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKPhysicsWorld([self physicsWorld]));
    return;
  }
}

NAN_GETTER(NSKScene::viewGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKView([self view]));
    return;
  }
}

NAN_GETTER(NSKScene::updateGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(SKScene, sk);

  @autoreleasepool {
    id fn = [sk associatedValueForKey:@"sweetiekit_update"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NSKScene::updateSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(SKScene, sk);

  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [sk associateValue:func withKey:@"sweetiekit_update"];
  }
}
