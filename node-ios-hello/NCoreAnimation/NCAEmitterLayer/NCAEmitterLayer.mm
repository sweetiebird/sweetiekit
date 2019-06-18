//
//  CAEmitterLayer.mm
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCAEmitterLayer.h"
#include "NCAEmitterCell.h"

#define instancetype CAEmitterLayer
#define js_value_instancetype js_value_CAEmitterLayer

NCAEmitterLayer::NCAEmitterLayer () {}
NCAEmitterLayer::~NCAEmitterLayer () {}

JS_INIT_CLASS(CAEmitterLayer, CALayer);
  JS_ASSIGN_PROTO_PROP(emitterCells);
  JS_ASSIGN_PROTO_PROP(birthRate);
  JS_ASSIGN_PROTO_PROP(lifetime);
  JS_ASSIGN_PROTO_PROP(emitterPosition);
  JS_ASSIGN_PROTO_PROP(emitterZPosition);
  JS_ASSIGN_PROTO_PROP(emitterSize);
  JS_ASSIGN_PROTO_PROP(emitterDepth);
  JS_ASSIGN_PROTO_PROP(emitterShape);
  JS_ASSIGN_PROTO_PROP(emitterMode);
  JS_ASSIGN_PROTO_PROP(renderMode);
  JS_ASSIGN_PROTO_PROP(preservesDepth);
  JS_ASSIGN_PROTO_PROP(velocity);
  JS_ASSIGN_PROTO_PROP(scale);
  JS_ASSIGN_PROTO_PROP(spin);
  JS_ASSIGN_PROTO_PROP(seed);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CAEmitterLayer, CALayer);
  // constants (exports)

  JS_ASSIGN_ENUM(kCAEmitterLayerPoint, CAEmitterLayerEmitterShape);
  JS_ASSIGN_ENUM(kCAEmitterLayerLine, CAEmitterLayerEmitterShape);
  JS_ASSIGN_ENUM(kCAEmitterLayerRectangle, CAEmitterLayerEmitterShape);
  JS_ASSIGN_ENUM(kCAEmitterLayerCuboid, CAEmitterLayerEmitterShape);
  JS_ASSIGN_ENUM(kCAEmitterLayerCircle, CAEmitterLayerEmitterShape);
  JS_ASSIGN_ENUM(kCAEmitterLayerSphere, CAEmitterLayerEmitterShape);

  JS_ASSIGN_ENUM(kCAEmitterLayerPoints, CAEmitterLayerEmitterMode);
  JS_ASSIGN_ENUM(kCAEmitterLayerOutline, CAEmitterLayerEmitterMode);
  JS_ASSIGN_ENUM(kCAEmitterLayerSurface, CAEmitterLayerEmitterMode);
  JS_ASSIGN_ENUM(kCAEmitterLayerVolume, CAEmitterLayerEmitterMode);

  JS_ASSIGN_ENUM(kCAEmitterLayerUnordered, CAEmitterLayerRenderMode);
  JS_ASSIGN_ENUM(kCAEmitterLayerOldestFirst, CAEmitterLayerRenderMode);
  JS_ASSIGN_ENUM(kCAEmitterLayerOldestLast, CAEmitterLayerRenderMode);
  JS_ASSIGN_ENUM(kCAEmitterLayerBackToFront, CAEmitterLayerRenderMode);
  JS_ASSIGN_ENUM(kCAEmitterLayerAdditive, CAEmitterLayerRenderMode);

JS_INIT_CLASS_END(CAEmitterLayer, CALayer);

NAN_METHOD(NCAEmitterLayer::New) {
  JS_RECONSTRUCT(CAEmitterLayer);

  Local<Object> obj = info.This();

  NCAEmitterLayer *ui = new NCAEmitterLayer();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge CAEmitterLayer *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[CAEmitterLayer alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_GETTER(NCAEmitterLayer::emitterCellsGetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<CAEmitterCell*>([self emitterCells]));
  }
}

NAN_SETTER(NCAEmitterLayer::emitterCellsSetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<CAEmitterCell*>, input);
    [self setEmitterCells: input];
  }
}

NAN_GETTER(NCAEmitterLayer::birthRateGetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self birthRate]));
  }
}

NAN_SETTER(NCAEmitterLayer::birthRateSetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setBirthRate: input];
  }
}

NAN_GETTER(NCAEmitterLayer::lifetimeGetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self lifetime]));
  }
}

NAN_SETTER(NCAEmitterLayer::lifetimeSetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setLifetime: input];
  }
}

NAN_GETTER(NCAEmitterLayer::emitterPositionGetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self emitterPosition]));
  }
}

NAN_SETTER(NCAEmitterLayer::emitterPositionSetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPoint, input);
    [self setEmitterPosition: input];
  }
}

NAN_GETTER(NCAEmitterLayer::emitterZPositionGetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self emitterZPosition]));
  }
}

NAN_SETTER(NCAEmitterLayer::emitterZPositionSetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setEmitterZPosition: input];
  }
}

NAN_GETTER(NCAEmitterLayer::emitterSizeGetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self emitterSize]));
  }
}

NAN_SETTER(NCAEmitterLayer::emitterSizeSetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGSize, input);
    [self setEmitterSize: input];
  }
}

NAN_GETTER(NCAEmitterLayer::emitterDepthGetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self emitterDepth]));
  }
}

NAN_SETTER(NCAEmitterLayer::emitterDepthSetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setEmitterDepth: input];
  }
}

NAN_GETTER(NCAEmitterLayer::emitterShapeGetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CAEmitterLayerEmitterShape([self emitterShape]));
  }
}

NAN_SETTER(NCAEmitterLayer::emitterShapeSetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CAEmitterLayerEmitterShape, input);
    [self setEmitterShape: input];
  }
}

NAN_GETTER(NCAEmitterLayer::emitterModeGetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CAEmitterLayerEmitterMode([self emitterMode]));
  }
}

NAN_SETTER(NCAEmitterLayer::emitterModeSetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CAEmitterLayerEmitterMode, input);
    [self setEmitterMode: input];
  }
}

NAN_GETTER(NCAEmitterLayer::renderModeGetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CAEmitterLayerRenderMode([self renderMode]));
  }
}

NAN_SETTER(NCAEmitterLayer::renderModeSetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CAEmitterLayerRenderMode, input);
    [self setRenderMode: input];
  }
}

NAN_GETTER(NCAEmitterLayer::preservesDepthGetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self preservesDepth]));
  }
}

NAN_SETTER(NCAEmitterLayer::preservesDepthSetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPreservesDepth: input];
  }
}

NAN_GETTER(NCAEmitterLayer::velocityGetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self velocity]));
  }
}

NAN_SETTER(NCAEmitterLayer::velocitySetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setVelocity: input];
  }
}

NAN_GETTER(NCAEmitterLayer::scaleGetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self scale]));
  }
}

NAN_SETTER(NCAEmitterLayer::scaleSetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setScale: input];
  }
}

NAN_GETTER(NCAEmitterLayer::spinGetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self spin]));
  }
}

NAN_SETTER(NCAEmitterLayer::spinSetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setSpin: input];
  }
}

NAN_GETTER(NCAEmitterLayer::seedGetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_uint32_t([self seed]));
  }
}

NAN_SETTER(NCAEmitterLayer::seedSetter) {
  JS_UNWRAP(CAEmitterLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(uint32_t, input);
    [self setSeed: input];
  }
}
