//
//  NNSURLProtectionSpace.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSURLProtectionSpace.h"

#define instancetype NSURLProtectionSpace
#define js_value_instancetype js_value_NSURLProtectionSpace

NNSURLProtectionSpace::NNSURLProtectionSpace() {}
NNSURLProtectionSpace::~NNSURLProtectionSpace() {}

JS_INIT_CLASS(NSURLProtectionSpace, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithHostPortProtocolRealmAuthenticationMethod);
  JS_ASSIGN_PROTO_METHOD(initWithProxyHostPortTypeRealmAuthenticationMethod);
  JS_ASSIGN_PROTO_PROP_READONLY(realm);
  JS_ASSIGN_PROTO_PROP_READONLY(receivesCredentialSecurely);
  JS_ASSIGN_PROTO_PROP_READONLY(isProxy);
  JS_ASSIGN_PROTO_PROP_READONLY(host);
  JS_ASSIGN_PROTO_PROP_READONLY(port);
  JS_ASSIGN_PROTO_PROP_READONLY(proxyType);
  JS_ASSIGN_PROTO_PROP_READONLY(protocol);
  JS_ASSIGN_PROTO_PROP_READONLY(authenticationMethod);
  JS_ASSIGN_PROTO_PROP_READONLY(distinguishedNames);
  JS_ASSIGN_PROTO_PROP_READONLY(serverTrust);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSURLProtectionSpace, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(NSURLProtectionSpace, NSObject);

NAN_METHOD(NNSURLProtectionSpace::New) {
  JS_RECONSTRUCT(NSURLProtectionSpace);
  @autoreleasepool {
    NSURLProtectionSpace* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSURLProtectionSpace *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSURLProtectionSpace alloc] init];
    }
    if (self) {
      NNSURLProtectionSpace *wrapper = new NNSURLProtectionSpace();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSURLProtectionSpace::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSURLProtectionSpace::initWithHostPortProtocolRealmAuthenticationMethod) {
  JS_UNWRAP_OR_ALLOC(NSURLProtectionSpace, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, host);
    declare_value(NSInteger, port);
    declare_nullable_pointer(NSString, protocol);
    declare_nullable_pointer(NSString, realm);
    declare_nullable_pointer(NSString, authenticationMethod);
    JS_SET_RETURN(js_value_instancetype([self initWithHost: host port: port protocol: protocol realm: realm authenticationMethod: authenticationMethod]));
  }
}

NAN_METHOD(NNSURLProtectionSpace::initWithProxyHostPortTypeRealmAuthenticationMethod) {
  JS_UNWRAP_OR_ALLOC(NSURLProtectionSpace, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, host);
    declare_value(NSInteger, port);
    declare_nullable_pointer(NSString, type);
    declare_nullable_pointer(NSString, realm);
    declare_nullable_pointer(NSString, authenticationMethod);
    JS_SET_RETURN(js_value_instancetype([self initWithProxyHost: host port: port type: type realm: realm authenticationMethod: authenticationMethod]));
  }
}

NAN_GETTER(NNSURLProtectionSpace::realmGetter) {
  JS_UNWRAP(NSURLProtectionSpace, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self realm]));
  }
}

NAN_GETTER(NNSURLProtectionSpace::receivesCredentialSecurelyGetter) {
  JS_UNWRAP(NSURLProtectionSpace, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self receivesCredentialSecurely]));
  }
}

NAN_GETTER(NNSURLProtectionSpace::isProxyGetter) {
  JS_UNWRAP(NSURLProtectionSpace, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isProxy]));
  }
}

NAN_GETTER(NNSURLProtectionSpace::hostGetter) {
  JS_UNWRAP(NSURLProtectionSpace, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self host]));
  }
}

NAN_GETTER(NNSURLProtectionSpace::portGetter) {
  JS_UNWRAP(NSURLProtectionSpace, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self port]));
  }
}

NAN_GETTER(NNSURLProtectionSpace::proxyTypeGetter) {
  JS_UNWRAP(NSURLProtectionSpace, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self proxyType]));
  }
}

NAN_GETTER(NNSURLProtectionSpace::protocolGetter) {
  JS_UNWRAP(NSURLProtectionSpace, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self protocol]));
  }
}

NAN_GETTER(NNSURLProtectionSpace::authenticationMethodGetter) {
  JS_UNWRAP(NSURLProtectionSpace, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self authenticationMethod]));
  }
}

NAN_GETTER(NNSURLProtectionSpace::distinguishedNamesGetter) {
  JS_UNWRAP(NSURLProtectionSpace, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSData*>([self distinguishedNames]));
  }
}

#include "NSecBase.h"

NAN_GETTER(NNSURLProtectionSpace::serverTrustGetter) {
  JS_UNWRAP(NSURLProtectionSpace, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SecTrustRef([self serverTrust]));
  }
}
