//
//  NNSURLResponse.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSURLResponse.h"

#define instancetype NSURLResponse
#define js_value_instancetype js_value_NSURLResponse

NNSURLResponse::NNSURLResponse() {}
NNSURLResponse::~NNSURLResponse() {}

JS_INIT_CLASS(NSURLResponse, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithURLMIMETypeExpectedContentLengthTextEncodingName);
  JS_ASSIGN_PROTO_PROP_READONLY(URL);
  JS_ASSIGN_PROTO_PROP_READONLY(MIMEType);
  JS_ASSIGN_PROTO_PROP_READONLY(expectedContentLength);
  JS_ASSIGN_PROTO_PROP_READONLY(textEncodingName);
  JS_ASSIGN_PROTO_PROP_READONLY(suggestedFilename);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSURLResponse, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(NSURLResponse, NSObject);

NAN_METHOD(NNSURLResponse::New) {
  JS_RECONSTRUCT(NSURLResponse);
  @autoreleasepool {
    NSURLResponse* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSURLResponse *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSURLResponse alloc] init];
    }
    if (self) {
      NNSURLResponse *wrapper = new NNSURLResponse();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSURLResponse::New: invalid arguments");
    }
  }
}

#include "NNSURL.h"

NAN_METHOD(NNSURLResponse::initWithURLMIMETypeExpectedContentLengthTextEncodingName) {
  JS_UNWRAP_OR_ALLOC(NSURLResponse, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, URL);
    declare_nullable_pointer(NSString, MIMEType);
    declare_value(NSInteger, length);
    declare_nullable_pointer(NSString, name);
    JS_SET_RETURN(js_value_instancetype([self initWithURL: URL MIMEType: MIMEType expectedContentLength: length textEncodingName: name]));
  }
}

NAN_GETTER(NNSURLResponse::URLGetter) {
  JS_UNWRAP(NSURLResponse, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self URL]));
  }
}

NAN_GETTER(NNSURLResponse::MIMETypeGetter) {
  JS_UNWRAP(NSURLResponse, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self MIMEType]));
  }
}

NAN_GETTER(NNSURLResponse::expectedContentLengthGetter) {
  JS_UNWRAP(NSURLResponse, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_int64_t([self expectedContentLength]));
  }
}

NAN_GETTER(NNSURLResponse::textEncodingNameGetter) {
  JS_UNWRAP(NSURLResponse, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self textEncodingName]));
  }
}

NAN_GETTER(NNSURLResponse::suggestedFilenameGetter) {
  JS_UNWRAP(NSURLResponse, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self suggestedFilename]));
  }
}
