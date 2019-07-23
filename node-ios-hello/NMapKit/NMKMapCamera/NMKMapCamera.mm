//
//  NMKMapCamera.mm
//
//  Created by Shawn Presser on 6/23/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMKMapCamera.h"

#define instancetype MKMapCamera
#define js_value_instancetype js_value_MKMapCamera

NMKMapCamera::NMKMapCamera() {}
NMKMapCamera::~NMKMapCamera() {}

JS_INIT_CLASS(MKMapCamera, NSObject);
  JS_ASSIGN_STATIC_METHOD(camera);
  JS_ASSIGN_STATIC_METHOD(cameraLookingAtCenterCoordinateFromEyeCoordinateEyeAltitude);
  JS_ASSIGN_STATIC_METHOD(cameraLookingAtCenterCoordinateFromDistancePitchHeading);
  JS_ASSIGN_PROTO_PROP(centerCoordinate);
  JS_ASSIGN_PROTO_PROP(heading);
  JS_ASSIGN_PROTO_PROP(pitch);
  JS_ASSIGN_PROTO_PROP(altitude);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MKMapCamera, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MKMapCamera, NSObject);

NAN_METHOD(NMKMapCamera::New) {
  JS_RECONSTRUCT(MKMapCamera);
  @autoreleasepool {
    MKMapCamera* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MKMapCamera *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MKMapCamera alloc] init];
    }
    if (self) {
      NMKMapCamera *wrapper = new NMKMapCamera();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MKMapCamera::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMKMapCamera::camera) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([MKMapCamera camera]));
  }
}

#include "NCLLocation.h"

NAN_METHOD(NMKMapCamera::cameraLookingAtCenterCoordinateFromEyeCoordinateEyeAltitude) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CLLocationCoordinate2D, centerCoordinate);
    declare_value(CLLocationCoordinate2D, eyeCoordinate);
    declare_value(CLLocationDistance, eyeAltitude);
    JS_SET_RETURN(js_value_instancetype([MKMapCamera cameraLookingAtCenterCoordinate: centerCoordinate fromEyeCoordinate: eyeCoordinate eyeAltitude: eyeAltitude]));
  }
}

NAN_METHOD(NMKMapCamera::cameraLookingAtCenterCoordinateFromDistancePitchHeading) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CLLocationCoordinate2D, centerCoordinate);
    declare_value(CLLocationDistance, distance);
    declare_value(CGFloat, pitch);
    declare_value(CLLocationDirection, heading);
    JS_SET_RETURN(js_value_instancetype([MKMapCamera cameraLookingAtCenterCoordinate: centerCoordinate fromDistance: distance pitch: pitch heading: heading]));
  }
}

NAN_GETTER(NMKMapCamera::centerCoordinateGetter) {
  JS_UNWRAP(MKMapCamera, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationCoordinate2D([self centerCoordinate]));
  }
}

NAN_SETTER(NMKMapCamera::centerCoordinateSetter) {
  JS_UNWRAP(MKMapCamera, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CLLocationCoordinate2D, input);
    [self setCenterCoordinate: input];
  }
}

NAN_GETTER(NMKMapCamera::headingGetter) {
  JS_UNWRAP(MKMapCamera, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationDirection([self heading]));
  }
}

NAN_SETTER(NMKMapCamera::headingSetter) {
  JS_UNWRAP(MKMapCamera, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CLLocationDirection, input);
    [self setHeading: input];
  }
}

NAN_GETTER(NMKMapCamera::pitchGetter) {
  JS_UNWRAP(MKMapCamera, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self pitch]));
  }
}

NAN_SETTER(NMKMapCamera::pitchSetter) {
  JS_UNWRAP(MKMapCamera, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setPitch: input];
  }
}

NAN_GETTER(NMKMapCamera::altitudeGetter) {
  JS_UNWRAP(MKMapCamera, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationDistance([self altitude]));
  }
}

NAN_SETTER(NMKMapCamera::altitudeSetter) {
  JS_UNWRAP(MKMapCamera, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CLLocationDistance, input);
    [self setAltitude: input];
  }
}
