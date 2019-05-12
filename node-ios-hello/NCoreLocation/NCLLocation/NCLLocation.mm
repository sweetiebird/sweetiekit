//
//  NCLLocation.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#include "defines.h"
#include "NCLLocation.h"
#include "NNSObject.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NCLLocation::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NCLLocation::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("CLLocation"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP_READONLY(proto, "coordinate", Coordinate);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NCLLocation::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NCLLocation *loc = new NCLLocation();

  if (info[0]->IsExternal()) {
    loc->SetNSObject((__bridge CLLocation *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        loc->SetNSObject([[CLLocation alloc] init]);
      });
    }
  }
  loc->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NCLLocation::NCLLocation () {}
NCLLocation::~NCLLocation () {}

NAN_GETTER(NCLLocation::CoordinateGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLLocation, loc);

  Local<Object> result = Object::New(Isolate::GetCurrent());
  double lng = [loc coordinate].longitude;
  double lat = [loc coordinate].latitude;
  result->Set(JS_STR("latitude"), JS_NUM(lat));
  result->Set(JS_STR("longitude"), JS_NUM(lng));

  JS_SET_RETURN(result);
}
