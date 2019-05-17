//
//  NCLLocationManagerDelegate.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#include "defines.h"
#include "NCLLocationManagerDelegate.h"
#include "NCLLocationManager.h"
#include "NCLLocation.h"
#include "NCLHeading.h"
#include "NNSObject.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NCLLocationManagerDelegate::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NCLLocationManagerDelegate::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("CLLocationManagerDelegate"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NCLLocationManagerDelegate::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NCLLocationManagerDelegate *mgr = new NCLLocationManagerDelegate();

  if (info[0]->IsExternal()) {
    mgr->SetNSObject((__bridge SCLLocationManagerDelegate *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    mgr->_onAuthorization.Reset(Local<Function>::Cast(info[0]));
    mgr->_didUpdateLocations.Reset(Local<Function>::Cast(info[1]));
    mgr->_didUpdateHeading.Reset(Local<Function>::Cast(info[2]));
  
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        mgr->SetNSObject([[SCLLocationManagerDelegate alloc] initOnAuthorization: ^ (CLLocationManager * _Nonnull manager, int32_t status) {
          Nan::HandleScope scope;
          Local<Value> mgrObj = sweetiekit::GetWrapperFor(manager, NCLLocationManager::type);
          mgr->_onAuthorization("NCLLocationManagerDelegate _onAuthorization", mgrObj, JS_NUM(status));
        } didUpdateLocations: ^ (CLLocationManager* manager, NSArray<CLLocation *> * _Nonnull locations) {
          Nan::HandleScope scope;
          Local<Value> mgrObj = sweetiekit::GetWrapperFor(manager, NCLLocationManager::type);

          NSInteger count = [locations count];
          auto locResult = Nan::New<Array>();

          for (NSInteger i = 0; i < count; i++) {
            CLLocation* loc = [locations objectAtIndex:i];
            Local<Value> value = sweetiekit::GetWrapperFor(loc, NCLLocation::type);
            Nan::Set(locResult, static_cast<uint32_t>(i), value);
          }

          mgr->_didUpdateLocations("NCLLocationManagerDelegate _didUpdateLocations", mgrObj, locResult);
        } didUpdateHeading: ^(CLLocationManager* manager, CLHeading* _Nonnull newHeading) {
          Nan::HandleScope scope;
          Local<Value> mgrObj = sweetiekit::GetWrapperFor(manager, NCLLocationManager::type);
          Local<Value> jsHeading = sweetiekit::GetWrapperFor(newHeading, NCLHeading::type);
          
          mgr->_didUpdateHeading("NCLLocationManagerDelegate _didUpdateHeading", mgrObj, jsHeading);
        }]);
      });
    }
  }
  mgr->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NCLLocationManagerDelegate::NCLLocationManagerDelegate () {}
NCLLocationManagerDelegate::~NCLLocationManagerDelegate () {}
