//
//  NCLHeading.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCLHeading.h"

NCLHeading::NCLHeading () {}
NCLHeading::~NCLHeading () {}

JS_INIT_CLASS(CLHeading, NSObject);
  // instance members (proto)
  JS_SET_PROP_READONLY(proto, "magneticHeading", MagneticHeading);
  JS_SET_PROP_READONLY(proto, "trueHeading", TrueHeading);
  JS_SET_PROP_READONLY(proto, "headingAccuracy", HeadingAccuracy);
  JS_SET_PROP_READONLY(proto, "timestamp", Timestamp);
  JS_SET_PROP_READONLY(proto, "x", X);
  JS_SET_PROP_READONLY(proto, "y", Y);
  JS_SET_PROP_READONLY(proto, "z", Z);
  // static members (ctor)
  JS_INIT_CTOR(CLHeading, NSObject);
JS_INIT_CLASS_END(CLHeading, NSObject);

NAN_METHOD(NCLHeading::New) {
  JS_RECONSTRUCT(CLHeading);

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
