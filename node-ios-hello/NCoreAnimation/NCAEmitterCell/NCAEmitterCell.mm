//
//  CAEmitterCell.m
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NCAEmitterCell.h"
#include "NUIImage.h"

NCAEmitterCell::NCAEmitterCell () {}
NCAEmitterCell::~NCAEmitterCell () {}

JS_INIT_CLASS(CAEmitterCell, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, contents);
  JS_ASSIGN_PROP(proto, birthrate);
  JS_ASSIGN_PROP(proto, lifetime);
  JS_ASSIGN_PROP(proto, velocity);
  JS_ASSIGN_PROP(proto, scale);
  JS_ASSIGN_PROP(proto, emissionRange);
  // static members (ctor)
  JS_INIT_CTOR(CAEmitterCell, NSObject);
  JS_ASSIGN_METHOD(ctor, emitterCell);
JS_INIT_CLASS_END(CAEmitterCell, NSObject);

NAN_METHOD(NCAEmitterCell::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NCAEmitterCell *ui = new NCAEmitterCell();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge CAEmitterCell *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[CAEmitterCell alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NCAEmitterCell::emitterCell) {
  @autoreleasepool {
    JS_SET_RETURN_EXTERNAL(CAEmitterCell, [CAEmitterCell emitterCell]);
  }
}

NAN_GETTER(NCAEmitterCell::contentsGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterCell, ca);
  
  JS_SET_RETURN(JS_OBJ(sweetiekit::GetWrapperFor([ca contents], NNSObject::type)));
}

NAN_SETTER(NCAEmitterCell::contentsSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterCell, ca);
  
  Local<Object> obj = JS_OBJ(value);
  NUIImage *img = ObjectWrap::Unwrap<NUIImage>(obj);

  @autoreleasepool {
    [ca setContents:(id)[img->As<UIImage>() CGImage]];
  }
}

NAN_GETTER(NCAEmitterCell::birthrateGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterCell, ca);
  
  JS_SET_RETURN(JS_NUM([ca birthRate]));
}

NAN_SETTER(NCAEmitterCell::birthrateSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterCell, ca);

  @autoreleasepool {
    double rate = TO_DOUBLE(value);
    [ca setBirthRate:rate];
  }
}

NAN_GETTER(NCAEmitterCell::lifetimeGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterCell, ca);
  
  JS_SET_RETURN(JS_NUM([ca lifetime]));
}

NAN_SETTER(NCAEmitterCell::lifetimeSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterCell, ca);

  @autoreleasepool {
    double lf = TO_DOUBLE(value);
    [ca setLifetime:lf];
  }
}

NAN_GETTER(NCAEmitterCell::velocityGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterCell, ca);
  
  JS_SET_RETURN(JS_NUM([ca velocity]));
}

NAN_SETTER(NCAEmitterCell::velocitySetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterCell, ca);

  @autoreleasepool {
    double v = TO_DOUBLE(value);
    [ca setVelocity:v];
  }
}

NAN_GETTER(NCAEmitterCell::scaleGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterCell, ca);
  
  JS_SET_RETURN(JS_NUM([ca scale]));
}

NAN_SETTER(NCAEmitterCell::scaleSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterCell, ca);

  @autoreleasepool {
    double v = TO_DOUBLE(value);
    [ca setScale:v];
  }
}

NAN_GETTER(NCAEmitterCell::emissionRangeGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterCell, ca);
  
  JS_SET_RETURN(JS_NUM([ca emissionRange]));
}

NAN_SETTER(NCAEmitterCell::emissionRangeSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterCell, ca);

  @autoreleasepool {
    double r = TO_DOUBLE(value);
    [ca setEmissionRange:r];
  }
}

