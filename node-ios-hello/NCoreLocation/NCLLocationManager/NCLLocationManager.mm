//
//  NCLLocationManager.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#include "defines.h"
#include "NCLLocationManager.h"
#include "NCLLocationManagerDelegate.h"
#include "NNSObject.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NCLLocationManager::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NCLLocationManager::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("CLLocationManager"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "startUpdatingLocation", StartUpdatingLocation);
  Nan::SetMethod(proto, "startUpdatingHeading", StartUpdatingHeading);
  Nan::SetMethod(proto, "requestAlwaysAuthorization", RequestAlwaysAuthorization);
  Nan::SetMethod(proto, "requestWhenInUseAuthorization", RequestWhenInUseAuthorization);
  JS_SET_PROP(proto, "delegate", Delegate);
  JS_SET_PROP(proto, "desiredAccuracy", DesiredAccuracy);
  JS_SET_PROP(proto, "distanceFilter", DistanceFilter);
  JS_SET_PROP(proto, "headingFilter", HeadingFilter);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  sweetiekit::Set(ctorFn, "headingAvailable", ^(JSInfo info) {
    bool result = [CLLocationManager headingAvailable];
    JS_SET_RETURN(JS_BOOL(result));
  });

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NCLLocationManager::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NCLLocationManager *mgr = new NCLLocationManager();

  if (info[0]->IsExternal()) {
    mgr->SetNSObject((__bridge CLLocationManager *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        mgr->SetNSObject([[CLLocationManager alloc] init]);
      });
    }
  }
  mgr->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NCLLocationManager::NCLLocationManager () {}
NCLLocationManager::~NCLLocationManager () {}

NAN_METHOD(NCLLocationManager::StartUpdatingLocation) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLLocationManager, mgr);

  [mgr startUpdatingLocation];
}

NAN_METHOD(NCLLocationManager::StartUpdatingHeading) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLLocationManager, mgr);

  [mgr startUpdatingHeading];
}

NAN_METHOD(NCLLocationManager::RequestAlwaysAuthorization) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLLocationManager, mgr);

  [mgr requestAlwaysAuthorization];
}

NAN_METHOD(NCLLocationManager::RequestWhenInUseAuthorization) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLLocationManager, mgr);

  [mgr requestWhenInUseAuthorization];
}

NAN_GETTER(NCLLocationManager::DelegateGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CLLocationManager, mgr);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([mgr delegate], NCLLocationManagerDelegate::type));
}

NAN_SETTER(NCLLocationManager::DelegateSetter) {
  Nan::HandleScope scope;
  
  NCLLocationManager *mgr = ObjectWrap::Unwrap<NCLLocationManager>(info.This());
  NCLLocationManagerDelegate *del = ObjectWrap::Unwrap<NCLLocationManagerDelegate>(Local<Object>::Cast(value));
  auto delegate = del->As<SCLLocationManagerDelegate>();
  mgr->_delegate.Reset(value);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      JS_UNWRAP(CLLocationManager, locMgr);
      [locMgr associateValue:delegate withKey:@"sweetiekit.delegate"];
      [locMgr setDelegate:delegate];
    });
  }
}

NAN_GETTER(NCLLocationManager::DesiredAccuracyGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CLLocationManager, mgr);
  
  double accuracy = [mgr desiredAccuracy];

  JS_SET_RETURN(JS_NUM(accuracy));
}

NAN_SETTER(NCLLocationManager::DesiredAccuracySetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CLLocationManager, mgr);
  
  [mgr setDesiredAccuracy:kCLLocationAccuracyBestForNavigation];
}

NAN_GETTER(NCLLocationManager::DistanceFilterGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CLLocationManager, mgr);
  
  double distance = [mgr distanceFilter];

  JS_SET_RETURN(JS_NUM(distance));
}

NAN_SETTER(NCLLocationManager::DistanceFilterSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CLLocationManager, mgr);
  
  double filter = TO_DOUBLE(value);

  [mgr setDistanceFilter:filter];
}

NAN_GETTER(NCLLocationManager::HeadingFilterGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CLLocationManager, mgr);
  
  double heading = [mgr headingFilter];

  JS_SET_RETURN(JS_NUM(heading));
}

NAN_SETTER(NCLLocationManager::HeadingFilterSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CLLocationManager, mgr);
  
  double filter = TO_DOUBLE(value);

  [mgr setHeadingFilter:filter];
}
