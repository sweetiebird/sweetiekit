//
//  defines.m
//  node-ios-hello
//
//  Created by BB on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"


bool NJSStringGetUTF8String(Local<Value> jsStr, std::string& outStr) {
  std::string identifier;
  if (jsStr->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(jsStr));
    outStr = *utf8Value;
    return true;
  } else {
    return false;
  }
}

NSString* NJSStringToNSString(Local<Value> jsStr) {
  std::string str;
  if (NJSStringGetUTF8String(jsStr, str)) {
    return [NSString stringWithUTF8String:str.c_str()];
  } else {
    return nullptr;
  }
}
