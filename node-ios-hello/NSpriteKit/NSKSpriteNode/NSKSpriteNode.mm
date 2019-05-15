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
  JS_SET_PROP(proto, "size", Size);
  JS_SET_PROP(proto, "colorBlendFactor", ColorBlendFactor);
  JS_SET_PROP(proto, "color", Color);

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
  } else if (info.Length() > 0) {
    std::string name;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      name = *utf8Value;
    } else {
      Nan::ThrowError("invalid argument");
    }

    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        NSString *imageName = [NSString stringWithUTF8String:name.c_str()];
        node->SetNSObject([[SKSpriteNode alloc] initWithImageNamed:imageName]);
      });
    }
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

NAN_GETTER(NSKSpriteNode::SizeGetter) {
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

NAN_SETTER(NSKSpriteNode::SizeSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKSpriteNode, node);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      double width = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width")));
      double height = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")));
      CGSize size = CGSizeMake(width, height);
      [node setSize:size];
    });
  }
}

NAN_GETTER(NSKSpriteNode::ColorBlendFactorGetter) {
  Nan::HandleScope scope;

  Nan::ThrowError("NSKSpriteNode::ColorBlendFactorGetter not implemented");
}

NAN_SETTER(NSKSpriteNode::ColorBlendFactorSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKSpriteNode, node);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      double factor = TO_DOUBLE(value);
      [node setColorBlendFactor:factor];
    });
  }
}

NAN_GETTER(NSKSpriteNode::ColorGetter) {
  Nan::HandleScope scope;

  Nan::ThrowError("NSKSpriteNode::ColorBlendFactorGetter not implemented");
}

NAN_SETTER(NSKSpriteNode::ColorSetter) {
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
