//
//  CLPlacemark.mm
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCLPlacemark.h"
#include "NCLLocation.h"

#define instancetype CLPlacemark
#define js_value_instancetype js_value_CLPlacemark

NCLPlacemark::NCLPlacemark () {}
NCLPlacemark::~NCLPlacemark () {}

JS_INIT_CLASS(CLPlacemark, NSObject);
  JS_ASSIGN_STATIC_METHOD(initWithPlacemark);
  JS_ASSIGN_PROTO_PROP_READONLY(location);
  JS_ASSIGN_PROTO_PROP_READONLY(region);
  JS_ASSIGN_PROTO_PROP_READONLY(timeZone);
  JS_ASSIGN_PROTO_PROP_READONLY(name);
  JS_ASSIGN_PROTO_PROP_READONLY(thoroughfare);
  JS_ASSIGN_PROTO_PROP_READONLY(subThoroughfare);
  JS_ASSIGN_PROTO_PROP_READONLY(locality);
  JS_ASSIGN_PROTO_PROP_READONLY(subLocality);
  JS_ASSIGN_PROTO_PROP_READONLY(administrativeArea);
  JS_ASSIGN_PROTO_PROP_READONLY(subAdministrativeArea);
  JS_ASSIGN_PROTO_PROP_READONLY(postalCode);
  JS_ASSIGN_PROTO_PROP_READONLY(ISOcountryCode);
  JS_ASSIGN_PROTO_PROP_READONLY(country);
  JS_ASSIGN_PROTO_PROP_READONLY(inlandWater);
  JS_ASSIGN_PROTO_PROP_READONLY(ocean);
  JS_ASSIGN_PROTO_PROP_READONLY(areasOfInterest);
  JS_ASSIGN_PROTO_PROP_READONLY(postalAddress);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CLPlacemark, NSObject);
JS_INIT_CLASS_END(CLPlacemark, NSObject);

NAN_METHOD(NCLPlacemark::New) {
  JS_RECONSTRUCT(CLPlacemark);
  @autoreleasepool {
    CLPlacemark* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CLPlacemark *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CLPlacemark alloc] init];
    }
    if (self) {
      NCLPlacemark *wrapper = new NCLPlacemark();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CLPlacemark::New: invalid arguments");
    }
  }
}

NAN_METHOD(NCLPlacemark::initWithPlacemark) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CLPlacemark, placemark);
    JS_SET_RETURN(js_value_instancetype([[CLPlacemark alloc] initWithPlacemark: placemark]));
  }
}

NAN_GETTER(NCLPlacemark::locationGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocation([self location]));
  }
}

#include "NCLRegion.h"

NAN_GETTER(NCLPlacemark::regionGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLRegion([self region]));
  }
}

#include "NNSTimeZone.h"

NAN_GETTER(NCLPlacemark::timeZoneGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeZone([self timeZone]));
  }
}

NAN_GETTER(NCLPlacemark::nameGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_GETTER(NCLPlacemark::thoroughfareGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self thoroughfare]));
  }
}

NAN_GETTER(NCLPlacemark::subThoroughfareGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self subThoroughfare]));
  }
}

NAN_GETTER(NCLPlacemark::localityGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self locality]));
  }
}

NAN_GETTER(NCLPlacemark::subLocalityGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self subLocality]));
  }
}

NAN_GETTER(NCLPlacemark::administrativeAreaGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self administrativeArea]));
  }
}

NAN_GETTER(NCLPlacemark::subAdministrativeAreaGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self subAdministrativeArea]));
  }
}

NAN_GETTER(NCLPlacemark::postalCodeGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self postalCode]));
  }
}

NAN_GETTER(NCLPlacemark::ISOcountryCodeGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self ISOcountryCode]));
  }
}

NAN_GETTER(NCLPlacemark::countryGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self country]));
  }
}

NAN_GETTER(NCLPlacemark::inlandWaterGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self inlandWater]));
  }
}

NAN_GETTER(NCLPlacemark::oceanGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self ocean]));
  }
}

NAN_GETTER(NCLPlacemark::areasOfInterestGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self areasOfInterest]));
  }
}

#include "NCNPostalAddress.h"

NAN_GETTER(NCLPlacemark::postalAddressGetter) {
  JS_UNWRAP(CLPlacemark, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CNPostalAddress([self postalAddress]));
  }
}

