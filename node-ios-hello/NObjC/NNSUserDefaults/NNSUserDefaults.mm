//
//  NNSUserDefaults.mm
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSUserDefaults.h"

#define instancetype NSUserDefaults
#define js_value_instancetype js_value_NSUserDefaults

NNSUserDefaults::NNSUserDefaults () {}
NNSUserDefaults::~NNSUserDefaults () {}

JS_INIT_CLASS(NSUserDefaults, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(objectForKey);
  JS_ASSIGN_PROTO_METHOD(setObjectForKey);
  JS_ASSIGN_PROTO_METHOD(removeObjectForKey);
  JS_ASSIGN_PROTO_METHOD_AS(objectForKey, "valueForKey");
  JS_ASSIGN_PROTO_METHOD_AS(setObjectForKey, "setValueForKey");
  JS_ASSIGN_PROTO_METHOD_AS(removeObjectForKey, "removeObjectForKey");
  JS_ASSIGN_PROTO_METHOD(stringForKey);
  JS_ASSIGN_PROTO_METHOD(arrayForKey);
  JS_ASSIGN_PROTO_METHOD(dictionaryForKey);
  JS_ASSIGN_PROTO_METHOD(dataForKey);
  JS_ASSIGN_PROTO_METHOD(stringArrayForKey);
  JS_ASSIGN_PROTO_METHOD(integerForKey);
  JS_ASSIGN_PROTO_METHOD(floatForKey);
  JS_ASSIGN_PROTO_METHOD(doubleForKey);
  JS_ASSIGN_PROTO_METHOD(boolForKey);
  JS_ASSIGN_PROTO_METHOD(URLForKey);
  JS_ASSIGN_PROTO_METHOD(setIntegerForKey);
  JS_ASSIGN_PROTO_METHOD(setFloatForKey);
  JS_ASSIGN_PROTO_METHOD(setDoubleForKey);
  JS_ASSIGN_PROTO_METHOD(setBoolForKey);
  JS_ASSIGN_PROTO_METHOD(setURLForKey);
  JS_ASSIGN_PROTO_METHOD(registerDefaults);
  JS_ASSIGN_PROTO_METHOD(addSuiteNamed);
  JS_ASSIGN_PROTO_METHOD(removeSuiteNamed);
  JS_ASSIGN_PROTO_METHOD(dictionaryRepresentation);
  JS_ASSIGN_PROTO_METHOD(volatileDomainForName);
  JS_ASSIGN_PROTO_METHOD(setVolatileDomainForName);
  JS_ASSIGN_PROTO_METHOD(removeVolatileDomainForName);
  JS_ASSIGN_PROTO_METHOD(persistentDomainNames);
  JS_ASSIGN_PROTO_METHOD(persistentDomainForName);
  JS_ASSIGN_PROTO_METHOD(setPersistentDomainForName);
  JS_ASSIGN_PROTO_METHOD(removePersistentDomainForName);
  JS_ASSIGN_PROTO_METHOD(synchronize);
  JS_ASSIGN_PROTO_METHOD(objectIsForcedForKey);
  JS_ASSIGN_PROTO_METHOD(objectIsForcedForKeyInDomain);
  JS_ASSIGN_PROTO_PROP_READONLY(volatileDomainNames);

  // static members (ctor)
  JS_INIT_CTOR(NSUserDefaults, NSObject);
  JS_ASSIGN_STATIC_METHOD(resetStandardUserDefaults);
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_STATIC_METHOD(initWithSuiteName);
  JS_ASSIGN_STATIC_METHOD(initWithUser);
  JS_ASSIGN_STATIC_PROP_READONLY(standardUserDefaults);

JS_INIT_CLASS_END(NSUserDefaults, NSObject);

NAN_METHOD(NNSUserDefaults::New) {
  JS_RECONSTRUCT(NSUserDefaults);

  Local<Object> obj = info.This();

  NNSUserDefaults *app = new NNSUserDefaults();

  if (info[0]->IsExternal()) {
    app->SetNSObject((__bridge NSUserDefaults *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          app->SetNSObject([[NSUserDefaults alloc] init]);
      });
    }
  }
  app->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_METHOD(NNSUserDefaults::resetStandardUserDefaults) {
  declare_autoreleasepool {
    [NSUserDefaults resetStandardUserDefaults];
  }
}

NAN_METHOD(NNSUserDefaults::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[NSUserDefaults alloc] init]));
  }
}

NAN_METHOD(NNSUserDefaults::initWithSuiteName) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, suitename);
    JS_SET_RETURN(js_value_instancetype([[NSUserDefaults alloc] initWithSuiteName: suitename]));
  }
}

NAN_METHOD(NNSUserDefaults::initWithUser) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, username);
    JS_SET_RETURN(js_value_id([[NSUserDefaults alloc] initWithUser: username]));
  }
}

NAN_METHOD(NNSUserDefaults::objectForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, defaultName);
    JS_SET_RETURN(js_value_id([self objectForKey: defaultName]));
  }
}

NAN_METHOD(NNSUserDefaults::setObjectForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, value);
    declare_pointer(NSString, defaultName);
    [self setObject: value forKey: defaultName];
  }
}

NAN_METHOD(NNSUserDefaults::removeObjectForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, defaultName);
    [self removeObjectForKey: defaultName];
  }
}

NAN_METHOD(NNSUserDefaults::stringForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, defaultName);
    JS_SET_RETURN(js_value_NSString([self stringForKey: defaultName]));
  }
}

NAN_METHOD(NNSUserDefaults::arrayForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, defaultName);
    JS_SET_RETURN(js_value_NSArray([self arrayForKey: defaultName]));
  }
}

NAN_METHOD(NNSUserDefaults::dictionaryForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, defaultName);
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, id>*/([self dictionaryForKey: defaultName]));
  }
}

NAN_METHOD(NNSUserDefaults::dataForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, defaultName);
    JS_SET_RETURN(js_value_NSData([self dataForKey: defaultName]));
  }
}

NAN_METHOD(NNSUserDefaults::stringArrayForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, defaultName);
    JS_SET_RETURN(js_value_NSArray<NSString*>([self stringArrayForKey: defaultName]));
  }
}

NAN_METHOD(NNSUserDefaults::integerForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, defaultName);
    JS_SET_RETURN(js_value_NSInteger([self integerForKey: defaultName]));
  }
}

NAN_METHOD(NNSUserDefaults::floatForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, defaultName);
    JS_SET_RETURN(js_value_float([self floatForKey: defaultName]));
  }
}

NAN_METHOD(NNSUserDefaults::doubleForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, defaultName);
    JS_SET_RETURN(js_value_double([self doubleForKey: defaultName]));
  }
}

NAN_METHOD(NNSUserDefaults::boolForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, defaultName);
    JS_SET_RETURN(js_value_BOOL([self boolForKey: defaultName]));
  }
}

#include "NNSURL.h"

NAN_METHOD(NNSUserDefaults::URLForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, defaultName);
    JS_SET_RETURN(js_value_NSURL([self URLForKey: defaultName]));
  }
}

NAN_METHOD(NNSUserDefaults::setIntegerForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, value);
    declare_pointer(NSString, defaultName);
    [self setInteger: value forKey: defaultName];
  }
}

NAN_METHOD(NNSUserDefaults::setFloatForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, value);
    declare_pointer(NSString, defaultName);
    [self setFloat: value forKey: defaultName];
  }
}

NAN_METHOD(NNSUserDefaults::setDoubleForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(double, value);
    declare_pointer(NSString, defaultName);
    [self setDouble: value forKey: defaultName];
  }
}

NAN_METHOD(NNSUserDefaults::setBoolForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, value);
    declare_pointer(NSString, defaultName);
    [self setBool: value forKey: defaultName];
  }
}

NAN_METHOD(NNSUserDefaults::setURLForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSURL, url);
    declare_pointer(NSString, defaultName);
    [self setURL: url forKey: defaultName];
  }
}

NAN_METHOD(NNSUserDefaults::registerDefaults) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDictionary/* <NSString*, id>*/, registrationDictionary);
    [self registerDefaults: registrationDictionary];
  }
}

NAN_METHOD(NNSUserDefaults::addSuiteNamed) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, suiteName);
    [self addSuiteNamed: suiteName];
  }
}

NAN_METHOD(NNSUserDefaults::removeSuiteNamed) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, suiteName);
    [self removeSuiteNamed: suiteName];
  }
}

NAN_METHOD(NNSUserDefaults::dictionaryRepresentation) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, id>*/([self dictionaryRepresentation]));
  }
}

NAN_METHOD(NNSUserDefaults::volatileDomainForName) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, domainName);
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, id>*/([self volatileDomainForName: domainName]));
  }
}

NAN_METHOD(NNSUserDefaults::setVolatileDomainForName) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDictionary/* <NSString*, id>*/, domain);
    declare_pointer(NSString, domainName);
    [self setVolatileDomain: domain forName: domainName];
  }
}

NAN_METHOD(NNSUserDefaults::removeVolatileDomainForName) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, domainName);
    [self removeVolatileDomainForName: domainName];
  }
}

NAN_METHOD(NNSUserDefaults::persistentDomainNames) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray([self persistentDomainNames]));
  }
}

NAN_METHOD(NNSUserDefaults::persistentDomainForName) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, domainName);
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, id>*/([self persistentDomainForName: domainName]));
  }
}

NAN_METHOD(NNSUserDefaults::setPersistentDomainForName) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDictionary/* <NSString*, id>*/, domain);
    declare_pointer(NSString, domainName);
    [self setPersistentDomain: domain forName: domainName];
  }
}

NAN_METHOD(NNSUserDefaults::removePersistentDomainForName) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, domainName);
    [self removePersistentDomainForName: domainName];
  }
}

NAN_METHOD(NNSUserDefaults::synchronize) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self synchronize]));
  }
}

NAN_METHOD(NNSUserDefaults::objectIsForcedForKey) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_BOOL([self objectIsForcedForKey: key]));
  }
}

NAN_METHOD(NNSUserDefaults::objectIsForcedForKeyInDomain) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    declare_pointer(NSString, domain);
    JS_SET_RETURN(js_value_BOOL([self objectIsForcedForKey: key inDomain: domain]));
  }
}

NAN_GETTER(NNSUserDefaults::standardUserDefaultsGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUserDefaults([NSUserDefaults standardUserDefaults]));
  }
}

NAN_GETTER(NNSUserDefaults::volatileDomainNamesGetter) {
  JS_UNWRAP(NSUserDefaults, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self volatileDomainNames]));
  }
}
