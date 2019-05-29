//
//  NSKSpriteNode.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#include "defines.h"
#include "NSKNode.h"
#include "NSKSpriteNode.h"
#include "NSKTexture.h"
#include "NUIImage.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NSKSpriteNode::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSKSpriteNode::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSKNode::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SKSpriteNode"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, size);
  JS_ASSIGN_PROP(proto, colorBlendFactor);
  JS_ASSIGN_PROP(proto, color);
  Nan::SetMethod(proto, "scaleToSize", scaleToSize);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSKSpriteNode::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKSpriteNode *node = new NSKSpriteNode();

  if (info[0]->IsExternal()) {
    node->SetNSObject((__bridge SKSpriteNode *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0 && info[0]->IsString()) {
    std::string name;
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    name = *utf8Value;

    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        NSString *imageName = [NSString stringWithUTF8String:name.c_str()];
        node->SetNSObject([[SKSpriteNode alloc] initWithImageNamed:imageName]);
      });
    }
  } else if (info.Length() > 0 && JS_INSTANCEOF(info[0], NSKTexture)) {
    JS_UNWRAPPED(info[0], SKTexture, tex);
    @autoreleasepool {
      UIColor* color = [UIColor whiteColor];
      CGSize size = [tex size];
      auto jsSize = info[2];
      auto jsColor = info[1];
      if (!info[2]->IsObject()) {
        jsColor = Nan::Undefined();
        jsSize = info[1];
      }
      if (jsSize->IsObject()) {
        size.width = TO_DOUBLE(JS_OBJ(jsSize)->Get(JS_STR("width")));
        size.height = TO_DOUBLE(JS_OBJ(jsSize)->Get(JS_STR("height")));
      }
      if (jsColor->IsObject()) {
        double red = TO_DOUBLE(JS_OBJ(jsColor)->Get(JS_STR("red")));
        double green = TO_DOUBLE(JS_OBJ(jsColor)->Get(JS_STR("green")));
        double blue = TO_DOUBLE(JS_OBJ(jsColor)->Get(JS_STR("blue")));
        double alpha = TO_DOUBLE(JS_OBJ(jsColor)->Get(JS_STR("alpha")));
        color = [[UIColor alloc] initWithRed:red green:green blue:blue alpha:alpha];
      }
      node->SetNSObject([[SKSpriteNode alloc] initWithTexture:tex color:color size:size]);
    }
  } else if (info.Length() > 0 && JS_INSTANCEOF(info[0], NUIImage)) {
    JS_UNWRAPPED(info[0], UIImage, img);
    SKTexture* tex = [SKTexture textureWithImage:img];
    node->SetNSObject([[SKSpriteNode alloc] initWithTexture:tex]);
  } else if (info.Length() > 0) {
    delete node;
    Nan::ThrowError("NSKSpriteNode::New: Invalid argument");
    return;
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        node->SetNSObject([[SKSpriteNode alloc] init]);
      });
    }
  }
  node->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NSKSpriteNode::NSKSpriteNode () {}
NSKSpriteNode::~NSKSpriteNode () {}

NAN_GETTER(NSKSpriteNode::sizeGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKSpriteNode, node);

  __block double w = 0;
  __block double h = 0;
  @autoreleasepool {
    CGSize size = [node size];
    w = size.width;
    h = size.height;
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("width"), JS_NUM(w));
  result->Set(JS_STR("height"), JS_NUM(h));
  JS_SET_RETURN(result);
}

NAN_SETTER(NSKSpriteNode::sizeSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKSpriteNode, node);

  @autoreleasepool {
    double width = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")));
    CGSize size = CGSizeMake(width, height);
    [node setSize:size];
  }
}

NAN_GETTER(NSKSpriteNode::colorBlendFactorGetter) {
  Nan::HandleScope scope;

  Nan::ThrowError("NSKSpriteNode::ColorBlendFactorGetter not implemented");
}

NAN_SETTER(NSKSpriteNode::colorBlendFactorSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKSpriteNode, node);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      double factor = TO_DOUBLE(value);
      [node setColorBlendFactor:factor];
    });
  }
}

NAN_GETTER(NSKSpriteNode::colorGetter) {
  Nan::HandleScope scope;

  Nan::ThrowError("NSKSpriteNode::ColorBlendFactorGetter not implemented");
}

NAN_SETTER(NSKSpriteNode::colorSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKSpriteNode, node);

  @autoreleasepool {
    double red = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
    double green = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
    double blue = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
    double alpha = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha")));
    UIColor *color = [[UIColor alloc] initWithRed:red green:green blue:blue alpha:alpha];
    [node setColor:color];
  }
}

NAN_METHOD(NSKSpriteNode::scaleToSize) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKSpriteNode, node);

  @autoreleasepool {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    CGSize size = CGSizeMake(width, height);
    [node scaleToSize:size];
  }
}

NAN_GETTER(NSKSpriteNode::anchorPointGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKSpriteNode, node);

  __block float x = 0;
  __block float y = 0;

  @autoreleasepool {
    x = [node anchorPoint].x;
    y = [node anchorPoint].y;
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_FLOAT(x));
  result->Set(JS_STR("y"), JS_FLOAT(y));
  
  JS_SET_RETURN(result);
}

NAN_SETTER(NSKSpriteNode::anchorPointSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKSpriteNode, node);

  @autoreleasepool {
    float x = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("x")));
    float y = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("y")));
    [node setAnchorPoint:CGPointMake(x, y)];
  }
}
