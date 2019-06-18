//
//  NUIBarCommon.mm
//
//  Created by Shawn Presser on 6/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIBarCommon.h"

#ifdef __OBJC__
@implementation UIBarCommon : NSObject
@end
#endif

NUIBarCommon::NUIBarCommon() { }
NUIBarCommon::~NUIBarCommon() { }

JS_INIT_CLASS(UIBarCommon, NSObject);
  JS_INIT_CTOR(UIBarCommon, NSObject);

/*
typedef NS_ENUM(NSInteger, UIBarMetrics) {
    UIBarMetricsDefault,
    UIBarMetricsCompact,
    UIBarMetricsDefaultPrompt = 101, // Applicable only in bars with the prompt property, such as UINavigationBar and UISearchBar
    UIBarMetricsCompactPrompt,

    UIBarMetricsLandscapePhone NS_ENUM_DEPRECATED_IOS(5_0, 8_0, "Use UIBarMetricsCompact instead") = UIBarMetricsCompact,
    UIBarMetricsLandscapePhonePrompt NS_ENUM_DEPRECATED_IOS(7_0, 8_0, "Use UIBarMetricsCompactPrompt") = UIBarMetricsCompactPrompt,
};
*/
  JS_ASSIGN_ENUM(UIBarMetricsDefault, NSInteger);
  JS_ASSIGN_ENUM(UIBarMetricsCompact, NSInteger);
  JS_ASSIGN_ENUM(UIBarMetricsDefaultPrompt, NSInteger);
  JS_ASSIGN_ENUM(UIBarMetricsCompactPrompt, NSInteger);
  JS_ASSIGN_ENUM(UIBarMetricsLandscapePhone, NSInteger);
  JS_ASSIGN_ENUM(UIBarMetricsLandscapePhonePrompt, NSInteger);
  
/*
typedef NS_ENUM(NSInteger, UIBarPosition) {
    UIBarPositionAny = 0,
    UIBarPositionBottom = 1, // The bar is at the bottom of its local context, and directional decoration draws accordingly (e.g., shadow above the bar).
    UIBarPositionTop = 2, // The bar is at the top of its local context, and directional decoration draws accordingly (e.g., shadow below the bar)
    UIBarPositionTopAttached = 3, // The bar is at the top of the screen (as well as its local context), and its background extends upward—currently only enough for the status bar.
} NS_ENUM_AVAILABLE_IOS(7_0);
*/
  JS_ASSIGN_ENUM(UIBarPositionAny, NSInteger);
  JS_ASSIGN_ENUM(UIBarPositionBottom, NSInteger);
  JS_ASSIGN_ENUM(UIBarPositionTop, NSInteger);
  JS_ASSIGN_ENUM(UIBarPositionTopAttached, NSInteger);

JS_INIT_CLASS_END(UIBarCommon, NSObject);

NAN_METHOD(NUIBarCommon::New) {
  JS_RECONSTRUCT(UIBarCommon);
  @autoreleasepool {
    UIBarCommon* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UIBarCommon *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIBarCommon alloc] init];
    }
    if (self) {
      NUIBarCommon *wrapper = new NUIBarCommon();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIBarCommon::New: invalid arguments");
    }
  }
}
