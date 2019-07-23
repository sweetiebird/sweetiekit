//
//  NVNFeaturePrintObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNFeaturePrintObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNFeaturePrintObservation
#define js_value_instancetype js_value_VNFeaturePrintObservation

NVNFeaturePrintObservation::NVNFeaturePrintObservation() {}
NVNFeaturePrintObservation::~NVNFeaturePrintObservation() {}

JS_INIT_CLASS(VNFeaturePrintObservation, VNObservation);
  JS_ASSIGN_PROTO_METHOD(computeDistanceToFeaturePrintObservationError);
  JS_ASSIGN_PROTO_PROP_READONLY(elementType);
  JS_ASSIGN_PROTO_PROP_READONLY(elementCount);
  JS_ASSIGN_PROTO_PROP_READONLY(data);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNFeaturePrintObservation, VNObservation);
  // constant values (exports)
JS_INIT_CLASS_END(VNFeaturePrintObservation, VNObservation);

NAN_METHOD(NVNFeaturePrintObservation::New) {
  JS_RECONSTRUCT(VNFeaturePrintObservation);
  @autoreleasepool {
    VNFeaturePrintObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNFeaturePrintObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNFeaturePrintObservation alloc] init];
    }
    if (self) {
      NVNFeaturePrintObservation *wrapper = new NVNFeaturePrintObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNFeaturePrintObservation::New: invalid arguments");
    }
  }
}

NAN_METHOD(NVNFeaturePrintObservation::computeDistanceToFeaturePrintObservationError) {
  JS_UNWRAP(VNFeaturePrintObservation, self);
  declare_autoreleasepool {
    declare_args();
    declare_value_pointer(float, outDistance);
    declare_pointer(VNFeaturePrintObservation, featurePrint);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self computeDistance: outDistance toFeaturePrintObservation: featurePrint error: &error]));
    js_panic_NSError(error);
    if (outDistance) {
      outDistanceObj->Set(JS_STR("value"), js_value_float(*outDistance));
    }
  }
}

#include "NVNTypes.h"

NAN_GETTER(NVNFeaturePrintObservation::elementTypeGetter) {
  JS_UNWRAP(VNFeaturePrintObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_VNElementType([self elementType]));
  }
}

NAN_GETTER(NVNFeaturePrintObservation::elementCountGetter) {
  JS_UNWRAP(VNFeaturePrintObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self elementCount]));
  }
}

NAN_GETTER(NVNFeaturePrintObservation::dataGetter) {
  JS_UNWRAP(VNFeaturePrintObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self data]));
  }
}

