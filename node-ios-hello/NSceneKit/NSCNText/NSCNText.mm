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
  JS_ASSIGN_PROP(proto, string);
  JS_ASSIGN_PROP(proto, textSize);

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
