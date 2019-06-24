//
//  NCLVisit.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCLVisit.h"
#import <CoreLocation/CLVisit.h>

#define instancetype CLVisit
#define js_value_instancetype js_value_CLVisit

NCLVisit::NCLVisit() {}
NCLVisit::~NCLVisit() {}

JS_INIT_CLASS(CLVisit, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(arrivalDate);
  JS_ASSIGN_PROTO_PROP_READONLY(departureDate);
  JS_ASSIGN_PROTO_PROP_READONLY(coordinate);
  JS_ASSIGN_PROTO_PROP_READONLY(horizontalAccuracy);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CLVisit, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(CLVisit, NSObject);

NAN_METHOD(NCLVisit::New) {
  JS_RECONSTRUCT(CLVisit);
  @autoreleasepool {
    CLVisit* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CLVisit *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CLVisit alloc] init];
    }
    if (self) {
      NCLVisit *wrapper = new NCLVisit();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CLVisit::New: invalid arguments");
    }
  }
}

NAN_GETTER(NCLVisit::arrivalDateGetter) {
  JS_UNWRAP(CLVisit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDate([self arrivalDate]));
  }
}

NAN_GETTER(NCLVisit::departureDateGetter) {
  JS_UNWRAP(CLVisit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDate([self departureDate]));
  }
}

#include "NCLLocation.h"

NAN_GETTER(NCLVisit::coordinateGetter) {
  JS_UNWRAP(CLVisit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationCoordinate2D([self coordinate]));
  }
}

NAN_GETTER(NCLVisit::horizontalAccuracyGetter) {
  JS_UNWRAP(CLVisit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationAccuracy([self horizontalAccuracy]));
  }
}
