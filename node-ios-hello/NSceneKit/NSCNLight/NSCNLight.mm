//
//  NSCNLight.mm
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNLight.h"

#define instancetype SCNLight
#define js_value_instancetype js_value_SCNLight

NSCNLight::NSCNLight () {}
NSCNLight::~NSCNLight () {}

JS_INIT_CLASS(SCNLight, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, type);
  JS_ASSIGN_PROP(proto, color);
  JS_ASSIGN_PROP(proto, spotInnerAngle);
  JS_ASSIGN_PROP(proto, spotOuterAngle);
  JS_ASSIGN_PROP(proto, temperature);
  JS_ASSIGN_PROP(proto, intensity);
  JS_ASSIGN_PROP(proto, zNear);
  JS_ASSIGN_PROP(proto, zFar);
  JS_ASSIGN_PROP(proto, attenuationStartDistance);
  JS_ASSIGN_PROP(proto, attenuationEndDistance);
  JS_ASSIGN_PROP(proto, attenuationFalloffExponent);
  // static members (ctor)
  JS_INIT_CTOR(SCNLight, NSObject);
  // constants (exports)

  //typedef NSString * SCNLightType NS_STRING_ENUM;
  JS_ASSIGN_ENUM(SCNLightTypeAmbient, NSString); //                                                    // Ambient light
  JS_ASSIGN_ENUM(SCNLightTypeOmni, NSString); //                                                       // Omnidirectional light
  JS_ASSIGN_ENUM(SCNLightTypeDirectional, NSString); //                                                // Directional light
  JS_ASSIGN_ENUM(SCNLightTypeSpot, NSString); //                                                       // Spot light
  JS_ASSIGN_ENUM(SCNLightTypeIES, NSString); //    API_AVAILABLE(macos(10.12), ios(10.0), tvos(10.0)); // IES light
  JS_ASSIGN_ENUM(SCNLightTypeProbe, NSString); //  API_AVAILABLE(macos(10.12), ios(10.0), tvos(10.0)); // Light probe

  /*! @enum SCNShadowMode
   @abstract The different modes available to compute shadows.
   @discussion When the shadow mode is set to SCNShadowModeForward, shadows are computed while computing the lighting. In this mode only the alpha component of the shadow color is used to alter the lighting contribution.
   When the shadow mode is set to SCNShadowModeDeferred shadows are applied as a post process. Shadows are blend over the final image and can therefor be of any arbitrary color. However it is most of the time less efficient than SCNShadowModeForward, except when a scene has a lot of overdraw.
   When the shadow mode is set to SCNShadowModeModulated the light doesn't illuminate the scene anymore, it only casts shadows. Therefore setting the light color has no effect. In this mode gobos act as a shadow projector: the gobo image is modulated with the shadow receiver's fragments. The typical usage is to use an image of a radial gradient (black to white) that is projected under a character (and use the categoryBitMask of the light and nodes to exclude the character from the shadow receiver).
   */
  //typedef NS_ENUM(NSInteger, SCNShadowMode) {
    JS_ASSIGN_ENUM(SCNShadowModeForward, NSInteger); //    = 0,
    JS_ASSIGN_ENUM(SCNShadowModeDeferred, NSInteger); //   = 1,
    JS_ASSIGN_ENUM(SCNShadowModeModulated, NSInteger); //  = 2
  //} API_AVAILABLE(macos(10.10));

// SCNLight
  JS_ASSIGN_STATIC_METHOD(lightWithMDLLight);
JS_INIT_CLASS_END(SCNLight, NSObject);

NAN_METHOD(NSCNLight::New) {
  JS_RECONSTRUCT(SCNLight);

  Local<Object> obj = info.This();

  NSCNLight *lt = new NSCNLight();

  if (info[0]->IsExternal()) {
    lt->SetNSObject((__bridge SCNLight *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      lt->SetNSObject([SCNLight light]);
    }
  }
  lt->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_GETTER(NSCNLight::typeGetter) {
  JS_UNWRAP(SCNLight, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNLightType([self type]));
  }
}

NAN_SETTER(NSCNLight::typeSetter) {
  JS_UNWRAP(SCNLight, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNLightType, input);
    [self setType: input];
  }
}

NAN_GETTER(NSCNLight::colorGetter) {
  JS_UNWRAP(SCNLight, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self color]));
  }
}

NAN_SETTER(NSCNLight::colorSetter) {
  JS_UNWRAP(SCNLight, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id, input);
    [self setColor: input];
  }
}

NAN_GETTER(NSCNLight::spotInnerAngleGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);
  
  JS_SET_RETURN(JS_FLOAT([light spotInnerAngle]));
}

NAN_SETTER(NSCNLight::spotInnerAngleSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  float fValue = TO_FLOAT(value);

  @autoreleasepool {
    [light setSpotInnerAngle:fValue];
  }
}

NAN_GETTER(NSCNLight::spotOuterAngleGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);
  
  JS_SET_RETURN(JS_FLOAT([light spotOuterAngle]));
}

NAN_SETTER(NSCNLight::spotOuterAngleSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  float fValue = TO_FLOAT(value);

  @autoreleasepool {
    [light setSpotOuterAngle:fValue];
  }
}

NAN_GETTER(NSCNLight::temperatureGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);
  
  JS_SET_RETURN(JS_FLOAT([light temperature]));
}

NAN_SETTER(NSCNLight::temperatureSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  float fValue = TO_FLOAT(value);

  @autoreleasepool {
    [light setTemperature:fValue];
  }
}

NAN_GETTER(NSCNLight::intensityGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);
  
  JS_SET_RETURN(JS_FLOAT([light intensity]));
}

NAN_SETTER(NSCNLight::intensitySetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  float fValue = TO_FLOAT(value);

  @autoreleasepool {
    [light setIntensity:fValue];
  }
}

NAN_GETTER(NSCNLight::zNearGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);
  
  JS_SET_RETURN(JS_FLOAT([light zNear]));
}

NAN_SETTER(NSCNLight::zNearSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  float fValue = TO_FLOAT(value);

  @autoreleasepool {
    [light setZNear:fValue];
  }
}

NAN_GETTER(NSCNLight::zFarGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);
  
  JS_SET_RETURN(JS_FLOAT([light zFar]));
}

NAN_SETTER(NSCNLight::zFarSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  float fValue = TO_FLOAT(value);

  @autoreleasepool {
    [light setZFar:fValue];
  }
}

NAN_GETTER(NSCNLight::attenuationStartDistanceGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);
  
  JS_SET_RETURN(JS_FLOAT([light attenuationStartDistance]));
}

NAN_SETTER(NSCNLight::attenuationStartDistanceSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  float fValue = TO_FLOAT(value);

  @autoreleasepool {
    [light setAttenuationStartDistance:fValue];
  }
}

NAN_GETTER(NSCNLight::attenuationEndDistanceGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);
  
  JS_SET_RETURN(JS_FLOAT([light attenuationEndDistance]));
}

NAN_SETTER(NSCNLight::attenuationEndDistanceSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  float fValue = TO_FLOAT(value);

  @autoreleasepool {
    [light setAttenuationEndDistance:fValue];
  }
}

NAN_GETTER(NSCNLight::attenuationFalloffExponentGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);
  
  JS_SET_RETURN(JS_FLOAT([light attenuationFalloffExponent]));
}

NAN_SETTER(NSCNLight::attenuationFalloffExponentSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  float fValue = TO_FLOAT(value);

  @autoreleasepool {
    [light setAttenuationFalloffExponent:fValue];
  }
}

#include "NMDLLight.h"

NAN_METHOD(NSCNLight::lightWithMDLLight) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLLight, mdlLight);
    JS_SET_RETURN(js_value_instancetype([SCNLight lightWithMDLLight: mdlLight]));
  }
}
