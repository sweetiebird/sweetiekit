//
//  NNSMutableURLRequest.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSMutableURLRequest.h"

#define instancetype NSMutableURLRequest
#define js_value_instancetype js_value_NSMutableURLRequest

NNSMutableURLRequest::NNSMutableURLRequest() {}
NNSMutableURLRequest::~NNSMutableURLRequest() {}

JS_INIT_CLASS(NSMutableURLRequest, NSURLRequest);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(setValueForHTTPHeaderField);
  JS_ASSIGN_PROTO_METHOD(addValueForHTTPHeaderField);
  JS_ASSIGN_PROTO_PROP(URL);
  JS_ASSIGN_PROTO_PROP(cachePolicy);
  JS_ASSIGN_PROTO_PROP(timeoutInterval);
  JS_ASSIGN_PROTO_PROP(mainDocumentURL);
  JS_ASSIGN_PROTO_PROP(networkServiceType);
  JS_ASSIGN_PROTO_PROP(allowsCellularAccess);
  JS_ASSIGN_PROTO_PROP(HTTPMethod);
  JS_ASSIGN_PROTO_PROP(allHTTPHeaderFields);
  JS_ASSIGN_PROTO_PROP(HTTPBody);
  JS_ASSIGN_PROTO_PROP(HTTPBodyStream);
  JS_ASSIGN_PROTO_PROP(HTTPShouldHandleCookies);
  JS_ASSIGN_PROTO_PROP(HTTPShouldUsePipelining);

  // static members (ctor)
  JS_INIT_CTOR(NSMutableURLRequest, NSURLRequest);
JS_INIT_CLASS_END(NSMutableURLRequest, NSURLRequest);

NAN_METHOD(NNSMutableURLRequest::New) {
  JS_RECONSTRUCT(NSMutableURLRequest);
  @autoreleasepool {
    NSMutableURLRequest* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSMutableURLRequest *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSMutableURLRequest alloc] init];
    }
    if (self) {
      NNSMutableURLRequest *wrapper = new NNSMutableURLRequest();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSMutableURLRequest::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSMutableURLRequest::setValueForHTTPHeaderField) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, value);
    declare_pointer(NSString, field);
    [self setValue: value forHTTPHeaderField: field];
  }
}

NAN_METHOD(NNSMutableURLRequest::addValueForHTTPHeaderField) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, value);
    declare_pointer(NSString, field);
    [self addValue: value forHTTPHeaderField: field];
  }
}

#include "NNSURL.h"

NAN_GETTER(NNSMutableURLRequest::URLGetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self URL]));
  }
}

NAN_SETTER(NNSMutableURLRequest::URLSetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSURL, input);
    [self setURL: input];
  }
}

NAN_GETTER(NNSMutableURLRequest::cachePolicyGetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURLRequestCachePolicy([self cachePolicy]));
  }
}

NAN_SETTER(NNSMutableURLRequest::cachePolicySetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSURLRequestCachePolicy, input);
    [self setCachePolicy: input];
  }
}

NAN_GETTER(NNSMutableURLRequest::timeoutIntervalGetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self timeoutInterval]));
  }
}

NAN_SETTER(NNSMutableURLRequest::timeoutIntervalSetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTimeInterval, input);
    [self setTimeoutInterval: input];
  }
}

NAN_GETTER(NNSMutableURLRequest::mainDocumentURLGetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self mainDocumentURL]));
  }
}

NAN_SETTER(NNSMutableURLRequest::mainDocumentURLSetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSURL, input);
    [self setMainDocumentURL: input];
  }
}

NAN_GETTER(NNSMutableURLRequest::networkServiceTypeGetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURLRequestNetworkServiceType([self networkServiceType]));
  }
}

NAN_SETTER(NNSMutableURLRequest::networkServiceTypeSetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSURLRequestNetworkServiceType, input);
    [self setNetworkServiceType: input];
  }
}

NAN_GETTER(NNSMutableURLRequest::allowsCellularAccessGetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsCellularAccess]));
  }
}

NAN_SETTER(NNSMutableURLRequest::allowsCellularAccessSetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsCellularAccess: input];
  }
}

NAN_GETTER(NNSMutableURLRequest::HTTPMethodGetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self HTTPMethod]));
  }
}

NAN_SETTER(NNSMutableURLRequest::HTTPMethodSetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setHTTPMethod: input];
  }
}

NAN_GETTER(NNSMutableURLRequest::allHTTPHeaderFieldsGetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, NSString*>*/([self allHTTPHeaderFields]));
  }
}

NAN_SETTER(NNSMutableURLRequest::allHTTPHeaderFieldsSetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary/* <NSString*, NSString*>*/, input);
    [self setAllHTTPHeaderFields: input];
  }
}

NAN_GETTER(NNSMutableURLRequest::HTTPBodyGetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self HTTPBody]));
  }
}

NAN_SETTER(NNSMutableURLRequest::HTTPBodySetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSData, input);
    [self setHTTPBody: input];
  }
}

#include "NNSInputStream.h"

NAN_GETTER(NNSMutableURLRequest::HTTPBodyStreamGetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInputStream([self HTTPBodyStream]));
  }
}

NAN_SETTER(NNSMutableURLRequest::HTTPBodyStreamSetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSInputStream, input);
    [self setHTTPBodyStream: input];
  }
}

NAN_GETTER(NNSMutableURLRequest::HTTPShouldHandleCookiesGetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self HTTPShouldHandleCookies]));
  }
}

NAN_SETTER(NNSMutableURLRequest::HTTPShouldHandleCookiesSetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHTTPShouldHandleCookies: input];
  }
}

NAN_GETTER(NNSMutableURLRequest::HTTPShouldUsePipeliningGetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self HTTPShouldUsePipelining]));
  }
}

NAN_SETTER(NNSMutableURLRequest::HTTPShouldUsePipeliningSetter) {
  JS_UNWRAP(NSMutableURLRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHTTPShouldUsePipelining: input];
  }
}
