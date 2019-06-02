//
//  NSKEmitterNode.mm
//
//  Created by Emily Kolar on 2019-5-27.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKEmitterNode.h"

JS_INIT_CLASS(SKEmitterNode, SKNode);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, particleTexture);
  JS_ASSIGN_PROP(proto, particleBlendMode);
  JS_ASSIGN_PROP(proto, particleColor);
  JS_ASSIGN_PROP(proto, particleColorRedRange);
  JS_ASSIGN_PROP(proto, particleColorGreenRange);
  JS_ASSIGN_PROP(proto, particleColorBlueRange);
  JS_ASSIGN_PROP(proto, particleColorAlphaRange);
  JS_ASSIGN_PROP(proto, particleColorRedSpeed);
  JS_ASSIGN_PROP(proto, particleColorGreenSpeed);
  JS_ASSIGN_PROP(proto, particleColorBlueSpeed);
  JS_ASSIGN_PROP(proto, particleColorAlphaSpeed);
  JS_ASSIGN_PROP(proto, particleColorSequence);
  JS_ASSIGN_PROP(proto, particleColorBlendFactor);
  JS_ASSIGN_PROP(proto, particleColorBlendFactorRange);
  JS_ASSIGN_PROP(proto, particleColorBlendFactorSpeed);
  JS_ASSIGN_PROP(proto, particleColorBlendFactorSequence);
  JS_ASSIGN_PROP(proto, particlePosition);
  JS_ASSIGN_PROP(proto, particlePositionRange);
  JS_ASSIGN_PROP(proto, particleSpeed);
  JS_ASSIGN_PROP(proto, particleSpeedRange);
  JS_ASSIGN_PROP(proto, emissionAngle);
  JS_ASSIGN_PROP(proto, emissionAngleRange);
  JS_ASSIGN_PROP(proto, xAcceleration);
  JS_ASSIGN_PROP(proto, yAcceleration);
  JS_ASSIGN_PROP(proto, particleBirthRate);
  JS_ASSIGN_PROP(proto, numParticlesToEmit);
  JS_ASSIGN_PROP(proto, particleLifetime);
  JS_ASSIGN_PROP(proto, particleLifetimeRange);
  JS_ASSIGN_PROP(proto, particleRotation);
  JS_ASSIGN_PROP(proto, particleRotationRange);
  JS_ASSIGN_PROP(proto, particleRotationSpeed);
  JS_ASSIGN_PROP(proto, particleSize);
  JS_ASSIGN_PROP(proto, particleScale);
  JS_ASSIGN_PROP(proto, particleScaleRange);
  JS_ASSIGN_PROP(proto, particleScaleSpeed);
  JS_ASSIGN_PROP(proto, particleScaleSequence);
  JS_ASSIGN_PROP(proto, particleAlpha);
  JS_ASSIGN_PROP(proto, particleAlphaRange);
  JS_ASSIGN_PROP(proto, particleAlphaSpeed);
  JS_ASSIGN_PROP(proto, particleAlphaSequence);
  JS_ASSIGN_PROP(proto, particleAction);
  JS_ASSIGN_PROP(proto, fieldBitMask);
  JS_ASSIGN_PROP(proto, targetNode);
  JS_ASSIGN_PROP(proto, shader);
  JS_ASSIGN_PROP(proto, attributeValues);
  JS_ASSIGN_PROP(proto, particleZPosition);
  JS_ASSIGN_PROP(proto, particleRenderOrder);
  JS_ASSIGN_PROP(proto, particleZPositionRange);
  JS_ASSIGN_PROP(proto, particleZPositionSpeed);
  // static members (ctor)
  JS_INIT_CTOR(SKEmitterNode, SKNode);
JS_INIT_CLASS_END(SKEmitterNode, SKNode);

NAN_METHOD(NSKEmitterNode::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKEmitterNode *ui = new NSKEmitterNode();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SKEmitterNode *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    @autoreleasepool {
      ui->SetNSObject([SKEmitterNode nodeWithFileNamed:NJSStringToNSString(info[0])]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NSKEmitterNode::NSKEmitterNode () {}
NSKEmitterNode::~NSKEmitterNode () {}

#include "NSKTexture.h"

NAN_GETTER(NSKEmitterNode::particleTextureGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKTexture([self particleTexture]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleTextureSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleTexture: to_value_SKTexture(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleBlendModeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKBlendMode([self particleBlendMode]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleBlendModeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleBlendMode: to_value_SKBlendMode(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleColorGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKColor([self particleColor]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleColorSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleColor: to_value_SKColor(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleColorRedRangeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleColorRedRange]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleColorRedRangeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleColorRedRange: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleColorGreenRangeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleColorGreenRange]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleColorGreenRangeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleColorGreenRange: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleColorBlueRangeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleColorBlueRange]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleColorBlueRangeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleColorBlueRange: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleColorAlphaRangeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleColorAlphaRange]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleColorAlphaRangeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleColorAlphaRange: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleColorRedSpeedGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleColorRedSpeed]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleColorRedSpeedSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleColorRedSpeed: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleColorGreenSpeedGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleColorGreenSpeed]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleColorGreenSpeedSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleColorGreenSpeed: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleColorBlueSpeedGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleColorBlueSpeed]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleColorBlueSpeedSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleColorBlueSpeed: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleColorAlphaSpeedGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleColorAlphaSpeed]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleColorAlphaSpeedSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleColorAlphaSpeed: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleColorSequenceGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKKeyframeSequence([self particleColorSequence]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleColorSequenceSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleColorSequence: to_value_SKKeyframeSequence(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleColorBlendFactorGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleColorBlendFactor]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleColorBlendFactorSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleColorBlendFactor: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleColorBlendFactorRangeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleColorBlendFactorRange]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleColorBlendFactorRangeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleColorBlendFactorRange: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleColorBlendFactorSpeedGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleColorBlendFactorSpeed]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleColorBlendFactorSpeedSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleColorBlendFactorSpeed: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleColorBlendFactorSequenceGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKKeyframeSequence([self particleColorBlendFactorSequence]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleColorBlendFactorSequenceSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleColorBlendFactorSequence: to_value_SKKeyframeSequence(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particlePositionGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGPoint([self particlePosition]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particlePositionSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticlePosition: to_value_CGPoint(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particlePositionRangeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGVector([self particlePositionRange]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particlePositionRangeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticlePositionRange: to_value_CGVector(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleSpeedGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleSpeed]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleSpeedSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleSpeed: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleSpeedRangeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleSpeedRange]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleSpeedRangeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleSpeedRange: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::emissionAngleGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self emissionAngle]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::emissionAngleSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setEmissionAngle: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::emissionAngleRangeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self emissionAngleRange]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::emissionAngleRangeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setEmissionAngleRange: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::xAccelerationGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self xAcceleration]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::xAccelerationSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setXAcceleration: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::yAccelerationGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self yAcceleration]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::yAccelerationSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setYAcceleration: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleBirthRateGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleBirthRate]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleBirthRateSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleBirthRate: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::numParticlesToEmitGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSUInteger([self numParticlesToEmit]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::numParticlesToEmitSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setNumParticlesToEmit: to_value_NSUInteger(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleLifetimeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleLifetime]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleLifetimeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleLifetime: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleLifetimeRangeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleLifetimeRange]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleLifetimeRangeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleLifetimeRange: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleRotationGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleRotation]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleRotationSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleRotation: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleRotationRangeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleRotationRange]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleRotationRangeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleRotationRange: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleRotationSpeedGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleRotationSpeed]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleRotationSpeedSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleRotationSpeed: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleSizeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGSize([self particleSize]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleSizeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleSize: to_value_CGSize(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleScaleGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleScale]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleScaleSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleScale: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleScaleRangeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleScaleRange]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleScaleRangeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleScaleRange: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleScaleSpeedGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleScaleSpeed]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleScaleSpeedSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleScaleSpeed: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleScaleSequenceGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_SKKeyframeSequence([self particleScaleSequence]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleScaleSequenceSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
//    [self setParticleScaleSequence: to_value_SKKeyframeSequence(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleAlphaGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleAlpha]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleAlphaSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleAlpha: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleAlphaRangeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleAlphaRange]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleAlphaRangeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleAlphaRange: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleAlphaSpeedGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleAlphaSpeed]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleAlphaSpeedSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleAlphaSpeed: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleAlphaSequenceGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_SKKeyframeSequence([self particleAlphaSequence]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleAlphaSequenceSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
//    [self setParticleAlphaSequence: to_value_SKKeyframeSequence(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleActionGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_SKAction([self particleAction]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleActionSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
//    [self setParticleAction: to_value_SKAction(value)];
  }
}

NAN_GETTER(NSKEmitterNode::fieldBitMaskGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_INT([self fieldBitMask]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::fieldBitMaskSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setFieldBitMask: TO_UINT32(value)];
  }
}

NAN_GETTER(NSKEmitterNode::targetNodeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_SKNode([self targetNode]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::targetNodeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
//    [self setTargetNode: to_value_SKNode(value)];
  }
}

NAN_GETTER(NSKEmitterNode::shaderGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_SKShader([self shader]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::shaderSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
//    [self setShader: to_value_SKShader(value)];
  }
}

NAN_GETTER(NSKEmitterNode::attributeValuesGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_NSDictionary<NSString4232SKAttributeValue4232>([self attributeValues]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::attributeValuesSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
//    [self setAttributeValues: to_value_NSDictionary<NSString4232SKAttributeValue4232>(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleZPositionGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleZPosition]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleZPositionSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleZPosition: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleRenderOrderGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_SKParticleRenderOrder([self particleRenderOrder]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleRenderOrderSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
//    [self setParticleRenderOrder: to_value_SKParticleRenderOrder(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleZPositionRangeGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleZPositionRange]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleZPositionRangeSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleZPositionRange: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKEmitterNode::particleZPositionSpeedGetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self particleZPositionSpeed]));
    return;
  }
}

NAN_SETTER(NSKEmitterNode::particleZPositionSpeedSetter) {
  JS_UNWRAP(SKEmitterNode, self);
  @autoreleasepool
  {
    [self setParticleZPositionSpeed: TO_FLOAT(value)];
  }
}
