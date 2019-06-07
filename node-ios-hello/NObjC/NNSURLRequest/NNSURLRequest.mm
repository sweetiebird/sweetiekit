//
//  NNSURLRequest.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSURLRequest.h"

#define instancetype NSURLRequest
#define js_value_instancetype js_value_NSURLRequest

NNSURLRequest::NNSURLRequest() {}
NNSURLRequest::~NNSURLRequest() {}

JS_INIT_CLASS(NSURLRequest, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(valueForHTTPHeaderField);
  JS_ASSIGN_PROTO_PROP_READONLY(URL);
  JS_ASSIGN_PROTO_PROP_READONLY(cachePolicy);
  JS_ASSIGN_PROTO_PROP_READONLY(timeoutInterval);
  JS_ASSIGN_PROTO_PROP_READONLY(mainDocumentURL);
  JS_ASSIGN_PROTO_PROP_READONLY(networkServiceType);
  JS_ASSIGN_PROTO_PROP_READONLY(allowsCellularAccess);
  JS_ASSIGN_PROTO_PROP_READONLY(HTTPMethod);
  JS_ASSIGN_PROTO_PROP_READONLY(allHTTPHeaderFields);
  JS_ASSIGN_PROTO_PROP_READONLY(HTTPBody);
  JS_ASSIGN_PROTO_PROP_READONLY(HTTPBodyStream);
  JS_ASSIGN_PROTO_PROP_READONLY(HTTPShouldHandleCookies);
  JS_ASSIGN_PROTO_PROP_READONLY(HTTPShouldUsePipelining);

  // static members (ctor)
  JS_INIT_CTOR(NSURLRequest, NSObject);
  JS_ASSIGN_STATIC_METHOD(requestWithURL);
  JS_ASSIGN_STATIC_METHOD(requestWithURLCachePolicyTimeoutInterval);
  JS_ASSIGN_STATIC_METHOD(initWithURL);
  JS_ASSIGN_STATIC_METHOD(initWithURLCachePolicyTimeoutInterval);
  JS_ASSIGN_STATIC_PROP_READONLY(supportsSecureCoding);
JS_INIT_CLASS_END(NSURLRequest, NSObject);

NAN_METHOD(NNSURLRequest::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'NSURLRequest(...)', turn into construct call.
      JS_SET_RETURN_NEW(NSURLRequest, info);
      return;
    }

    NSURLRequest* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge NSURLRequest *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSURLRequest alloc] init];
    }
    if (self) {
      NNSURLRequest *wrapper = new NNSURLRequest();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSURLRequest::New: invalid arguments");
    }
  }
}

#include "NNSURL.h"

NAN_METHOD(NNSURLRequest::requestWithURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, URL);
    JS_SET_RETURN(js_value_instancetype([NSURLRequest requestWithURL: URL]));
  }
}

NAN_METHOD(NNSURLRequest::requestWithURLCachePolicyTimeoutInterval) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, URL);
    declare_value(NSURLRequestCachePolicy, cachePolicy);
    declare_value(NSTimeInterval, timeoutInterval);
    JS_SET_RETURN(js_value_instancetype([NSURLRequest requestWithURL: URL cachePolicy: cachePolicy timeoutInterval: timeoutInterval]));
  }
}

NAN_METHOD(NNSURLRequest::initWithURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, URL);
    JS_SET_RETURN(js_value_instancetype([[NSURLRequest alloc] initWithURL: URL]));
  }
}

NAN_METHOD(NNSURLRequest::initWithURLCachePolicyTimeoutInterval) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, URL);
    declare_value(NSURLRequestCachePolicy, cachePolicy);
    declare_value(NSTimeInterval, timeoutInterval);
    JS_SET_RETURN(js_value_instancetype([[NSURLRequest alloc] initWithURL: URL cachePolicy: cachePolicy timeoutInterval: timeoutInterval]));
  }
}

NAN_METHOD(NNSURLRequest::valueForHTTPHeaderField) {
  JS_UNWRAP(NSURLRequest, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, field);
    JS_SET_RETURN(js_value_NSString([self valueForHTTPHeaderField: field]));
  }
}

NAN_GETTER(NNSURLRequest::supportsSecureCodingGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([NSURLRequest supportsSecureCoding]));
  }
}

NAN_GETTER(NNSURLRequest::URLGetter) {
  JS_UNWRAP(NSURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self URL]));
  }
}

NAN_GETTER(NNSURLRequest::cachePolicyGetter) {
  JS_UNWRAP(NSURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURLRequestCachePolicy([self cachePolicy]));
  }
}

NAN_GETTER(NNSURLRequest::timeoutIntervalGetter) {
  JS_UNWRAP(NSURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self timeoutInterval]));
  }
}

NAN_GETTER(NNSURLRequest::mainDocumentURLGetter) {
  JS_UNWRAP(NSURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self mainDocumentURL]));
  }
}

NAN_GETTER(NNSURLRequest::networkServiceTypeGetter) {
  JS_UNWRAP(NSURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURLRequestNetworkServiceType([self networkServiceType]));
  }
}

NAN_GETTER(NNSURLRequest::allowsCellularAccessGetter) {
  JS_UNWRAP(NSURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsCellularAccess]));
  }
}

NAN_GETTER(NNSURLRequest::HTTPMethodGetter) {
  JS_UNWRAP(NSURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self HTTPMethod]));
  }
}

NAN_GETTER(NNSURLRequest::allHTTPHeaderFieldsGetter) {
  JS_UNWRAP(NSURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, NSString*>*/([self allHTTPHeaderFields]));
  }
}

NAN_GETTER(NNSURLRequest::HTTPBodyGetter) {
  JS_UNWRAP(NSURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self HTTPBody]));
  }
}

#include "NNSInputStream.h"

NAN_GETTER(NNSURLRequest::HTTPBodyStreamGetter) {
  JS_UNWRAP(NSURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInputStream([self HTTPBodyStream]));
  }
}

NAN_GETTER(NNSURLRequest::HTTPShouldHandleCookiesGetter) {
  JS_UNWRAP(NSURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self HTTPShouldHandleCookies]));
  }
}

NAN_GETTER(NNSURLRequest::HTTPShouldUsePipeliningGetter) {
  JS_UNWRAP(NSURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self HTTPShouldUsePipelining]));
  }
}
