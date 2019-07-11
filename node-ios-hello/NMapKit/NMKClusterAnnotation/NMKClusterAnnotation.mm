//
//  NMKClusterAnnotation.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMKClusterAnnotation.h"

#define instancetype MKClusterAnnotation
#define js_value_instancetype js_value_MKClusterAnnotation

NMKClusterAnnotation::NMKClusterAnnotation() {}
NMKClusterAnnotation::~NMKClusterAnnotation() {}

JS_INIT_CLASS(MKClusterAnnotation, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithMemberAnnotations);
  JS_ASSIGN_PROTO_PROP(title);
  JS_ASSIGN_PROTO_PROP(subtitle);
  JS_ASSIGN_PROTO_PROP_READONLY(memberAnnotations);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MKClusterAnnotation, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MKClusterAnnotation, NSObject);

NAN_METHOD(NMKClusterAnnotation::New) {
  JS_RECONSTRUCT(MKClusterAnnotation);
  @autoreleasepool {
    MKClusterAnnotation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MKClusterAnnotation *)(info[0].As<External>()->Value());
    }
    if (self) {
      NMKClusterAnnotation *wrapper = new NMKClusterAnnotation();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MKClusterAnnotation::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMKClusterAnnotation::initWithMemberAnnotations) {
  JS_UNWRAP_OR_ALLOC(MKClusterAnnotation, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<id<MKAnnotation>>, memberAnnotations);
    JS_SET_RETURN(js_value_instancetype([self initWithMemberAnnotations: memberAnnotations]));
  }
}

NAN_GETTER(NMKClusterAnnotation::titleGetter) {
  JS_UNWRAP(MKClusterAnnotation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self title]));
  }
}

NAN_SETTER(NMKClusterAnnotation::titleSetter) {
  JS_UNWRAP(MKClusterAnnotation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setTitle: input];
  }
}

NAN_GETTER(NMKClusterAnnotation::subtitleGetter) {
  JS_UNWRAP(MKClusterAnnotation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self subtitle]));
  }
}

NAN_SETTER(NMKClusterAnnotation::subtitleSetter) {
  JS_UNWRAP(MKClusterAnnotation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setSubtitle: input];
  }
}

NAN_GETTER(NMKClusterAnnotation::memberAnnotationsGetter) {
  JS_UNWRAP(MKClusterAnnotation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<id<MKAnnotation>>([self memberAnnotations]));
  }
}

