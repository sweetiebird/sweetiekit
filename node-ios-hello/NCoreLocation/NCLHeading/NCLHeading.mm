//
//  NCLHeading.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#include "NCLHeading.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NCLHeading::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NCLHeading::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("CLHeading"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP_READONLY(proto, "magneticHeading", MagneticHeading);
  JS_SET_PROP_READONLY(proto, "trueHeading", TrueHeading);
  JS_SET_PROP_READONLY(proto, "headingAccuracy", HeadingAccuracy);
  JS_SET_PROP_READONLY(proto, "timestamp", Timestamp);
  JS_SET_PROP_READONLY(proto, "x", X);
  JS_SET_PROP_READONLY(proto, "y", Y);
  JS_SET_PROP_READONLY(proto, "z", Z);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NCLHeading::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NCLHeading *cl = new NCLHeading();

  if (info[0]->IsExternal()) {
    cl->SetNSObject((__bridge CLHeading *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        cl->SetNSObject([[CLHeading alloc] init]);
      });
    }
  }
  cl->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NCLHeading::NCLHeading () {}
NCLHeading::~NCLHeading () {}

NAN_GETTER(NCLHeading::MagneticHeadingGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLHeading, cl);

  double result = [cl magneticHeading];

  JS_SET_RETURN(JS_NUM(result));
}

NAN_GETTER(NCLHeading::TrueHeadingGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLHeading, cl);

  double result = [cl trueHeading];

  JS_SET_RETURN(JS_NUM(result));
}

NAN_GETTER(NCLHeading::HeadingAccuracyGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLHeading, cl);

  double result = [cl headingAccuracy];

  JS_SET_RETURN(JS_NUM(result));
}

NAN_GETTER(NCLHeading::TimestampGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLHeading, cl);

  NSDate* result = [cl timestamp];
  double milliseconds = 1000.0 * [result timeIntervalSince1970];

  JS_SET_RETURN(Nan::New<Date>(milliseconds).ToLocalChecked());
}

NAN_GETTER(NCLHeading::XGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLHeading, cl);

  double result = [cl x];

  JS_SET_RETURN(JS_NUM(result));
}

NAN_GETTER(NCLHeading::YGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLHeading, cl);

  double result = [cl y];

  JS_SET_RETURN(JS_NUM(result));
}

NAN_GETTER(NCLHeading::ZGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLHeading, cl);

  double result = [cl z];

  JS_SET_RETURN(JS_NUM(result));
}
