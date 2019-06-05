//
//  CLGeocoder.m
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#include "defines.h"
#include "NNSObject.h"
#include "NCLGeocoder.h"
#include "NCLPlacemark.h"

NCLGeocoder::NCLGeocoder () {}
NCLGeocoder::~NCLGeocoder () {}

JS_INIT_CLASS(CLGeocoder, NSObject);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, geocodeAddressString);
  // static members (ctor)
  JS_INIT_CTOR(CLGeocoder, NSObject);
JS_INIT_CLASS_END(CLGeocoder, NSObject);

NAN_METHOD(NCLGeocoder::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NCLGeocoder *ui = new NCLGeocoder();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge CLGeocoder *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[CLGeocoder alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NCLGeocoder::geocodeAddressString) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CLGeocoder, cl);
  
  sweetiekit::JSFunction fn(info[1]);

  @autoreleasepool {
    NSString *str = NJSStringToNSString(info[0]);
    [cl geocodeAddressString:str completionHandler: ^ (NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
      Nan::HandleScope scope;

      auto result = Nan::New<Array>();
      NSInteger count = [placemarks count];

      for (NSInteger i = 0; i < count; i++) {
        CLPlacemark* placemark = [placemarks objectAtIndex:i];
        if (placemark != nullptr) {
          Local<Value> argv[] = {
            Nan::New<v8::External>((__bridge void*)placemark)
          };
          Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(placemark, type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
          Nan::Set(result, static_cast<uint32_t>(i), value);
        }
      }

      fn.Call("NCLGeocoder::geocodeAddressString completion", result);
    }];
  }
}
