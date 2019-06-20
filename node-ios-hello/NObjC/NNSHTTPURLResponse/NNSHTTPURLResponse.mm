//
//  NNSHTTPURLResponse.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSHTTPURLResponse.h"

#define instancetype NSHTTPURLResponse
#define js_value_instancetype js_value_NSHTTPURLResponse

NNSHTTPURLResponse::NNSHTTPURLResponse() {}
NNSHTTPURLResponse::~NNSHTTPURLResponse() {}

JS_INIT_CLASS(NSHTTPURLResponse, NSURLResponse);
  JS_ASSIGN_STATIC_METHOD(localizedStringForStatusCode);
  JS_ASSIGN_PROTO_METHOD(initWithURLStatusCode_HTTPVersionHeaderFields);
  JS_ASSIGN_PROTO_PROP_READONLY(statusCode);
  JS_ASSIGN_PROTO_PROP_READONLY(allHeaderFields);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSHTTPURLResponse, NSURLResponse);
  // constant values (exports)
JS_INIT_CLASS_END(NSHTTPURLResponse, NSURLResponse);

NAN_METHOD(NNSHTTPURLResponse::New) {
  JS_RECONSTRUCT(NSHTTPURLResponse);
  @autoreleasepool {
    NSHTTPURLResponse* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSHTTPURLResponse *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSHTTPURLResponse alloc] init];
    }
    if (self) {
      NNSHTTPURLResponse *wrapper = new NNSHTTPURLResponse();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSHTTPURLResponse::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSHTTPURLResponse::localizedStringForStatusCode) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, statusCode);
    JS_SET_RETURN(js_value_NSString([NSHTTPURLResponse localizedStringForStatusCode: statusCode]));
  }
}

#include "NNSURL.h"

NAN_METHOD(NNSHTTPURLResponse::initWithURLStatusCode_HTTPVersionHeaderFields) {
  JS_UNWRAP_OR_ALLOC(NSHTTPURLResponse, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_value(NSInteger, statusCode);
    declare_nullable_pointer(NSString, HTTPVersion);
    declare_nullable_pointer(NSDictionary/* <NSString*, NSString*>*/, headerFields);
    JS_SET_RETURN(js_value_instancetype([self initWithURL: url statusCode: statusCode HTTPVersion: HTTPVersion headerFields: headerFields]));
  }
}

NAN_GETTER(NNSHTTPURLResponse::statusCodeGetter) {
  JS_UNWRAP(NSHTTPURLResponse, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self statusCode]));
  }
}

NAN_GETTER(NNSHTTPURLResponse::allHeaderFieldsGetter) {
  JS_UNWRAP(NSHTTPURLResponse, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary([self allHeaderFields]));
  }
}
