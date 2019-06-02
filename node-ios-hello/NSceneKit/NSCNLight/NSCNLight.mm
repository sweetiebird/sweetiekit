//
//  NSCNLight.mm
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNLight.h"

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
JS_INIT_CLASS_END(SCNLight, NSObject);

NAN_METHOD(NSCNLight::New) {
  Nan::HandleScope scope;

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
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  JS_SET_RETURN(JS_STR([[light type] UTF8String]));
}

NAN_SETTER(NSCNLight::typeSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  std::string t;
  if (value->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(value));
    t = *utf8Value;
  } else {
    Nan::ThrowError("SCNLight:setType: invaid argument");
    return;
  }
  
  @autoreleasepool {
    NSString *str = [NSString stringWithUTF8String:t.c_str()];
    SCNLightType type = SCNLightTypeAmbient;

    if ([str isEqualToString:@"spot"]) {
      type = SCNLightTypeSpot;
    } else if ([str isEqualToString:@"IES"]) {
      type = SCNLightTypeIES;
    } else if ([str isEqualToString:@"ambient"]) {
      type = SCNLightTypeAmbient;
    } else if ([str isEqualToString:@"omni"]) {
      type = SCNLightTypeOmni;
    } else if ([str isEqualToString:@"directional"]) {
      type = SCNLightTypeDirectional;
    } else if ([str isEqualToString:@"probe"]) {
      type = SCNLightTypeProbe;
    } else {
      Nan::ThrowError("No valid light type specified");
      return;
    }

    [light setType:type];
  }
}

NAN_GETTER(NSCNLight::colorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);
  
  __block CGFloat red = 0;
  __block CGFloat green = 0;
  __block CGFloat blue = 0;
  __block CGFloat alpha = 1;
  @autoreleasepool {
    UIColor *color = [light color];
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(red));
  result->Set(JS_STR("green"), JS_NUM(green));
  result->Set(JS_STR("blue"), JS_NUM(blue));
  result->Set(JS_STR("alpha"), JS_NUM(alpha));

  JS_SET_RETURN(result);
}

NAN_SETTER(NSCNLight::colorSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  double red = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
  double green = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
  double blue = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
  double alpha = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;

  @autoreleasepool {
    UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    [light setColor:color];
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
