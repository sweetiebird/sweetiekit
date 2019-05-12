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
            if (loc != nullptr) {
              Local<Value> argv[] = {
                Nan::New<v8::External>((__bridge void*)loc)
              };
              Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(loc, type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
              Nan::Set(locResult, static_cast<uint32_t>(i), value);
            }
          }

          mgr->_didUpdateLocations("NCLLocationManagerDelegate _didUpdateLocations", mgrObj, locResult);
        }]);
      });
    }
  }
  mgr->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NCLLocationManagerDelegate::NCLLocationManagerDelegate () {}
NCLLocationManagerDelegate::~NCLLocationManagerDelegate () {}