//
//  CABasicAnimation.mm
//
//  Created by Emily Kolar on 5/3/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCABasicAnimation.h"

NCABasicAnimation::NCABasicAnimation () {}
NCABasicAnimation::~NCABasicAnimation () {}

JS_INIT_CLASS(CABasicAnimation, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, fromValue);
  JS_ASSIGN_PROP(proto, toValue);
  JS_ASSIGN_PROP(proto, duration);
  // static members (ctor)
  JS_INIT_CTOR(CABasicAnimation, NSObject);
JS_INIT_CLASS_END(CABasicAnimation, NSObject);

NAN_METHOD(NCABasicAnimation::New) {
  JS_RECONSTRUCT(CABasicAnimation);
  
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

NAN_GETTER(NCABasicAnimation::fromValueGetter) {
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

NAN_SETTER(NCABasicAnimation::fromValueSetter) {
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

NAN_GETTER(NCABasicAnimation::toValueGetter) {
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

NAN_SETTER(NCABasicAnimation::toValueSetter) {
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

NAN_GETTER(NCABasicAnimation::durationGetter) {
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

NAN_SETTER(NCABasicAnimation::durationSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CABasicAnimation, anim);
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      double x = TO_DOUBLE(value);
      [anim setDuration:x];
    });
  }
}
