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
  JS_ASSIGN_PROP(proto, backgroundColor);
  JS_ASSIGN_PROP(proto, scaleMode);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Nan::SetMethod(ctorFn, "sceneWithSize", sceneWithSize);

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
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NSKScene)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NSKScene *scene = ObjectWrap::Unwrap<NSKScene>(obj);

  @autoreleasepool {
    double w = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double h = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    scene->SetNSObject([SKScene sceneWithSize:CGSizeMake(w, h)]);
  }

  JS_SET_RETURN(obj);
}

NAN_GETTER(NSKScene::backgroundColorGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(SKScene, scene);
  
  __block double r = 0;
  __block double g = 0;
  __block double b = 0;
  __block double a = 0;
  @autoreleasepool {
    [[scene backgroundColor] getRed:&r green:&g blue:&b alpha:&a];
  }

  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_FLOAT(r));
  result->Set(JS_STR("green"), JS_FLOAT(g));
  result->Set(JS_STR("blue"), JS_FLOAT(b));
  result->Set(JS_STR("alpha"), JS_FLOAT(a));

  JS_SET_RETURN(result);
}

NAN_SETTER(NSKScene::backgroundColorSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(SKScene, scene);

  double r = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
  double g = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
  double b = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));

  [scene setBackgroundColor:[[UIColor alloc] initWithRed:r green:g blue:b alpha:1]];
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
