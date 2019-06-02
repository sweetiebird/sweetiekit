//
//  NCLLocationManager.mm
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCLLocationManager.h"
#include "NCLLocationManagerDelegate.h"

NCLLocationManager::NCLLocationManager () {}
NCLLocationManager::~NCLLocationManager () {}

JS_INIT_CLASS(CLLocationManager, NSObject);
  // instance members (proto)
  JS_SET_METHOD(proto, "startUpdatingLocation", StartUpdatingLocation);
  JS_SET_METHOD(proto, "startUpdatingHeading", StartUpdatingHeading);
  JS_SET_METHOD(proto, "requestAlwaysAuthorization", RequestAlwaysAuthorization);
  JS_SET_METHOD(proto, "requestWhenInUseAuthorization", RequestWhenInUseAuthorization);
  JS_SET_PROP(proto, "delegate", Delegate);
  JS_SET_PROP(proto, "desiredAccuracy", DesiredAccuracy);
  JS_SET_PROP(proto, "distanceFilter", DistanceFilter);
  JS_SET_PROP(proto, "headingFilter", HeadingFilter);
  // static members (ctor)
  JS_INIT_CTOR(CLLocationManager, NSObject);
JS_INIT_CLASS_END(CLLocationManager, NSObject);

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
