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

#include "NNSObject.h"

namespace sweetiekit
{
  Local<Value> GetWrapperFor(id pThing, const Nan::Persistent<FunctionTemplate>& defaultType)
  {
    Nan::EscapableHandleScope handleScope;
    Local<Value> result;
    if (pThing != nullptr) {
      Local<Value> argv[] = {
        Nan::New<v8::External>((__bridge void*)pThing)
      };
//      Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(pThing, defaultType)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
//      result = value;
    } else {
      result = Nan::Undefined();
    }
    return handleScope.Escape(result);
  }
}
