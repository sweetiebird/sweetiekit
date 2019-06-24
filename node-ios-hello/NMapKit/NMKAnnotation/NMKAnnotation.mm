//
//  NMKAnnotation.mm
//
//  Created by Shawn Presser on 6/23/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMKAnnotation.h"

#define instancetype MKAnnotation
#define js_value_instancetype js_value_MKAnnotation

NMKAnnotation::NMKAnnotation() {}
NMKAnnotation::~NMKAnnotation() {}

JS_INIT_CLASS(MKAnnotation, NSObject);
  JS_ASSIGN_PROTO_METHOD(setCoordinate);
  JS_ASSIGN_PROTO_PROP_READONLY(coordinate);
  JS_ASSIGN_PROTO_PROP_READONLY(title);
  JS_ASSIGN_PROTO_PROP_READONLY(subtitle);
  
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MKAnnotation, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MKAnnotation, NSObject);

#include "NCLLocation.h"

NAN_METHOD(NMKAnnotation::New) {
  JS_RECONSTRUCT(MKAnnotation);
  @autoreleasepool {
    MKAnnotation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MKAnnotation *)(info[0].As<External>()->Value());
    } else if (info[0]->IsObject()) {
      self = [[MKAnnotation alloc] init];
      if (is_value_CLLocationCoordinate2D(JS_OBJ(info[0])->Get(JS_STR("coordinate")))) {
        self.coordinate = to_value_CLLocationCoordinate2D(JS_OBJ(info[0])->Get(JS_STR("coordinate")));
      }
      if (is_value_NSString(JS_OBJ(info[0])->Get(JS_STR("title")))) {
        self.title = to_value_NSString(JS_OBJ(info[0])->Get(JS_STR("title")));
      }
      if (is_value_NSString(JS_OBJ(info[0])->Get(JS_STR("subtitle")))) {
        self.subtitle = to_value_NSString(JS_OBJ(info[0])->Get(JS_STR("subtitle")));
      }
    } else if (info.Length() <= 0) {
      self = [[MKAnnotation alloc] init];
    }
    if (self) {
      NMKAnnotation *wrapper = new NMKAnnotation();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MKAnnotation::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMKAnnotation::setCoordinate) {
  JS_UNWRAP(MKAnnotation, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CLLocationCoordinate2D, newCoordinate);
    [self setCoordinate: newCoordinate];
  }
}

NAN_GETTER(NMKAnnotation::coordinateGetter) {
  JS_UNWRAP(MKAnnotation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationCoordinate2D([self coordinate]));
  }
}

NAN_GETTER(NMKAnnotation::titleGetter) {
  JS_UNWRAP(MKAnnotation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self title]));
  }
}

NAN_GETTER(NMKAnnotation::subtitleGetter) {
  JS_UNWRAP(MKAnnotation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self subtitle]));
  }
}


@implementation MKAnnotation
@end
