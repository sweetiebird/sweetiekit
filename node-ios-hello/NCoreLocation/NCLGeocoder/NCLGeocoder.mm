//
//  CLGeocoder.mm
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCLGeocoder.h"

#define instancetype CLGeocoder
#define js_value_instancetype js_value_CLGeocoder

NCLGeocoder::NCLGeocoder() {}
NCLGeocoder::~NCLGeocoder() {}

JS_INIT_CLASS(CLGeocoder, NSObject);
  JS_ASSIGN_PROTO_METHOD(reverseGeocodeLocationCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(reverseGeocodeLocationPreferredLocaleCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(geocodeAddressDictionaryCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(geocodeAddressStringCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(geocodeAddressStringInRegionCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(geocodeAddressStringInRegionPreferredLocaleCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(cancelGeocode);
  JS_ASSIGN_PROTO_METHOD(geocodePostalAddressCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(geocodePostalAddressPreferredLocaleCompletionHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(isGeocoding);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CLGeocoder, NSObject);
JS_INIT_CLASS_END(CLGeocoder, NSObject);

NAN_METHOD(NCLGeocoder::New) {
  JS_RECONSTRUCT(CLGeocoder);
  @autoreleasepool {
    CLGeocoder* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CLGeocoder *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CLGeocoder alloc] init];
    }
    if (self) {
      NCLGeocoder *wrapper = new NCLGeocoder();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CLGeocoder::New: invalid arguments");
    }
  }
}

#include "NCLLocation.h"
#include "NNSError.h"

NAN_METHOD(NCLGeocoder::reverseGeocodeLocationCompletionHandler) {
  JS_UNWRAP(CLGeocoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CLLocation, location);
    declare_callback(completionHandler);
    [self reverseGeocodeLocation: location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NCLGeocoder::reverseGeocodeLocationCompletionHandler",
            js_value_NSArray(placemarks),
            js_value_NSError(error));
          clear_callback(completionHandler);
        }
      });
    }];
  }
}

#include "NNSLocale.h"

NAN_METHOD(NCLGeocoder::reverseGeocodeLocationPreferredLocaleCompletionHandler) {
  JS_UNWRAP(CLGeocoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CLLocation, location);
    declare_nullable_pointer(NSLocale, locale);
    declare_callback(completionHandler);
    [self reverseGeocodeLocation: location preferredLocale: locale completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NCLGeocoder::reverseGeocodeLocationPreferredLocaleCompletionHandler",
            js_value_NSArray(placemarks),
            js_value_NSError(error));
          clear_callback(completionHandler);
        }
      });
    }];
  }
}

NAN_METHOD(NCLGeocoder::geocodeAddressDictionaryCompletionHandler) {
  JS_UNWRAP(CLGeocoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDictionary, addressDictionary);
    declare_callback(completionHandler);
    [self geocodeAddressDictionary: addressDictionary completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NCLGeocoder::geocodeAddressDictionaryCompletionHandler",
            js_value_NSArray(placemarks),
            js_value_NSError(error));
          clear_callback(completionHandler);
        }
      });
    }];
  }
}

NAN_METHOD(NCLGeocoder::geocodeAddressStringCompletionHandler) {
  JS_UNWRAP(CLGeocoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, addressString);
    declare_callback(completionHandler);
    [self geocodeAddressString: addressString completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NCLGeocoder::geocodeAddressStringCompletionHandler",
            js_value_NSArray(placemarks),
            js_value_NSError(error));
          clear_callback(completionHandler);
        }
      });
    }];
  }
}

#include "NCLRegion.h"

NAN_METHOD(NCLGeocoder::geocodeAddressStringInRegionCompletionHandler) {
  JS_UNWRAP(CLGeocoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, addressString);
    declare_nullable_pointer(CLRegion, region);
    declare_callback(completionHandler);
    [self geocodeAddressString: addressString inRegion: region completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NCLGeocoder::geocodeAddressStringInRegionCompletionHandler",
            js_value_NSArray(placemarks),
            js_value_NSError(error));
          clear_callback(completionHandler);
        }
      });
    }];
  }
}

NAN_METHOD(NCLGeocoder::geocodeAddressStringInRegionPreferredLocaleCompletionHandler) {
  JS_UNWRAP(CLGeocoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, addressString);
    declare_nullable_pointer(CLRegion, region);
    declare_nullable_pointer(NSLocale, locale);
    declare_callback(completionHandler);
    [self geocodeAddressString: addressString inRegion: region preferredLocale: locale completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NCLGeocoder::geocodeAddressStringInRegionPreferredLocaleCompletionHandler",
            js_value_NSArray(placemarks),
            js_value_NSError(error));
          clear_callback(completionHandler);
        }
      });
    }];
  }
}

NAN_METHOD(NCLGeocoder::cancelGeocode) {
  JS_UNWRAP(CLGeocoder, self);
  declare_autoreleasepool {
    [self cancelGeocode];
  }
}

#include "NCNPostalAddress.h"

NAN_METHOD(NCLGeocoder::geocodePostalAddressCompletionHandler) {
  JS_UNWRAP(CLGeocoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CNPostalAddress, postalAddress);
    declare_callback(completionHandler);
    [self geocodePostalAddress: postalAddress completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NCLGeocoder::geocodePostalAddressCompletionHandler",
            js_value_NSArray(placemarks),
            js_value_NSError(error));
          clear_callback(completionHandler);
        }
      });
    }];
  }
}

NAN_METHOD(NCLGeocoder::geocodePostalAddressPreferredLocaleCompletionHandler) {
  JS_UNWRAP(CLGeocoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CNPostalAddress, postalAddress);
    declare_nullable_pointer(NSLocale, locale);
    declare_callback(completionHandler);
    [self geocodePostalAddress: postalAddress preferredLocale: locale completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NCLGeocoder::geocodePostalAddressPreferredLocaleCompletionHandler",
            js_value_NSArray(placemarks),
            js_value_NSError(error));
          clear_callback(completionHandler);
        }
      });
    }];
  }
}

NAN_GETTER(NCLGeocoder::isGeocodingGetter) {
  JS_UNWRAP(CLGeocoder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isGeocoding]));
  }
}
