//
//  NCNPostalAddress.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCNPostalAddress.h"

#define instancetype CNPostalAddress
#define js_value_instancetype js_value_CNPostalAddress

NCNPostalAddress::NCNPostalAddress() {}
NCNPostalAddress::~NCNPostalAddress() {}

JS_INIT_CLASS(CNPostalAddress, NSObject);
  JS_ASSIGN_STATIC_METHOD(localizedStringForKey);
  JS_ASSIGN_PROTO_PROP_READONLY(street);
  JS_ASSIGN_PROTO_PROP_READONLY(subLocality);
  JS_ASSIGN_PROTO_PROP_READONLY(city);
  JS_ASSIGN_PROTO_PROP_READONLY(subAdministrativeArea);
  JS_ASSIGN_PROTO_PROP_READONLY(state);
  JS_ASSIGN_PROTO_PROP_READONLY(postalCode);
  JS_ASSIGN_PROTO_PROP_READONLY(country);
  JS_ASSIGN_PROTO_PROP_READONLY(ISOCountryCode);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CNPostalAddress, NSObject);
  // constant values (exports)

  JS_ASSIGN_ENUM(CNPostalAddressStreetKey, NSString);
  JS_ASSIGN_ENUM(CNPostalAddressSubLocalityKey, NSString);
  JS_ASSIGN_ENUM(CNPostalAddressCityKey, NSString);
  JS_ASSIGN_ENUM(CNPostalAddressSubAdministrativeAreaKey, NSString);
  JS_ASSIGN_ENUM(CNPostalAddressStateKey, NSString);
  JS_ASSIGN_ENUM(CNPostalAddressPostalCodeKey, NSString);
  JS_ASSIGN_ENUM(CNPostalAddressCountryKey, NSString);
  JS_ASSIGN_ENUM(CNPostalAddressISOCountryCodeKey, NSString);

JS_INIT_CLASS_END(CNPostalAddress, NSObject);

NAN_METHOD(NCNPostalAddress::New) {
  JS_RECONSTRUCT(CNPostalAddress);
  @autoreleasepool {
    CNPostalAddress* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CNPostalAddress *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CNPostalAddress alloc] init];
    }
    if (self) {
      NCNPostalAddress *wrapper = new NCNPostalAddress();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CNPostalAddress::New: invalid arguments");
    }
  }
}

NAN_METHOD(NCNPostalAddress::localizedStringForKey) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_NSString([CNPostalAddress localizedStringForKey: key]));
  }
}

NAN_GETTER(NCNPostalAddress::streetGetter) {
  JS_UNWRAP(CNPostalAddress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self street]));
  }
}

NAN_GETTER(NCNPostalAddress::subLocalityGetter) {
  JS_UNWRAP(CNPostalAddress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self subLocality]));
  }
}

NAN_GETTER(NCNPostalAddress::cityGetter) {
  JS_UNWRAP(CNPostalAddress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self city]));
  }
}

NAN_GETTER(NCNPostalAddress::subAdministrativeAreaGetter) {
  JS_UNWRAP(CNPostalAddress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self subAdministrativeArea]));
  }
}

NAN_GETTER(NCNPostalAddress::stateGetter) {
  JS_UNWRAP(CNPostalAddress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self state]));
  }
}

NAN_GETTER(NCNPostalAddress::postalCodeGetter) {
  JS_UNWRAP(CNPostalAddress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self postalCode]));
  }
}

NAN_GETTER(NCNPostalAddress::countryGetter) {
  JS_UNWRAP(CNPostalAddress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self country]));
  }
}

NAN_GETTER(NCNPostalAddress::ISOCountryCodeGetter) {
  JS_UNWRAP(CNPostalAddress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self ISOCountryCode]));
  }
}
