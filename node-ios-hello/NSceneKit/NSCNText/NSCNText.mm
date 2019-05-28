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
  JS_ASSIGN_PROP(proto, textSize);
  JS_ASSIGN_PROP(proto, extrusionDepth);
  JS_ASSIGN_PROP(proto, string);
  JS_ASSIGN_PROP(proto, font);
  JS_ASSIGN_PROP(proto, wrapped);
  JS_ASSIGN_PROP(proto, containerFrame);
  JS_ASSIGN_PROP(proto, truncationMode);
  JS_ASSIGN_PROP(proto, alignmentMode);
  JS_ASSIGN_PROP(proto, chamferRadius);
  JS_ASSIGN_PROP(proto, chamferProfile);
  JS_ASSIGN_PROP(proto, flatness);

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

NAN_GETTER(NSCNText::stringGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNText, scn);

  @autoreleasepool {
    id string = [scn string];
    if (string != nullptr && [string isKindOfClass:[NSAttributedString class]]) {
      NSAttributedString* attr = (NSAttributedString*)string;
      JS_SET_RETURN(JS_STR([[attr string] UTF8String]));
    }
    else if (string != nullptr && [string isKindOfClass:[NSString class]])  {
      NSString* str = (NSString*)string;
      JS_SET_RETURN(JS_STR([str UTF8String]));
    }
  }
}

NAN_SETTER(NSCNText::stringSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNText, scn);
  
  if (value->IsNullOrUndefined()) {
    [scn setString:nullptr];
    return;
  }
  
  if (!value->IsString()) {
    Nan::ThrowError("NSCNText::stringSetter: Expected a string or null/undefined");
    return;
  }
  @autoreleasepool {
    NSString* str = NJSStringToNSString(value);
    if (str != nullptr) {
      [scn setString:str];
    }
  }
}

NAN_GETTER(NSCNText::textSizeGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNText, scn);
  
  // https://stackoverflow.com/questions/51951345/textsize-property-of-scntext-is-missing
  //CGSize size = [scn textSize]; 
  
  //1. Get The Bounding Box Of The Text Node
  SCNVector3 v3min;
  SCNVector3 v3max;
  if ([scn getBoundingBoxMin:&v3min max:&v3max]) {
    //2. Get The Width & Height Of Our Node
    CGSize size;
    size.width = v3max.x - v3min.x;
    size.height = v3max.y - v3min.y;

    Local<Object> result = Object::New(Isolate::GetCurrent());
    result->Set(JS_STR("width"), JS_NUM(size.width));
    result->Set(JS_STR("height"), JS_NUM(size.height));

    JS_SET_RETURN(result);
  }
}

NAN_SETTER(NSCNText::textSizeSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNText, scn);
  
  CGSize size;
  size.width = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("width")));
  size.height = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("height")));
  
  // https://stackoverflow.com/questions/51951345/textsize-property-of-scntext-is-missing
  //[scn setTextSize:size]; 
  
  //1. Get The Bounding Box Of The Text Node
  SCNVector3 v3min;
  SCNVector3 v3max;
  if ([scn getBoundingBoxMin:&v3min max:&v3max]) {
    //2. Get The Width & Height Of Our Node
    CGSize oldSize;
    oldSize.width = v3max.x - v3min.x;
    oldSize.height = v3max.y - v3min.y;
    
    CGSize delta;
    delta.width = oldSize.width - size.width;
    delta.height = oldSize.height - size.height;
    v3max.x += delta.width / 2;
    v3min.x -= delta.width / 2;
    v3max.y += delta.height / 2;
    v3min.y -= delta.height / 2;
    [scn setBoundingBoxMin:&v3min max:&v3max];
  } else {
    Nan::ThrowError("NSCNText::textSizeSetter: Could not getBoundingBoxMin");
  }
}

NAN_GETTER(NSCNText::extrusionDepthGetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self extrusionDepth]));
    return;
  }
}

NAN_SETTER(NSCNText::extrusionDepthSetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    [self setExtrusionDepth: TO_FLOAT(value)];
  }
}
/*
NAN_GETTER(NSCNText::stringGetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_id([self string]));
    return;
  }
}

NAN_SETTER(NSCNText::stringSetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    [self setString: to_value_id(value)];
  }
}*/

#include "NUIFont.h"

NAN_GETTER(NSCNText::fontGetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIFont([self font]));
    return;
  }
}

NAN_SETTER(NSCNText::fontSetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    [self setFont: to_value_UIFont(value)];
  }
}

NAN_GETTER(NSCNText::wrappedGetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isWrapped]));
    return;
  }
}

NAN_SETTER(NSCNText::wrappedSetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    [self setWrapped: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNText::containerFrameGetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGRect([self containerFrame]));
    return;
  }
}

NAN_SETTER(NSCNText::containerFrameSetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    [self setContainerFrame: to_value_CGRect(value)];
  }
}

NAN_GETTER(NSCNText::truncationModeGetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSString([self truncationMode]));
    return;
  }
}

NAN_SETTER(NSCNText::truncationModeSetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    [self setTruncationMode: to_value_NSString(value)];
  }
}

NAN_GETTER(NSCNText::alignmentModeGetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSString([self alignmentMode]));
    return;
  }
}

NAN_SETTER(NSCNText::alignmentModeSetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    [self setAlignmentMode: to_value_NSString(value)];
  }
}

NAN_GETTER(NSCNText::chamferRadiusGetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self chamferRadius]));
    return;
  }
}

NAN_SETTER(NSCNText::chamferRadiusSetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    [self setChamferRadius: TO_FLOAT(value)];
  }
}

#include "NUIBezierPath.h"

NAN_GETTER(NSCNText::chamferProfileGetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIBezierPath([self chamferProfile]));
    return;
  }
}

NAN_SETTER(NSCNText::chamferProfileSetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    [self setChamferProfile: to_value_UIBezierPath(value)];
  }
}

NAN_GETTER(NSCNText::flatnessGetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self flatness]));
    return;
  }
}

NAN_SETTER(NSCNText::flatnessSetter) {
  JS_UNWRAP(SCNText, self);
  @autoreleasepool
  {
    [self setFlatness: TO_FLOAT(value)];
  }
}

