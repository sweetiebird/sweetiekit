//
//  NNSObjCRuntime.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSObjCRuntime.h"

#define instancetype NSObjCRuntime
#define js_value_instancetype js_value_NSObjCRuntime

NNSObjCRuntime::NNSObjCRuntime() {}
NNSObjCRuntime::~NNSObjCRuntime() {}

JS_INIT_CLASS(NSObjCRuntime, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSObjCRuntime, NSObject);
  // constants (exports)
  
  JS_ASSIGN_ENUM(NSIntegerMax, NSInteger); // TODO: Find out why this ends up set to -1
  JS_ASSIGN_ENUM(NSIntegerMin, NSInteger); // TODO: Find out why this ends up set to 0
  JS_ASSIGN_ENUM(NSUIntegerMax, NSUInteger);
  
  //
  // constants (exports) from <Foundation/NSObjCRuntime.h>
  //
  
  //typedef NS_CLOSED_ENUM(NSInteger, NSComparisonResult) {
    JS_ASSIGN_ENUM(NSOrderedAscending, NSInteger); // = -1L,
    JS_ASSIGN_ENUM(NSOrderedSame, NSInteger); //,
    JS_ASSIGN_ENUM(NSOrderedDescending, NSInteger); //
  //};

  //typedef NS_OPTIONS(NSUInteger, NSEnumerationOptions) {
    JS_ASSIGN_ENUM(NSEnumerationConcurrent, NSUInteger); // = (1UL << 0),
    JS_ASSIGN_ENUM(NSEnumerationReverse, NSUInteger); // = (1UL << 1),
  //};

  //typedef NS_OPTIONS(NSUInteger, NSSortOptions) {
    JS_ASSIGN_ENUM(NSSortConcurrent, NSUInteger); // = (1UL << 0),
    JS_ASSIGN_ENUM(NSSortStable, NSUInteger); // = (1UL << 4),
  //};

  //typedef NS_ENUM(NSInteger, NSQualityOfService) {
    JS_ASSIGN_ENUM(NSQualityOfServiceUserInteractive, NSInteger); // = 0x21,
    JS_ASSIGN_ENUM(NSQualityOfServiceUserInitiated, NSInteger); // = 0x19,
    JS_ASSIGN_ENUM(NSQualityOfServiceUtility, NSInteger); // = 0x11,
    JS_ASSIGN_ENUM(NSQualityOfServiceBackground, NSInteger); // = 0x09,
    JS_ASSIGN_ENUM(NSQualityOfServiceDefault, NSInteger); // = -1
  //} API_AVAILABLE(macos(10.10), ios(8.0), watchos(2.0), tvos(9.0));

  JS_ASSIGN_ENUM(NSNotFound, NSInteger); // = NSIntegerMax;

JS_INIT_CLASS_END(NSObjCRuntime, NSObject);

NAN_METHOD(NNSObjCRuntime::New) {
  JS_RECONSTRUCT(NSObjCRuntime);
  @autoreleasepool {
    NSObjCRuntime* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSObjCRuntime *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSObjCRuntime alloc] init];
    }
    if (self) {
      NNSObjCRuntime *wrapper = new NNSObjCRuntime();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSObjCRuntime::New: invalid arguments");
    }
  }
}

@implementation NSObjCRuntime
@end
