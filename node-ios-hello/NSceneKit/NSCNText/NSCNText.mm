//
//  SCNText.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <SceneKit/SceneKit.h>
#include "defines.h"
#include "NSCNGeometry.h"
#include "NSCNText.h"
#include "NUIFont.h"

Nan::Persistent<FunctionTemplate> NSCNText::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNText::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSCNGeometry::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNText"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, font);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNText::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSCNText *ui = new NSCNText();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SCNText *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    @autoreleasepool {
      NSString *str = NJSStringToNSString(info[0]);
      float depth = TO_FLOAT(info[1]);
      ui->SetNSObject([SCNText textWithString:str extrusionDepth:depth]);
    }
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SCNText alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NSCNText::NSCNText () {}
NSCNText::~NSCNText () {}

NAN_GETTER(NSCNText::fontGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNText, scn);

  JS_SET_RETURN(sweetiekit::GetWrapperFor([scn font], NUIFont::type));
}

NAN_SETTER(NSCNText::fontSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNText, scn);

  NUIFont *font = ObjectWrap::Unwrap<NUIFont>(Local<Object>::Cast(value));

  @autoreleasepool {
    [scn setFont:font->As<UIFont>()];
  }
}
