//
//  NVNBarcodeObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNBarcodeObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNBarcodeObservation
#define js_value_instancetype js_value_VNBarcodeObservation

NVNBarcodeObservation::NVNBarcodeObservation() {}
NVNBarcodeObservation::~NVNBarcodeObservation() {}

JS_INIT_CLASS(VNBarcodeObservation, VNRectangleObservation);
  JS_ASSIGN_PROTO_PROP_READONLY(symbology);
  JS_ASSIGN_PROTO_PROP_READONLY(barcodeDescriptor);
  JS_ASSIGN_PROTO_PROP_READONLY(payloadStringValue);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNBarcodeObservation, VNRectangleObservation);
  // constant values (exports)
JS_INIT_CLASS_END(VNBarcodeObservation, VNRectangleObservation);

NAN_METHOD(NVNBarcodeObservation::New) {
  JS_RECONSTRUCT(VNBarcodeObservation);
  @autoreleasepool {
    VNBarcodeObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNBarcodeObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNBarcodeObservation alloc] init];
    }
    if (self) {
      NVNBarcodeObservation *wrapper = new NVNBarcodeObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNBarcodeObservation::New: invalid arguments");
    }
  }
}

#include "NVNTypes.h"

NAN_GETTER(NVNBarcodeObservation::symbologyGetter) {
  JS_UNWRAP(VNBarcodeObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_VNBarcodeSymbology([self symbology]));
  }
}

#define js_value_CIBarcodeDescriptor(x) js_value_wrapper_unknown(x, CIBarcodeDescriptor)
#define to_value_CIBarcodeDescriptor(x) to_value_wrapper_unknown(x, CIBarcodeDescriptor)
#define is_value_CIBarcodeDescriptor(x) is_value_wrapper_unknown(x, CIBarcodeDescriptor)

NAN_GETTER(NVNBarcodeObservation::barcodeDescriptorGetter) {
  JS_UNWRAP(VNBarcodeObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBarcodeDescriptor([self barcodeDescriptor]));
  }
}

NAN_GETTER(NVNBarcodeObservation::payloadStringValueGetter) {
  JS_UNWRAP(VNBarcodeObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self payloadStringValue]));
  }
}
