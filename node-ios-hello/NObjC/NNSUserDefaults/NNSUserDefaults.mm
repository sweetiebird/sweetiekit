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
  JS_ASSIGN_METHOD(proto, objectForKey);
  JS_SET_METHOD(proto, "valueForKey", objectForKey);
  JS_ASSIGN_METHOD(proto, setObjectForKey);
  JS_SET_METHOD(proto, "setValueForKey", setObjectForKey);
  JS_ASSIGN_METHOD(proto, removeObjectForKey);
  JS_SET_METHOD(proto, "removeValueForKey", removeObjectForKey);
  JS_ASSIGN_METHOD(proto, stringForKey);
  JS_ASSIGN_METHOD(proto, arrayForKey);
  JS_ASSIGN_METHOD(proto, dictionaryForKey);
  JS_ASSIGN_METHOD(proto, dataForKey);
  JS_ASSIGN_METHOD(proto, stringArrayForKey);
  JS_ASSIGN_METHOD(proto, integerForKey);
  JS_ASSIGN_METHOD(proto, floatForKey);
  JS_ASSIGN_METHOD(proto, doubleForKey);
  JS_ASSIGN_METHOD(proto, boolForKey);
  JS_ASSIGN_METHOD(proto, URLForKey);
  JS_ASSIGN_METHOD(proto, setIntegerForKey);
  JS_ASSIGN_METHOD(proto, setFloatForKey);
  JS_ASSIGN_METHOD(proto, setDoubleForKey);
  JS_ASSIGN_METHOD(proto, setBoolForKey);
  JS_ASSIGN_METHOD(proto, setURLForKey);
  JS_ASSIGN_METHOD(proto, registerDefaults);
  JS_ASSIGN_METHOD(proto, addSuiteNamed);
  JS_ASSIGN_METHOD(proto, removeSuiteNamed);
  JS_ASSIGN_METHOD(proto, dictionaryRepresentation);
  JS_ASSIGN_METHOD(proto, volatileDomainForName);
  JS_ASSIGN_METHOD(proto, setVolatileDomainForName);
  JS_ASSIGN_METHOD(proto, removeVolatileDomainForName);
  JS_ASSIGN_METHOD(proto, persistentDomainNames);
  JS_ASSIGN_METHOD(proto, persistentDomainForName);
  JS_ASSIGN_METHOD(proto, setPersistentDomainForName);
  JS_ASSIGN_METHOD(proto, removePersistentDomainForName);
  JS_ASSIGN_METHOD(proto, synchronize);
  JS_ASSIGN_METHOD(proto, objectIsForcedForKey);
  JS_ASSIGN_METHOD(proto, objectIsForcedForKeyInDomain);
  JS_ASSIGN_PROP_READONLY(proto, volatileDomainNames);

  // static members (ctor)
  JS_INIT_CTOR(NSUserDefaults, NSObject);
  JS_ASSIGN_METHOD(ctor, resetStandardUserDefaults);
  JS_ASSIGN_METHOD(ctor, init);
  JS_ASSIGN_METHOD(ctor, initWithSuiteName);
  JS_ASSIGN_METHOD(ctor, initWithUser);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctor), standardUserDefaults);
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


