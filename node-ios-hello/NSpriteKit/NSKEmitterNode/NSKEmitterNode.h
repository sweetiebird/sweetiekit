//
//  NNSKEmitterNode.h
//
//  Created by Emily Kolar on 2019-5-27.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSKEmitterNode_h
#define NNSKEmitterNode_h    

#include "NSKNode.h"

#define js_value_SKEmitterNode(x) js_value_wrapper(x, SKEmitterNode)
#define to_value_SKEmitterNode(x) to_value_wrapper(x, SKEmitterNode)
#define is_value_SKEmitterNode(x) is_value_wrapper(x, SKEmitterNode)

#define js_value_SKBlendMode(x) JS_ENUM(SKBlendMode, NSInteger, x)
#define to_value_SKBlendMode(x) TO_ENUM(SKBlendMode, NSInteger, x)
#define is_value_SKBlendMode(x) IS_ENUM(SKBlendMode, NSInteger, x)

JS_WRAP_CLASS(SKEmitterNode, SKNode);
  JS_PROP(particleTexture);
  JS_PROP(particleBlendMode);
  JS_PROP(particleColor);
  JS_PROP(particleColorRedRange);
  JS_PROP(particleColorGreenRange);
  JS_PROP(particleColorBlueRange);
  JS_PROP(particleColorAlphaRange);
  JS_PROP(particleColorRedSpeed);
  JS_PROP(particleColorGreenSpeed);
  JS_PROP(particleColorBlueSpeed);
  JS_PROP(particleColorAlphaSpeed);
  JS_PROP(particleColorSequence);
  JS_PROP(particleColorBlendFactor);
  JS_PROP(particleColorBlendFactorRange);
  JS_PROP(particleColorBlendFactorSpeed);
  JS_PROP(particleColorBlendFactorSequence);
  JS_PROP(particlePosition);
  JS_PROP(particlePositionRange);
  JS_PROP(particleSpeed);
  JS_PROP(particleSpeedRange);
  JS_PROP(emissionAngle);
  JS_PROP(emissionAngleRange);
  JS_PROP(xAcceleration);
  JS_PROP(yAcceleration);
  JS_PROP(particleBirthRate);
  JS_PROP(numParticlesToEmit);
  JS_PROP(particleLifetime);
  JS_PROP(particleLifetimeRange);
  JS_PROP(particleRotation);
  JS_PROP(particleRotationRange);
  JS_PROP(particleRotationSpeed);
  JS_PROP(particleSize);
  JS_PROP(particleScale);
  JS_PROP(particleScaleRange);
  JS_PROP(particleScaleSpeed);
  JS_PROP(particleScaleSequence);
  JS_PROP(particleAlpha);
  JS_PROP(particleAlphaRange);
  JS_PROP(particleAlphaSpeed);
  JS_PROP(particleAlphaSequence);
  JS_PROP(particleAction);
  JS_PROP(fieldBitMask);
  JS_PROP(targetNode);
  JS_PROP(shader);
  JS_PROP(attributeValues);
  JS_PROP(particleZPosition);
  JS_PROP(particleRenderOrder);
  JS_PROP(particleZPositionRange);
  JS_PROP(particleZPositionSpeed);
JS_WRAP_CLASS_END(SKEmitterNode);

#endif /* NNSKEmitterNode_h */
