//
//  CAEmitterCell.mm
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCAEmitterCell.h"
#include "NUIImage.h"

#define instancetype CAEmitterCell
#define js_value_instancetype js_value_CAEmitterCell

NCAEmitterCell::NCAEmitterCell () {}
NCAEmitterCell::~NCAEmitterCell () {}

JS_INIT_CLASS(CAEmitterCell, NSObject);
  JS_ASSIGN_STATIC_METHOD(emitterCell);
  JS_ASSIGN_STATIC_METHOD(defaultValueForKey);
  JS_ASSIGN_PROTO_METHOD(shouldArchiveValueForKey);
  JS_ASSIGN_PROTO_PROP(name);
  JS_ASSIGN_PROTO_PROP(isEnabled);
  JS_ASSIGN_PROTO_PROP(birthRate);
  JS_ASSIGN_PROTO_PROP(lifetime);
  JS_ASSIGN_PROTO_PROP(lifetimeRange);
  JS_ASSIGN_PROTO_PROP(emissionLatitude);
  JS_ASSIGN_PROTO_PROP(emissionLongitude);
  JS_ASSIGN_PROTO_PROP(emissionRange);
  JS_ASSIGN_PROTO_PROP(velocity);
  JS_ASSIGN_PROTO_PROP(velocityRange);
  JS_ASSIGN_PROTO_PROP(xAcceleration);
  JS_ASSIGN_PROTO_PROP(yAcceleration);
  JS_ASSIGN_PROTO_PROP(zAcceleration);
  JS_ASSIGN_PROTO_PROP(scale);
  JS_ASSIGN_PROTO_PROP(scaleRange);
  JS_ASSIGN_PROTO_PROP(scaleSpeed);
  JS_ASSIGN_PROTO_PROP(spin);
  JS_ASSIGN_PROTO_PROP(spinRange);
  JS_ASSIGN_PROTO_PROP(color);
  JS_ASSIGN_PROTO_PROP(redRange);
  JS_ASSIGN_PROTO_PROP(greenRange);
  JS_ASSIGN_PROTO_PROP(blueRange);
  JS_ASSIGN_PROTO_PROP(alphaRange);
  JS_ASSIGN_PROTO_PROP(redSpeed);
  JS_ASSIGN_PROTO_PROP(greenSpeed);
  JS_ASSIGN_PROTO_PROP(blueSpeed);
  JS_ASSIGN_PROTO_PROP(alphaSpeed);
  JS_ASSIGN_PROTO_PROP(contents);
  JS_ASSIGN_PROTO_PROP(contentsRect);
  JS_ASSIGN_PROTO_PROP(contentsScale);
  JS_ASSIGN_PROTO_PROP(minificationFilter);
  JS_ASSIGN_PROTO_PROP(magnificationFilter);
  JS_ASSIGN_PROTO_PROP(minificationFilterBias);
  JS_ASSIGN_PROTO_PROP(emitterCells);
  JS_ASSIGN_PROTO_PROP(style);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CAEmitterCell, NSObject);
  JS_ASSIGN_METHOD(ctor, emitterCell);
JS_INIT_CLASS_END(CAEmitterCell, NSObject);

NAN_METHOD(NCAEmitterCell::New) {
  JS_RECONSTRUCT(CAEmitterCell);

  Local<Object> obj = info.This();

  NCAEmitterCell *ui = new NCAEmitterCell();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge CAEmitterCell *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[CAEmitterCell alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NCAEmitterCell::emitterCell) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([CAEmitterCell emitterCell]));
  }
}

NAN_METHOD(NCAEmitterCell::defaultValueForKey) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_id([CAEmitterCell defaultValueForKey: key]));
  }
}

NAN_METHOD(NCAEmitterCell::shouldArchiveValueForKey) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_BOOL([self shouldArchiveValueForKey: key]));
  }
}

NAN_GETTER(NCAEmitterCell::nameGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NCAEmitterCell::nameSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}

NAN_GETTER(NCAEmitterCell::isEnabledGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEnabled]));
  }
}

NAN_SETTER(NCAEmitterCell::isEnabledSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEnabled: input];
  }
}

NAN_GETTER(NCAEmitterCell::birthRateGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self birthRate]));
  }
}

NAN_SETTER(NCAEmitterCell::birthRateSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setBirthRate: input];
  }
}

NAN_GETTER(NCAEmitterCell::lifetimeGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self lifetime]));
  }
}

NAN_SETTER(NCAEmitterCell::lifetimeSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setLifetime: input];
  }
}

NAN_GETTER(NCAEmitterCell::lifetimeRangeGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self lifetimeRange]));
  }
}

NAN_SETTER(NCAEmitterCell::lifetimeRangeSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setLifetimeRange: input];
  }
}

NAN_GETTER(NCAEmitterCell::emissionLatitudeGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self emissionLatitude]));
  }
}

NAN_SETTER(NCAEmitterCell::emissionLatitudeSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setEmissionLatitude: input];
  }
}

NAN_GETTER(NCAEmitterCell::emissionLongitudeGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self emissionLongitude]));
  }
}

NAN_SETTER(NCAEmitterCell::emissionLongitudeSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setEmissionLongitude: input];
  }
}

NAN_GETTER(NCAEmitterCell::emissionRangeGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self emissionRange]));
  }
}

NAN_SETTER(NCAEmitterCell::emissionRangeSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setEmissionRange: input];
  }
}

NAN_GETTER(NCAEmitterCell::velocityGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self velocity]));
  }
}

NAN_SETTER(NCAEmitterCell::velocitySetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setVelocity: input];
  }
}

NAN_GETTER(NCAEmitterCell::velocityRangeGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self velocityRange]));
  }
}

NAN_SETTER(NCAEmitterCell::velocityRangeSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setVelocityRange: input];
  }
}

NAN_GETTER(NCAEmitterCell::xAccelerationGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self xAcceleration]));
  }
}

NAN_SETTER(NCAEmitterCell::xAccelerationSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setXAcceleration: input];
  }
}

NAN_GETTER(NCAEmitterCell::yAccelerationGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self yAcceleration]));
  }
}

NAN_SETTER(NCAEmitterCell::yAccelerationSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setYAcceleration: input];
  }
}

NAN_GETTER(NCAEmitterCell::zAccelerationGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self zAcceleration]));
  }
}

NAN_SETTER(NCAEmitterCell::zAccelerationSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setZAcceleration: input];
  }
}

NAN_GETTER(NCAEmitterCell::scaleGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self scale]));
  }
}

NAN_SETTER(NCAEmitterCell::scaleSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setScale: input];
  }
}

NAN_GETTER(NCAEmitterCell::scaleRangeGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self scaleRange]));
  }
}

NAN_SETTER(NCAEmitterCell::scaleRangeSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setScaleRange: input];
  }
}

NAN_GETTER(NCAEmitterCell::scaleSpeedGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self scaleSpeed]));
  }
}

NAN_SETTER(NCAEmitterCell::scaleSpeedSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setScaleSpeed: input];
  }
}

NAN_GETTER(NCAEmitterCell::spinGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self spin]));
  }
}

NAN_SETTER(NCAEmitterCell::spinSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSpin: input];
  }
}

NAN_GETTER(NCAEmitterCell::spinRangeGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self spinRange]));
  }
}

NAN_SETTER(NCAEmitterCell::spinRangeSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSpinRange: input];
  }
}

NAN_GETTER(NCAEmitterCell::colorGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGColorRef([self color]));
  }
}

NAN_SETTER(NCAEmitterCell::colorSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGColorRef, input);
    [self setColor: input];
  }
}

NAN_GETTER(NCAEmitterCell::redRangeGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self redRange]));
  }
}

NAN_SETTER(NCAEmitterCell::redRangeSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setRedRange: input];
  }
}

NAN_GETTER(NCAEmitterCell::greenRangeGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self greenRange]));
  }
}

NAN_SETTER(NCAEmitterCell::greenRangeSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setGreenRange: input];
  }
}

NAN_GETTER(NCAEmitterCell::blueRangeGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self blueRange]));
  }
}

NAN_SETTER(NCAEmitterCell::blueRangeSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setBlueRange: input];
  }
}

NAN_GETTER(NCAEmitterCell::alphaRangeGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self alphaRange]));
  }
}

NAN_SETTER(NCAEmitterCell::alphaRangeSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setAlphaRange: input];
  }
}

NAN_GETTER(NCAEmitterCell::redSpeedGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self redSpeed]));
  }
}

NAN_SETTER(NCAEmitterCell::redSpeedSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setRedSpeed: input];
  }
}

NAN_GETTER(NCAEmitterCell::greenSpeedGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self greenSpeed]));
  }
}

NAN_SETTER(NCAEmitterCell::greenSpeedSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setGreenSpeed: input];
  }
}

NAN_GETTER(NCAEmitterCell::blueSpeedGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self blueSpeed]));
  }
}

NAN_SETTER(NCAEmitterCell::blueSpeedSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setBlueSpeed: input];
  }
}

NAN_GETTER(NCAEmitterCell::alphaSpeedGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self alphaSpeed]));
  }
}

NAN_SETTER(NCAEmitterCell::alphaSpeedSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setAlphaSpeed: input];
  }
}

NAN_GETTER(NCAEmitterCell::contentsGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self contents]));
  }
}

NAN_SETTER(NCAEmitterCell::contentsSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id, input);
    if ([input isKindOfClass:[UIImage class]]) {
      UIImage* img = (UIImage*)input;
      [self setContents: (id)[img CGImage]];
    } else {
      [self setContents: input];
    }
  }
}

NAN_GETTER(NCAEmitterCell::contentsRectGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self contentsRect]));
  }
}

NAN_SETTER(NCAEmitterCell::contentsRectSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGRect, input);
    [self setContentsRect: input];
  }
}

NAN_GETTER(NCAEmitterCell::contentsScaleGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self contentsScale]));
  }
}

NAN_SETTER(NCAEmitterCell::contentsScaleSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setContentsScale: input];
  }
}

NAN_GETTER(NCAEmitterCell::minificationFilterGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self minificationFilter]));
  }
}

NAN_SETTER(NCAEmitterCell::minificationFilterSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setMinificationFilter: input];
  }
}

NAN_GETTER(NCAEmitterCell::magnificationFilterGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self magnificationFilter]));
  }
}

NAN_SETTER(NCAEmitterCell::magnificationFilterSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setMagnificationFilter: input];
  }
}

NAN_GETTER(NCAEmitterCell::minificationFilterBiasGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self minificationFilterBias]));
  }
}

NAN_SETTER(NCAEmitterCell::minificationFilterBiasSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setMinificationFilterBias: input];
  }
}

NAN_GETTER(NCAEmitterCell::emitterCellsGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<CAEmitterCell*>([self emitterCells]));
  }
}

NAN_SETTER(NCAEmitterCell::emitterCellsSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<CAEmitterCell*>, input);
    [self setEmitterCells: input];
  }
}

NAN_GETTER(NCAEmitterCell::styleGetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary([self style]));
  }
}

NAN_SETTER(NCAEmitterCell::styleSetter) {
  JS_UNWRAP(CAEmitterCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary, input);
    [self setStyle: input];
  }
}
