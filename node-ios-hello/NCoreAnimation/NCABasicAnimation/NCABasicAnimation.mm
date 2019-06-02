//
//  CABasicAnimation.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/3/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include "NCABasicAnimation.h"
#include "ColorHelper.h"

Nan::Persistent<FunctionTemplate> NCABasicAnimation::type;

NCABasicAnimation::NCABasicAnimation () {}
NCABasicAnimation::~NCABasicAnimation () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NCABasicAnimation::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;
  
  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("CABasicAnimation"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "fromValue", FromValue);
  JS_SET_PROP(proto, "toValue", ToValue);
  JS_SET_PROP(proto, "duration", Duration);
  
  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  
  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NCABasicAnimation::New) {
  Nan::HandleScope scope;
  
  Local<Object> obj = info.This();
  
  NCABasicAnimation *anim = new NCABasicAnimation();
  
  if (info[0]->IsExternal()) {
    anim->SetNSObject((__bridge CABasicAnimation *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      std::string kp;
      if (info[0]->IsString()) {
        Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
        kp = *utf8Value;
      } else {
        Nan::ThrowError("invalid argument: key path");
      }

      NSString *keyPath = [NSString stringWithUTF8String:kp.c_str()];

      anim->SetNSObject([CABasicAnimation animationWithKeyPath:keyPath]);
    }
  }
  anim->Wrap(obj);
  
  JS_SET_RETURN(obj);
}

NAN_GETTER(NCABasicAnimation::FromValueGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CABasicAnimation, anim);
  
  __block id _Nullable from;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      from = [anim fromValue];
    });
  }
  
//  JS_SET_RETURN(JS_FLOAT(from));
}

NAN_SETTER(NCABasicAnimation::FromValueSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CABasicAnimation, anim);
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      double x = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x")));
      double y = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y")));
      CGPoint pt = CGPointMake(x, y);
      NSValue *val = [NSValue valueWithCGPoint:pt];
      [anim setFromValue:val];
    });
  }
}

NAN_GETTER(NCABasicAnimation::ToValueGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CABasicAnimation, anim);
  
  __block id _Nullable to;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      to = [anim toValue];
    });
  }
  
//  JS_SET_RETURN(JS_FLOAT(to));
}

NAN_SETTER(NCABasicAnimation::ToValueSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CABasicAnimation, anim);
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      double x = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x")));
      double y = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y")));
      CGPoint pt = CGPointMake(x, y);
      NSValue *val = [NSValue valueWithCGPoint:pt];
      [anim setToValue:val];
    });
  }
}

NAN_GETTER(NCABasicAnimation::DurationGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CABasicAnimation, anim);
  
  __block CGFloat duration;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      duration = [anim duration];
    });
  }
  
  JS_SET_RETURN(JS_FLOAT(duration));
}

NAN_SETTER(NCABasicAnimation::DurationSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CABasicAnimation, anim);
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      double x = TO_DOUBLE(value);
      [anim setDuration:x];
    });
  }
}
